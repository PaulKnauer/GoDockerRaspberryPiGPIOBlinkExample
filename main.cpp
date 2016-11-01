#include <cstdlib>

#include "foo.h"
#include "bar.h"

using namespace std;

int main(int argc, char **argv) {
	Foo *foo = new Foo();
	Bar *bar = new Bar();
	foo->show();
	bar->show();
	delete foo;
	delete bar;
	return 0;
}
