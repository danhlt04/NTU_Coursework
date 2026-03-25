#include <stdio.h>

int n, M, w[21], x[21], ans[100005][21], sum, cnt;

void Try(int i) {
    if(sum > M) return;
    if(i == n) {
        if(sum == M) {
            for(int j = 0; j < n; j++) {
                if(x[j] == 1) ans[cnt][j] = w[j];
            }
            ++cnt;
        }
        return;
	}
    x[i] = 0;
    Try(i + 1);
    x[i] = 1;
    sum += w[i];
    Try(i + 1);
    sum -= w[i]; 
}

int main() {
    scanf("%d %d", &n, &M);
    for(int i = 0; i < n; i++) scanf("%d", &w[i]);
    Try(0);
    if(cnt == 0) printf("Khong chon duoc\n");
    else {
		printf("So cach chon: %d\n", cnt);
		for(int i = 0; i < cnt; i++) {
			for(int j = 0; j < n; j++) {
				if(ans[i][j]) printf("%d ", ans[i][j]);
			}
			printf("\n");
		}
	}

    return 0;
}