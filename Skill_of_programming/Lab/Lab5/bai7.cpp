#include <iostream>
#include <fstream>

void readFile(const std::string &fileName, int cost[][30], int &n) {
	std::ifstream r;
	r.open(fileName, std::ios::in);
	if(!r.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x; r >> x; n = x;
	int i = 0, j = 0; while(r >> x) {
		if(i == n) break;
		if(j == n) { j = 0; ++i; }
		cost[i][j++] = x;
	}
	r.close();
}

void writeFile(const std::string &fileName, const int &ans) {
	std::ofstream w;
	w.open(fileName, std::ios::out);
	if(!w.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	w << "Tong chi phi la : " << (ans <= 0 ? -1 : ans) << "\n";
	w.close();
}

void solve(const int cost[][30], const int &n) {
	int sum = 0;
    int counter = 0;
    int j = 0, i = 0;
    int minval = INT_MAX;
    int visitedRouteList[30] = {0};
    visitedRouteList[0] = 1;
    int route[n];
    while(i < n && j < n) {
        if(counter >= n - 1) break;
        if(j != i && (visitedRouteList[j] == 0)) {
            if(cost[i][j] < minval) {
                minval = cost[i][j];
                route[counter] = j + 1;
            }
        }
        j++;
        if(j == n) {
            sum += minval;
            minval = INT_MAX;
            visitedRouteList[route[counter] - 1] = 1;
            j = 0;
            i = route[counter] - 1;
            counter++;
        }
    }
    i = route[counter - 1] - 1;
    for(j = 0; j < n; j++) {
        if((i != j) && cost[i][j] < minval) {
            minval = cost[i][j];
            route[counter] = j + 1;
        }
    }
    sum += minval;
	writeFile("dulich_out.txt", sum);
}

int main() {

	int n, cost[30][30];
	readFile("Dulich.txt", cost, n);
	solve(cost, n);

	return 0;
}
