#include <iostream>
#include <cstdlib>
#include <string.h>
using namespace std;
int main(int argc, char** argv) {
	if (argc == 3) {
		size_t n = atol(argv[2]);
		if (strcmp(argv[1], "tml") == 0) {
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << ' ' << k+1 << ")." << endl;
			cout << "e(" << n << " 1)." << endl;
			cout << "e(?x ?y) :- e(?x ?z), e(?z ?y)."<<endl;
			return 0;
		}
		if (strcmp(argv[1], "tml.left") == 0) {
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << ' ' << k+1 << ")." << endl;
			cout << "e(" << n << " 1)." << endl;
			cout << "ee(?x ?y) :- e(?x ?y)." << endl;
			cout << "ee(?x ?y) :- ee(?x ?z), e(?z ?y)." << endl;
			return 0;
		}
		if (strcmp(argv[1], "tml.right") == 0) {
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << ' ' << k+1 << ")." << endl;
			cout << "e(" << n << " 1)." << endl;
			cout << "ee(?x ?y) :- e(?x ?y)." << endl;
			cout << "ee(?x ?y) :- e(?x ?z), ee(?z ?y)." << endl;
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
		if (strcmp(argv[1], "souffle.left") == 0) {
			cout << ".decl e(n:number, m:number)" << endl;
			cout << ".decl ee(n:number, m:number)" << endl;
			cout << ".output ee" << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "ee(x, y) :- e(x, y)." << endl;
			cout << "ee(x, y) :- ee(x, z), e(z, y)." << endl;
			return 0;
		}
		if (strcmp(argv[1], "souffle.right") == 0) {
			cout << ".decl e(n:number, m:number)" << endl;
			cout << ".decl ee(n:number, m:number)" << endl;
			cout << ".output ee" << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "ee(x, y) :- e(x, y)." << endl;
			cout << "ee(x, y) :- e(x, z), ee(z, y)." << endl;
			return 0;
		}
		if (strcmp(argv[1], "souffle.facts") == 0) {
			for (size_t k = 1; k < n; ++k)
				cout << k << "\t" << k+1 << endl;
			cout << n << "\t" << 1 << endl;
			return 0;
		}
		if (strcmp(argv[1], "xsb") == 0) {
			cout << ":- table e/2." << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "e(X,Y) :- e(X,Z), e(Z,Y)." << endl;
			cout << ":- Q = e(_,_), findall(Q, Q, TC), write(TC), halt." << endl;
			return 0;
		}
		if (strcmp(argv[1], "xsb.left") == 0) {
			cout << ":- table ee/2." << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "ee(X,Y) :- ee(X,Z), e(Z,Y)." << endl;
			cout << ":- Q = ee(_,_), findall(Q, Q, TC), write(TC), halt." << endl;
			return 0;
		}
		if (strcmp(argv[1], "xsb.right") == 0) {
			cout << ":- table ee/2." << endl;
			for (size_t k = 1; k < n; ++k)
				cout << "e(" << k << "," << k+1 << ")." << endl;
			cout << "e(" << n << ",1)." << endl;
			cout << "ee(X,Y) :- e(X,Z), ee(Z,Y)." << endl;
			cout << ":- Q = ee(_,_), findall(Q, Q, TC), write(TC), halt." << endl;
			return 0;
		}
	}
	cout<<"usage:\n\ttcgen <tml|souffle|souffle.facts|xsb> <# of vertices>"
		<<endl<<endl;
	cout<<"\talternatively you can choose .left or .right TC implementation"
		<<endl;
	cout<<"\t(eg. tml.left, xsb.right)"<<endl<<endl;
	return 0;
}
