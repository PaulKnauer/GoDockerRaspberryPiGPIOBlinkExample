#include <iostream>

#include "foo.h"

using namespace std;

Foo::Foo() {}

Foo::~Foo() {
	delete this;
}

void Foo::show() {
	cout << "Foo" << endl;
}
