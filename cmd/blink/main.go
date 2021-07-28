package example

// #cgo LDFLAGS: -lwiringpi
//
// #include <wiringpi.h>
import "C"

func main() {
    C.bar()
}
