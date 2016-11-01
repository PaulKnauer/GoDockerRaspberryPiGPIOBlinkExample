#include <iostream>

#include "bar.h"

using namespace std;

Bar::Bar() {}

Bar::~Bar() {
	delete this;
}

void Bar::show() {
	cout << "Bar" << endl;
}
