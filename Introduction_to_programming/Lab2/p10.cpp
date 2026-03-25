#include <stdio.h>
#define N 50
//hàm nhập vào một dãy số nguyên gồm n phần tử
int Input(int a[], int &n){ // thieu dau va truoc n
    printf("Nhap so luong phan tu: ");
    scanf("%d", &n);
    for (int i = 0; i < n; i++) { // thieu cap dau {}
        printf("Nhap phan tu thu %d: ", i + 1);
        scanf("%d", &a[i]); // sai ten mang
    }
}
//hàm tìm số lớn nhất trong dãy số
int Max(int a[],int n){
    int max = a[1];  // sai ten mang
    for (int i = 0; i < n; i++) { // vi tri xuat phat sai
        if (a[i] > max) // dieu kien so sanh sai va sai ten mang
        max = a[i];
    }
    // thieu ket qua tra ve
    return max;
}
//hàm đếm các phần tử có giá trị x trong dãy số
int Count(int a[], int n, int x){ // thieu so can tim va sai kieu ham
    int c = 0; // thieu bien dem
    for (int i = 0; i <n; i++) // vong lap sai vi bien i chay den n
    if (a[i] == x) // sai ten mang
        c++;
    return c;
}
//chương trình chính
int main() {
    int arr[N], n;
    Input(arr,n); // sai ten ham
    int m = Max(arr,n); // sai ten ham
    printf("Gia tri lon nhat la : %d\n", m);
    int x; scanf("%d", &x);
    printf("So phan tu co gia tri %d trong mang la : %d", x, Count(arr,n,x)); // ham sai ten mang
    return 0;
}
