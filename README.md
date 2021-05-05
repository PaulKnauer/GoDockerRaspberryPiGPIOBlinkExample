# RaspberryPiI2CExample

An example of how to use Docker on a Raspberry Pi showing that you can still access the GPIO pins from within a running Docker container.
```
docker run -d --name blink --restart always --cap-add SYS_RAWIO --device /dev/mem paulknauer/rpi-gpio-blink
```
Written in C++, this relies on the excellent WiringPi library.

```
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb

gpio -v
```
