#include <wiringPi.h>

void setup() {
  wiringPiSetup();
  pinMode(0, OUTPUT);
}

void loop() {
  digitalWrite(0, HIGH);
  delay(500);
  digitalWrite(0,  LOW);
  delay(500);
}

int main() {
  setup();

  for(;;) {
    loop();
  }

  return 0;
}
