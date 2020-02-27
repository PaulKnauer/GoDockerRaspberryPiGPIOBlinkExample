FROM resin/rpi-raspbian as builder

RUN apt-get -y update \
  && apt-get -y install build-essential git-core \
  && git clone git://git.drogon.net/wiringPi \
  && cd wiringPi \
  && ./build

FROM resin/rpi-raspbian

COPY --from=builder main /main

CMD ["/main"]
