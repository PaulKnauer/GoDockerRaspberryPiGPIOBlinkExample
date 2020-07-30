FROM raspbian/stretch AS builder

LABEL autodelete="true"

RUN apt-get -y update \
&& apt-get -y install build-essential wiringpi

COPY main.cpp .
COPY Makefile .

RUN make main

FROM raspbian/stretch

RUN apt-get -y update \
&& apt-get -y install wiringpi 

COPY --from=builder main .

CMD ["/main"]
