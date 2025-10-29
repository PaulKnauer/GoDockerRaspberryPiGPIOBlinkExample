FROM ubuntu:questing AS builder

LABEL autodelete="true"

RUN apt-get -y update \
&& apt-get -y install build-essential golang wiringpi libwiringpi-dev

WORKDIR /usr/src/app

COPY Makefile .
COPY go.mod go.mod
COPY cmd cmd

RUN make vendor

RUN make build

RUN chmod +x main

FROM ubuntu:questing

WORKDIR /usr/local/bin

RUN apt-get -y update \
&& apt-get -y install wiringpi 

COPY --from=builder /usr/src/app/main ./main

CMD ["./main"]
