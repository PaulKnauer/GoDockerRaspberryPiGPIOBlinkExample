CC      = g++
CFLAGS  = -I/home/pi/RaspberryPiI2CExample/
LDFLAGS = 

objects = 

all: main

main: $(objects) main.cpp
	$(CC) -o $@ $^ $(LDFLAGS)

$(objects): %.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: all clean

clean:
	rm *.o
