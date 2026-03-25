#include <iostream>

void Combination(int a[], int i, const int &n, const int &k) {
	for(int j = a[i - 1] + 1; j <= n - k + i; j++) {
		a[i] = j;
		if(i == k) {
			for(int id = 1; id <= k; id++) std::cout << a[id] << " ";
			std::cout << "\n";
		} else Combination(a, i + 1, n, k);
	}
}

void Permutation(int a[], bool visited[], int i, const int &n, const int &k) {
	for(int j = 1; j <= n; j++) {
		if(!visited[j]) {
			visited[j] = true;
			a[i] = j;
			if(i == k) {
				for(int id = 1; id <= k; id++) std::cout << a[id] << " ";
				std::cout << "\n";
			} else Permutation(a, visited, i + 1, n, k);
			visited[j] = false;
		}
	}
}

int main() {
	
	int n, k; std::cin >> n >> k;
	int a[k + 1]; a[0] = 0;
	Combination(a, 1, n, k);
	bool visited[n + 1] = {false};
	Permutation(a, visited, 1, n, k);
	
	return 0;
}