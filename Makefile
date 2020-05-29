CC      = g++
CFLAGS  = -I/home/pi/RaspberryPiI2CExample/
LDFLAGS = -lwiringPi

objects = main.o

all: main

docker: main
	docker build -t paulknauer/rpi-gpio-blink .

main: $(objects)
	$(CC) -o $@ $^ $(LDFLAGS)

.o.cpp:
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: all clean docker docker-rmi

clean: 
	rm -f *.o main

docker-rmi:
	docker rmi -f paulknauer/rpi-gpio-blink
