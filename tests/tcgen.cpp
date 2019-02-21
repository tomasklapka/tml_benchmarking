#include <iostream>
#include <cstdlib>
#include <string.h>
using namespace std;
int main(int argc, char** argv) {
	if (argc == 3) {
		size_t n = atol(argv[2]);
		if (strcmp(argv[1], "tml") == 0) {
			for (size_t k = 1; k < n; ++k)
				cout << "e " << k << ' ' << k+1 << '.' << endl;
			cout << "e " << n << " 1." << endl;
			cout << "e ?x ?y :- e ?x ?z, e ?z ?y."<<endl;
			return 0;
		}
		if (strcmp(argv[1], "souffle") == 0) {
			cout << ".decl e(n:number, m:number)" << endl;
			cout << ".output e" << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "e(x, y) :- e(x, z), e(z, y)." << endl;
			return 0;
		}
		if (strcmp(argv[1], "xsb") == 0) {
			cout << ":- table e/2." << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "e(X,Y) :- e(X,Z), e(Z,Y)." << endl;
			cout << ":- findall([X|Y], e(X,Y), TC), write(TC), halt." << endl;
			return 0;
		}
	}
	cout << "usage: tcgen <tml|souffle|xsb> <# of vertices>" << endl;
	return 0;
}
