package example

// #cgo LDFLAGS: -lwiringPi
//
// #include <wiringPi.h>
import "C"

func setup() {
  C.wiringPiSetup()
  C.pinMode(0, OUTPUT)
}

func loop() {
  C.digitalWrite(0, HIGH)
  C.delay(500)
  C.digitalWrite(0,  LOW)
  C.delay(500)
}

func main() {
  setup()

  for(;;) {
    loop()
  }
}
