# Go (Golang) Docker Raspberry Pi GPIO Blink Example

## About
An example of how to use Docker on a Raspberry Pi showing that you can still access the GPIO pins from within a running Docker container.
```
docker run -d --name blink --restart always --cap-add SYS_RAWIO --device /dev/mem paulknauer/rpi-gpio-blink
```
Written in Go, this relies on the excellent WiringPi library.
WiringPi gets installed in the multi-stage docker build, the code snippet below can be used if you need to install wiringPi manually.

```
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb

gpio -v
```
## How to run
To  run the project make sure that you have Docker installed on your Raspberry Pi
Also make sure that you can use make, if not then install build tools:
```
sudo apt install build-essential
```
Then simply execute the following from within the project directory:
```
make docker-run
```
...then to clean up run:
```
make docker-clean
```
