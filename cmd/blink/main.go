package example

// #cgo LDFLAGS: -lwiringPi
//
// #include <wiringPi.h>
import "C"

func setup() {
	C.wiringPiSetup()
	C.pinMode(0, C.OUTPUT)
}

func loop() {
	C.digitalWrite(0, C.HIGH)
	C.delay(500)
	C.digitalWrite(0, C.LOW)
	C.delay(500)
}

func main() {
	setup()

	for {
		loop()
	}
}
