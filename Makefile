CC      = g++
LDFLAGS = -lwiringPi

.PHONY: all
all: main

.PHONY: docker
docker:
	docker build -t paulknauer/rpi-gpio-blink .

.PHONY: docker-run
docker-run: docker
	docker run -d --name blink --restart always --cap-add SYS_RAWIO --device /dev/mem paulknauer/rpi-gpio-blink

main: main.cpp
	$(CC) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean: 
	rm -f *.o main

.PHONY: docker-clean
docker-clean:
	docker stop blink; \
	docker rm -f blink; \
	docker rmi -f paulknauer/rpi-gpio-blink; \
	./autodelete-dangling.sh
