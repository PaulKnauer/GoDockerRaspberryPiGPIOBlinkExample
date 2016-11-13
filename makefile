CC      = g++
CFLAGS  = -I/home/pi/RaspberryPiI2CExample/
LDFLAGS = -lwiringPi

objects = i2c.o

all: docker

docker: main
	docker build -t main .

main: $(objects) main.cpp
	$(CC) -o $@ $^ $(LDFLAGS)

$(objects): %.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: all clean docker

clean:
	rm *.o main
	docker rmi -f main
