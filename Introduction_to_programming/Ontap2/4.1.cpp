#include <stdio.h>

int m, n, a[10][10];

void nhap() {
	do {
        printf("nhap so hang ma tran : ");
        scanf("%d", &m);
    } while(m < 2 || m > 10);
    
    do {
        printf("nhap so cot ma tran : ");
        scanf("%d", &n);
    } while(n < 2 || n > 10);
    
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void in() {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) printf("%d ", a[i][j]);
        printf("\n");
    }
}

int check(int x) {
	int res = x / 100 + x % 10;
	int mid = (x / 10) % 10;
	if(res == mid) return 1;
	return 0; 
}

void solve() {
	int d, cnt = 0;
	do {
		printf("nhap hang d : ");
		scanf("%d", &d);
	} while(d < 0 || d >= m);
	
	for(int i = 0; i < n; i++) {
		if(check(a[d][i])) ++cnt;
	}
	printf("so luong phan tu thoa man yeu cau : %d\n", cnt);
}

void xoa() {
	int d;
	do {
		printf("nhap hang muon xoa : ");
		scanf("%d", &d);
	} while(d < 0 || d >= m);
	for(int i = d; i < m; i++) {
		for(int j = 0; j < n; j++) a[i][j] = a[i + 1][j];
	}
	--m;
}

int main()
{
    nhap();
    in();
    solve();
    xoa();
    in();

    return 0;
}