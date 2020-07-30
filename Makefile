CC      = g++
CFLAGS  = -I/home/pi/RaspberryPiI2CExample/
LDFLAGS = -lwiringPi

objects = main.o

all: main

docker: main
	docker build -t paulknauer/rpi-gpio-blink .

docker-run: docker
	docker run -d --name blink --restart unless-stopped --cap-add SYS_RAWIO --device /dev/mem paulknauer/rpi-gpio-blink

main: $(objects) main.cpp
	$(CC) -o $@ $^ $(LDFLAGS)

.o.cpp:
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: all clean docker docker-rmi

clean: 
	rm -f *.o main

docker-clean:
	docker stop blink; \
	docker rm -f blink; \
	docker rmi -f paulknauer/rpi-gpio-blink; \
	./autodelete-dangling.sh
