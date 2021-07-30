CC      = g++
LDFLAGS = -lwiringPi

.PHONY: all
all: build

.PHONY: build
build:
	go build -mod=vendor cmd/gitlab-api-tool/main.go

.PHONY: vendor
vendor:
	go mod tidy
	go mod vendor

.PHONY: gofmt
gofmt:
	gofmt -l -s -w ./cmd ./pkg

.PHONY: test
test:
	go test ./... -cover -coverprofile coverage.out -race -mod=vendor -v && \
	go tool cover -func=coverage.out

.PHONY: clean
clean:
	rm -f main; \
	rm -f coverage.out

.PHONY: docker
docker:
	docker build -t paulknauer/rpi-gpio-blink .

.PHONY: docker-run
docker-run: docker
	docker run -d --name blink --restart always --cap-add SYS_RAWIO --device /dev/mem paulknauer/rpi-gpio-blink

.PHONY: docker-clean
docker-clean:
	docker stop blink; \
	docker rm -f blink; \
	docker rmi -f paulknauer/rpi-gpio-blink; \
	./autodelete-dangling.sh
