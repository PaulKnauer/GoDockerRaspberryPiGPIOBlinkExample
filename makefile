CC      = g++
CFLAGS  = -I/home/pi/RaspberryPiI2CExample/
LDFLAGS = -lwiringPi

objects = i2c.o

all: docker

docker: main
	docker build -t paulknauer/rpi-gpio-blink .

main: $(objects) main.cpp
	$(CC) -o $@ $^ $(LDFLAGS)

$(objects): %.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: all clean docker docker-rmi

clean: docker-rmi
	rm *.o main

docker-rmi:
	docker rmi -f paulknauer/rpi-gpio-blink
