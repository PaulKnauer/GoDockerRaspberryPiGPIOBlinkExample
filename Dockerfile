FROM resin/rpi-raspbian

RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y install build-essential git-core \
&& git clone git://git.drogon.net/wiringPi \
&& cd wiringPi \
&& ./build \
&& rm -rf /wiringPi \
&& apt-get -y remove build-essential git-core \
&& apt-get purge \
&& apt-get autoremove

ADD main /main

CMD ["/main"]
