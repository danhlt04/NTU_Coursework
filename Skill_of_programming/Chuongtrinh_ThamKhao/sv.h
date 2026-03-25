// Khai bao kieu du lieu sinh vien
typedef struct SV{
	char MSSV[9];
	char HoTen[50];
	float DTB;
};

// Khai bao khuon mau ham nhap thong tin SV
void NhapSV(SV &s);
// Khai bao khuon mau ham in thong tin SV
void XuatSV(SV s);

