#include <iostream>
#include <wiringPi.h>

#include "i2c.h"

using namespace std;

int main() {
  wiringPiSetup();
  pinMode(0, OUTPUT);

  cout << "Set up GPIO" << endl;

  for(;;) {
    digitalWrite(0, HIGH);
    delay(500);
    digitalWrite(0,  LOW);
    delay(500);
    cout << "Blink" << endl;
  }

  return 0;
}
