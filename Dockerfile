FROM arm64v8/golang:1.15-stretch AS builder

LABEL autodelete="true"

RUN apt-get -y update \
&& apt-get -y install build-essential wiringpi

WORKDIR /usr/src/app

COPY Makefile .
COPY pkg pkg
COPY go.mod go.mod
COPY cmd cmd

RUN make vendor

RUN make build

FROM raspbian/stretch

WORKDIR /usr/local/bin

RUN apt-get -y update \
&& apt-get -y install wiringpi 

COPY --from=builder /usr/src/app/main ./main

CMD ["./main"]
