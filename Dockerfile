FROM resin/rpi-raspbian

RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y install build-essential \
&& apt-get -y install git-core \
&& git clone git://git.drogon.net/wiringPi \
&& cd wiringPi \
&& ./build

ADD main /main

CMD ["/main"]
