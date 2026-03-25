/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLHH') IS NOT NULL
		DROP DATABASE QLECommerce
	GO

*/

-- Tao database

CREATE DATABASE QLHH

-- Su dung database

USE QLHH

-- Tao cac bang va khoa chinh

CREATE TABLE KHACHHANG (
	MAKHACHHANG varchar(10),
	TENCONGTY nvarchar(100),
	TENGIAODICH nvarchar(100),
	DIACHI nvarchar(100),
	EMAIL varchar(20),
	DIENTHOAI varchar(20),
	FAX varchar(20),
	constraint pk_kh_mkh primary key(MAKHACHHANG)
)

CREATE TABLE NHANVIEN (
	MANHANVIEN varchar(10),
	HO  nvarchar(30),
	TEN nvarchar(10),
	NGAYSINH date,
	NGAYLAMVIEC date,
	DIACHI nvarchar(100),
	DIENTHOAI varchar(20) null,
	LUONGCOBAN money,
	PHUCAP money,
	constraint pk_nv_mnv primary key(MANHANVIEN)
)

CREATE TABLE NHACUNGCAP (
	MACONGTY varchar(10),
	TENCONGTY nvarchar(100),
	TENGIAODICH nvarchar(100),
	DIACHI nvarchar(100),
	DIENTHOAI varchar(20),
	FAX varchar(20),
	EMAIL varchar(20),
	constraint pk_ncc_mct primary key(MACONGTY)
)

CREATE TABLE MATHANG (
	MAHANG varchar(10),
	TENHANG nvarchar(100),
	MACONGTY varchar(10),
	MALOAIHANG varchar(10),
	SOLUONG decimal(10,2),
	DONVITINH nvarchar(20),
	GIAHANG money,
	constraint pk_mth_mah primary key(MAHANG)
)

CREATE TABLE LOAIHANG (
	MALOAIHANG varchar(10),
	TENLOAIHANG nvarchar(100),
	constraint pk_lh_mlh primary key(MALOAIHANG)
)

CREATE TABLE DONDATHANG (
	SOHOADON varchar(10),
	MAKHACHHANG varchar(10),
	MANHANVIEN varchar(10),
	NGAYDATHANG datetime null,
	NGAYGIAOHANG datetime null,
	NGAYCHUYENHANG datetime null,
	NOIGIAOHANG nvarchar(100) null,
	constraint pk_ddh_shd primary key(SOHOADON)
)

CREATE TABLE CTDATHANG (
	SOHOADON varchar(10),
	MAHANG varchar(10),
	GIABAN money,
	SOLUONG decimal(10,2),
	MUCGIAMGIA decimal(4,2),
	constraint pk_ct_shd_mh primary key(SOHOADON, MAHANG)
)

-- Them cac khoa ngoai

ALTER TABLE MATHANG add constraint fk_mh_mlh foreign key(MALOAIHANG) references LOAIHANG(MALOAIHANG)
ALTER TABLE MATHANG add constraint fk_mh_mct foreign key(MACONGTY) references NHACUNGCAP(MACONGTY)
ALTER TABLE DONDATHANG add constraint fk_ddh_mkh foreign key(MAKHACHHANG) references KHACHHANG(MAKHACHHANG)	
ALTER TABLE DONDATHANG add constraint fk_ddh_mnv foreign key(MANHANVIEN) references NHANVIEN(MANHANVIEN)
ALTER TABLE CTDATHANG add constraint fk_ct_mah foreign key(MAHANG) references MATHANG(MAHANG)
ALTER TABLE CTDATHANG add constraint fk_ct_shd foreign key(SOHOADON) references DONDATHANG(SOHOADON)

-- Them du lieu

INSERT INTO KHACHHANG(MAKHACHHANG, TENCONGTY, TENGIAODICH, DIACHI, EMAIL, DIENTHOAI, FAX) 
VALUES 
('KH01', N'Công ty An Phát', N'AnPhat', N'Hà Nội', 'anphat@gmail.com', '0909000011', '241111111'),
('KH02', N'Công ty Bình Minh', N'BinhMinh', N'Thành phố Hồ Chí Minh', 'binhminh@gmail.com', '0909000012', '281111112'),
('KH03', N'Công ty Cường Thịnh', N'CuongThinh', N'Đà Nẵng', 'cuongthinh@gmail.com', '0909000013', '236111113'),			
('KH04', N'Công ty Đại Nam', N'DaiNam', N'Hải Phòng', 'dainam@gmail.com', '0909000014', '225111114'),
('KH05', N'Công ty Hoàng Long', N'HoangLong', N'Cần Thơ', 'hoanglong@gmail.com', '0909000015', '292111115'),			
('KH06', N'Công ty Minh Quân', N'MinhQuan', N'Hà Nội', 'minhquan@gmail.com', '0909000016', '241111116'),
('KH07', N'Công ty Phúc An', N'PhucAn', N'Thành phố Hồ Chí Minh', 'phucan@gmail.com', '0909000017', '281111117'),					
('KH08', N'Công ty Quang Huy', N'QuangHuy', N'Đà Nẵng', 'quanghuy@gmail.com', '0909000018', '236111118'),
('KH09', N'Công ty Tân Tiến', N'TanTien', N'Hải Phòng', 'tantien@gmail.com', '0909000019', '225111119'),
('KH10', N'Công ty Việt Anh', N'VietAnh', N'Cần Thơ', 'vietanh@gmail.com', '0909000020', '292111120')

INSERT INTO NHANVIEN(MANHANVIEN, HO, TEN, NGAYSINH, NGAYLAMVIEC, DIACHI, DIENTHOAI, LUONGCOBAN, PHUCAP)
VALUES
('NV01', N'Nguyễn', N'An', '1990-01-01', '2020-01-01', N'Hà Nội', '0911000001', 8000000, 1000000),
('NV02', N'Trần', N'Bình', '1991-02-02', '2021-01-03', N'Thành phố Hồ Chí Minh', '0911000002', 7500000, 800000),
('NV03', N'Lê', N'Cường', '1989-03-03', '2019-10-05', N'Đà Nẵng', '0911000003', 9000000, 1200000),
('NV04', N'Phạm', N'Dung', '1993-04-04', '2022-06-15', N'Hải Phòng', '0911000004', 7000000, 700000),
('NV05', N'Cao', N'Hoàng', '1995-05-05', '2023-01-20', N'Cần Thơ', '0911000005', 6500000, 600000),
('NV06', N'Vũ',	N'Giang', '1992-06-06', '2018-01-07', N'Hà Nội', '0911000006', 8500000, 900000),
('NV07', N'Đỗ',	N'Hải', '1994-07-07', '2020-01-08', N'Thành phố Hồ Chí Minh', '0911000007',	7800000	,750000),
('NV08', N'Bùi', N'Khanh', '1996-08-08', '2022-09-01', N'Đà Nẵng', '0911000008', 7200000, 650000),
('NV09', N'Phan', N'Long', '1991-09-09', '2017-01-10', N'Hải Phòng', '0911000009', 9200000, 1300000),
('NV10', N'Trịnh', N'Nhung', '1997-10-10', '2024-01-01', N'Cần Thơ','0911000010', 6800000, 600000)

INSERT INTO NHACUNGCAP(MACONGTY, TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI, FAX, EMAIL)
VALUES 
('NCC01', N'Công ty Điện Máy A', N'DienMayA', N'Hà Nội', '0123456701', '241234501', 'a@ncc.com'),
('NCC02', N'Công ty Gia Dụng B', N'GiaDungB', N'Thành phố Hồ Chí Minh', '0123456702', '281234502', 'b@ncc.com'),
('NCC03', N'Công ty Thực Phẩm C', N'ThucPhamC', N'Đà Nẵng', '0123456703', '236123456', 'c@ncc.com'),
('NCC04', N'Công ty Thời Trang D', N'ThoiTrangD', N'Hải Phòng',	'0123456704', '225123456', 'd@ncc.com'),
('NCC05', N'Công ty Văn Phòng Phẩm E', N'VanPhongPhamE', N'Cần Thơ', '0123456705', '292123456', 'e@ncc.com'),
('NCC06', N'Công ty Mỹ Phẩm F',	N'MyPhamF',	N'Hà Nội', '0123456706', '241234506', 'f@ncc.com'),
('NCC07', N'Công ty Nội Thất G', N'NoiThatG', N'Thành phố Hồ Chí Minh',	'0123456707', '281234507', 'g@ncc.com'),
('NCC08', N'Công ty Sách H', N'SachH', N'Đà Nẵng', '0123456708', '236123458', 'h@ncc.com'),
('NCC09', N'Công ty Đồ Chơi I', N'DoChoiI',	N'Hải Phòng', '0123456709',	'225123459', 'i@ncc.com'),
('NCC10', N'Công ty Thể Thao K', N'TheThaoK', N'Cần Thơ', '0123456710', '292123460', 'k@ncc.com')

INSERT INTO MATHANG(MAHANG, TENHANG, MACONGTY, MALOAIHANG, SOLUONG, DONVITINH, GIAHANG)
VALUES 
('MH01', N'Tivi Samsung', 'NCC01', 'LH01', 50, N'Cái', 12000000),
('MH02', N'Nồi cơm điện', 'NCC02', 'LH02', 100,	N'Cái',	1500000),
('MH03', N'Bánh quy', 'NCC03', 'LH03', 200, N'Hộp', 50000),
('MH04', N'Áo sơ mi', 'NCC04', 'LH04', 150, N'Cái', 350000),
('MH05', N'Bút bi',	'NCC05', 'LH05', 500, N'Cây', 5000),
('MH06', N'Son môi', 'NCC06', 'LH06', 300, N'Cây', 250000),
('MH07', N'Bàn gỗ', 'NCC07', 'LH07', 40, N'Cái', 2500000),
('MH08', N'Sách giáo khoa',	'NCC08', 'LH08', 600, N'Quyển', 20000),
('MH09', N'Ô tô đồ chơi', 'NCC09', 'LH09', 120,	N'Cái', 150000),
('MH10', N'Bóng đá', 'NCC10', 'LH10', 80, N'Quả', 180000)

INSERT INTO LOAIHANG(MALOAIHANG, TENLOAIHANG)
VALUES
('LH01', N'Điện tử'),
('LH02', N'Gia dụng'),
('LH03', N'Thực phẩm'),
('LH04', N'Thời trang'),
('LH05', N'Văn phòng phẩm'),
('LH06', N'Mỹ phẩm'),
('LH07', N'Nội thất'),
('LH08', N'Sách'),
('LH09', N'Đồ chơi'),
('LH10', N'Thể thao')

INSERT INTO DONDATHANG(SOHOADON, MAKHACHHANG, MANHANVIEN, NGAYDATHANG, NGAYGIAOHANG, NGAYCHUYENHANG, NOIGIAOHANG)
VALUES
('HD01', 'KH01', 'NV01', '1/1/2025 8:00', '1/5/2025 8:00', '1/3/2025 8:00', N'Hà Nội'),
('HD02', 'KH02', 'NV02', '1/10/2025 9:00', '1/15/2025 9:00', '1/12/2025 9:00', N'Thành phố Hồ Chí Minh'),
('HD03', 'KH03', 'NV03', '2/1/2025 10:00', '2/5/2025 10:00', '2/3/2025 10:00', N'Đà Nẵng'),
('HD04', 'KH04', 'NV04', '2/10/2025 11:00', '2/15/2025 11:00','2/12/2025 11:00', N'Hải Phòng'),
('HD05', 'KH05', 'NV05', '3/1/2025 12:00', '3/5/2025 12:00', '3/3/2025 12:00', N'Cần Thơ'),
('HD06', 'KH06', 'NV06', '3/10/2025 8:30', '3/15/2025 8:30', '3/12/2025 8:30', N'Hà Nội'),
('HD07', 'KH07', 'NV07', '4/1/2025 9:15', '4/5/2025 9:15', '4/3/2025 9:15', N'Thành phố Hồ Chí Minh'),
('HD08', 'KH08', 'NV08', '4/10/2025 10:45', '4/15/2025 10:45', '4/12/2025 10:45', N'Đà Nẵng'),
('HD09', 'KH09', 'NV09', '5/1/2025 13:00', '5/5/2025 13:00', '5/3/2025 13:00', N'Hải Phòng'),
('HD10', 'KH10', 'NV10', '5/10/2025 14:20', '5/15/2025 14:20', '5/12/2025 14:20', N'Cần Thơ')

INSERT INTO CTDATHANG(SOHOADON, MAHANG, GIABAN, SOLUONG, MUCGIAMGIA)
VALUES
('HD01', 'MH01', 12500000, 2, 0.05),
('HD01', 'MH05', 6000, 10, 0),
('HD02', 'MH02', 1550000, 5, 0.1),
('HD02', 'MH08', 22000, 15, 0.02),
('HD03', 'MH03', 55000, 20, 0.03),
('HD03', 'MH06', 260000, 3, 0.05),
('HD04', 'MH04', 360000, 4, 0.05),
('HD04', 'MH09', 160000, 6,	0),
('HD05', 'MH05', 6000, 30, 0),
('HD05', 'MH10', 190000, 2, 0.05),
('HD06', 'MH07', 2600000, 1, 0.07),
('HD06', 'MH03', 52000, 25, 0.02),
('HD07', 'MH01', 12300000, 1, 0.03),
('HD07', 'MH02', 1500000, 2, 0.05),
('HD08', 'MH08', 21000, 40, 0.01),
('HD08', 'MH09', 155000, 5, 0),
('HD09', 'MH04', 340000, 6,	0.04),
('HD09', 'MH06', 255000, 4, 0.02),
('HD10', 'MH10',  185000, 3, 0.05),
('HD10', 'MH07', 2550000, 2, 0.06)

-- Bai tap truy van

-- 1. Cho biết danh sách các đối tác cung cấp hàng cho công ty
SELECT * 
FROM NHACUNGCAP

-- 2. Cho biết mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty
SELECT MAHANG, TENHANG, SOLUONG
FROM MATHANG 

-- 3. Cho biết họ tên và địa chỉ và năm bắt đầu làm việc của các nhân viên trong công ty
SELECT HO, TEN, DIACHI, NGAYLAMVIEC
FROM NHANVIEN

-- 4. Cho biết địa chỉ và điện thoại của nhà cung cấp có tên giao dịch VINAMILK là gì
SELECT DIACHI, DIENTHOAI
FROM NHACUNGCAP
WHERE TENGIAODICH = 'VINAMILK'

-- 5. Cho biết mã và tên của các mặt hàng có giá > 100000 và số lượng hiện có ít hơn 50
SELECT MAHANG, TENHANG
FROM MATHANG
WHERE GIAHANG > 100000 AND SOLUONG < 50

-- 6. Công ty Việt Tiến đã cung cấp những mặt hàng nào
SELECT TENLOAIHANG
FROM NHACUNGCAP
JOIN MATHANG ON NHACUNGCAP.MACONGTY = MATHANG.MACONGTY
JOIN LOAIHANG ON LOAIHANG.MALOAIHANG = MATHANG.MALOAIHANG
WHERE TENCONGTY LIKE N'%Việt Tiến%'

-- 7. Loại hàng thực phẩm do các công ty nào cung cấp và địa chỉ của các công ty đó là gì
SELECT TENCONGTY, DIACHI
FROM NHACUNGCAP
JOIN MATHANG ON NHACUNGCAP.MACONGTY = MATHANG.MACONGTY
JOIN LOAIHANG ON MATHANG.MALOAIHANG = LOAIHANG.MALOAIHANG
WHERE TENLOAIHANG = N'thực phẩm' 

-- 8. Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng Sữa hộp XYZ
SELECT TENGIAODICH
FROM KHACHHANG
JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
JOIN CTDATHANG ON DONDATHANG.SOHOADON = CTDATHANG.SOHOADON
JOIN MATHANG ON CTDATHANG.MAHANG = MATHANG.MAHANG
WHERE TENHANG = N'Sữa hộp XYZ'

-- 9. Cho biết đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu
SELECT MAKHACHHANG, MANHANVIEN, NGAYGIAOHANG, NOIGIAOHANG
FROM DONDATHANG
WHERE SOHOADON = 'HD01'

-- 10. Cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp)
SELECT MANHANVIEN, LUONGCOBAN + PHUCAP AS LUONG
FROM NHANVIEN

-- 11. Cho biết đơn đặt hàng số 3 đã đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu (TIENPHAITRA = SOLUONG X GIABAN - SOLUONG X GIABAN X MUCGIAMGIA / 100)
SELECT CTDATHANG.MAHANG, TENLOAIHANG, CTDATHANG.SOLUONG * GIABAN - CTDATHANG.SOLUONG * GIABAN * MUCGIAMGIA / 100 AS TIENPHAITRA
FROM CTDATHANG
JOIN MATHANG ON CTDATHANG.MAHANG = MATHANG.MAHANG
JOIN LOAIHANG ON MATHANG.MALOAIHANG = LOAIHANG.MALOAIHANG
WHERE SOHOADON = 'HD03'

-- 12. Hãy cho biết những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty (tức là có cùng tên giao dịch)
SELECT *
FROM KHACHHANG
JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
JOIN CTDATHANG ON DONDATHANG.SOHOADON = DONDATHANG.SOHOADON
JOIN MATHANG ON CTDATHANG.MAHANG = MATHANG.MAHANG
JOIN NHACUNGCAP ON MATHANG.MACONGTY = NHACUNGCAP.MACONGTY
WHERE KHACHHANG.TENGIAODICH = NHACUNGCAP.TENGIAODICH

-- 13. Trong công ty có những nhân viên nào có cùng ngày sinh

-- 14. Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó là của công ty nào

-- 15. Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty
SELECT TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI
FROM KHACHHANG
UNION
SELECT TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI
FROM NHACUNGCAP


-- 16. Những mặt hàng nào chưa từng được khách hàng mua
SELECT MAHANG
FROM MATHANG
EXCEPT 
SELECT MAHANG
FROM CTDATHANG

-- 17. Những nhân viên nào của công ty chưa từng lập bất kỳ một hóa đơn đặt hàng nào 


-- 18. Những nhân viên nào của công ty có lương cơ bản cao nhất 

-- 19. Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu

-- 20. Trong năm 2021, những mặt hàng nào chỉ được đặt mua đúng một lần