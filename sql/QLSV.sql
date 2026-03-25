/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLSV') IS NOT NULL
		DROP DATABASE QLECommerce
	GO

*/

-- Tao co so du lieu

CREATE DATABASE QLSV

-- Bat dau dung co so du lieu

USE QLSV

-- Tao bang

CREATE TABLE KHOA (
	MaKhoa varchar(10) constraint pk_k_mk primary key,
	TenKhoa nvarchar(50) not null,
	SL_CBGD smallint not null
)

CREATE TABLE SINHVIEN (
	MSSV varchar(5) not null constraint pk_sv_mssv primary key,
	Ten nvarchar(50) not null,
	GioiTinh varchar(5) not null,
	DiaChi nvarchar(100) not null,
	DienThoai varchar(20) null,
	MaKhoa varchar(10) null constraint fk_sv_mk foreign key(MaKhoa) references KHOA(MaKhoa)
)

CREATE TABLE GIAOVIEN (
	MaGV varchar(5) constraint pk_gv_mgv primary key,
	TenGV nvarchar(50) not null,
	MaKhoa varchar(10) constraint fk_gv_mk foreign key(MaKhoa) references KHOA(MaKhoa)
)

CREATE TABLE MONHOC (
	MaMH varchar(5) constraint pk_mh_mmh primary key,
	TenMH nvarchar(50) not null,
	SoTC smallint not null
)

CREATE TABLE GIANGDAY (
	MaKhoaHoc varchar(5) constraint pk_gd_mkh primary key,
	MaGV varchar(5) constraint fk_gd_mgv foreign key(MaGV) references GIAOVIEN(MaGV),
	MaMH varchar(5) constraint fk_gd_mmh foreign key(MaMH) references MONHOC(MaMH),
	HocKy smallint not null,
	Nam int not null
)

CREATE TABLE KETQUA (
	MaSV varchar(5) constraint fk_kq_msv foreign key(MaSV) references SINHVIEN(MSSV),
	MaKhoaHoc varchar(5) constraint fk_kq_mkh foreign key(MaKhoaHoc) references GIANGDAY(MaKhoaHoc),
	Diem decimal(3,1)
	constraint pk_kq_msv_mkh primary key(MaSV, MaKhoaHoc)
)

-- Them du lieu

INSERT INTO KHOA(MaKhoa, TenKhoa, SL_CBGD) 
VALUES ('CNTT', N'Công nghệ thông tin', 15), 
('TOAN', N'Toán', 20), 
('SINH', N'Sinh học', 7)

INSERT INTO SINHVIEN(MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
VALUES ('SV001', 'BUI THUY AN', 'Nu', '223 TRAN HUNG DAO .HCM', '0843132202', 'CNTT'),
('SV002', 'NGUYEN THANH TUNG', 'Nam', '140 CONG QUYNH .HCM', '0581525678', 'CNTT'),
('SV003', 'NGUYEN THANH LONG', 'Nam', '112/4 CONG QUYNH .HCM', '0918345623', 'TOAN'),
('SV004', 'HOANG THI HOA','Nu', '90 NG VAN CU .HCM', '0988320123', 'CNTT'),
('SV005', 'TRAN HONG SON', 'Nam', '54 CAO THANG .HANOI', '0928345987', 'TOAN')

-- Sua lai kieu du lieu cot GioiTinh

ALTER TABLE SINHVIEN 
ALTER COLUMN GioiTinh nvarchar(5)

-- Cap nhat lai kieu du lieu cot GioiTinh

UPDATE SINHVIEN
SET GioiTinh=N'Nữ'
WHERE MSSV = 'SV001'

UPDATE SINHVIEN
SET GioiTinh=N'Nữ'
WHERE MSSV = 'SV004'

INSERT INTO MONHOC(MaMH, TenMH, SoTC)
VALUES ('CSDL', 'CO CO DU LIEU', 3),
('CTDL', 'CAU TRUC DU LIEU', 4),
('KTLT', 'KY THUAT LAP TRINH', 5),
('CWIN', 'LAP TRINH C TREN WINHDOW', 4)

INSERT INTO GIAOVIEN(MaGV, TenGV, MaKhoa)
Values ('GV01', 'PHAM THI THAO', 'CNTT'),
('GV02', 'LAM HOANG VU', 'TOAN'),
('GV03', 'TRAN VAN TIEN', 'CNTT'),
('GV04', 'HOANG VUONG', 'CNTT')

INSERT INTO GIANGDAY(MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
Values ('K1', 'GV01', 'CSDL', 1, 2021),
('K2', 'GV04', 'KTLT', 2, 2020),
('K3','GV03', 'CTDL', 1, 2020),
('K4', 'GV04', 'CWIN', 1, 2020),
('K5', 'GV01', 'CSDL', 1, 2021)

INSERT INTO KETQUA(MaSV, MaKhoaHoc, Diem)
Values ('SV001', 'K1', 8.5),
('SV002', 'K3', 7.0),
('SV003', 'K4', 7.5),
('SV001', 'K2', 9.0),
('SV004', 'K3', 6.0),
('SV005', 'K3', 7.0),
('SV002', 'K1', 7.0),
('SV003', 'K2', 8.5),
('SV005', 'K5', 7.0),
('SV004', 'K4', 2.0)

-- Truy van SQL

SELECT * FROM KHOA
SELECT * FROM SINHVIEN
SELECT * FROM GIAOVIEN
SELECT * FROM MONHOC
SELECT * FROM GIANGDAY
SELECT * FROM KETQUA

-- Câu 1: Liệt kê tên, địa chỉ, điện thoại của tất cả sinh viên
SELECT Ten, DiaChi, DienThoai 
FROM SINHVIEN 

-- Câu 2: Cho biết tên các môn học và số tín chỉ của từng môn
SELECT TenMH, SoTC
FROM MONHOC 

-- Câu 3: Liệt kê kết quả học tập của sinh viên có Mã số "SV003"
SELECT * 
FROM KETQUA
WHERE MaSV = 'SV003'

-- Câu 4: Cho biết tên các môn học có chứa chữ "DU" (VD: Cơ sở dữ liệu, Cấu trúc dữ liệu, ...)
SELECT TenMH
FROM MONHOC
WHERE TenMH LIKE '%DU%'

-- Câu 5: Liệt kê tên, địa chỉ của những sinh viên ở đường "Cống Quỳnh"
SELECT Ten, DiaChi 
FROM SINHVIEN
WHERE DiaChi LIKE '%CONG QUYNH%'

-- Câu 6: Liệt kê danh sách các môn học được dạy trong năm 2020
SELECT * 
FROM GIANGDAY
WHERE Nam = 2020

-- Câu 7: Cho biết mã, tên, địa chỉ các SV theo từng khoa, sắp theo thứ tự A-Z của tên SV
SELECT MSSV, Ten, GioiTinh, DiaChi
FROM SINHVIEN 
ORDER BY Ten 

-- Câu 8: Liệt kê điểm của tất cả sinh viên theo từng môn học
SELECT SINHVIEN.Ten, MONHOC.TenMH, KETQUA.Diem 
FROM SINHVIEN
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH

-- Câu 9: Cho biết các sinh viên học môn 'CSDL' có điểm từ 8 đến 10
SELECT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE MONHOC.TenMH = 'CSDL'
and Diem between 8 and 10

-- Câu 10: Cho biết bảng điểm của sinh viên có tên là 'TÙNG'
SELECT *
FROM KETQUA
JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MSSV
WHERE Ten LIKE '%TUNG%'

-- Câu 11: Cho biết tên khoa, tên môn học mà sinh viên trong khoa đã học
SELECT KHOA.TenKhoa, MONHOC.TenMH
FROM KHOA
JOIN SINHVIEN ON KHOA.MaKhoa = SINHVIEN.MaKhoa
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH

-- Câu 12: Liệt kê các giáo viên tham gia giảng dạy môn "Kỹ thuật lập trình"
SELECT GIAOVIEN.MaGV, GIAOVIEN.TenGV
FROM GIAOVIEN
JOIN GIANGDAY ON GIAOVIEN.MaGV = GIANGDAY.MaGV
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE TenMH = N'KY THUAT LAP TRINH'

-- Câu 13: Cho biết môn học mà giáo viên "Trần Văn Tiến" giảng dạy trong học kỳ 1 năm 2020
SELECT MONHOC.MaMH, MONHOC.TenMH, MONHOC.SoTC
FROM MONHOC
JOIN GIANGDAY ON MONHOC.MaMH = GIANGDAY.MaMH
JOIN GIAOVIEN ON GIANGDAY.MaGV = GIAOVIEN.MaGV
WHERE TenGV = N'TRAN VAN TIEN'
AND HocKy = 1
AND Nam = 2020

-- Câu 14: Liệt kê sinh viên đã học môn 'CSDL' và 'CTDL'
SELECT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE MONHOC.MaMH IN ('CSDL','CTDL')
GROUP BY SINHVIEN.MSSV, SINHVIEN.Ten
HAVING COUNT(DISTINCT MONHOC.MaMH) = 2

-- Câu 15: Cho biết mã, tên sinh viên có ít nhất một môn đạt điểm > 8
SELECT DISTINCT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
WHERE Diem > 8

-- Câu 16: Cho biết nã, tên sinh viên có kết quả tất cả các môn đều trên 8 điểm 
SELECT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
GROUP BY SINHVIEN.MSSV, SINHVIEN.Ten
HAVING MIN(Diem) > 8

-- Câu 17: Đếm số dinh viên nữ của khoa CNTT
SELECT COUNT(*) AS SoSVNu
FROM SINHVIEN
WHERE GioiTinh = N'Nữ'
AND MaKhoa = 'CNTT'

-- Câu 18: Cho biết số lượng môn học được giảng dạy trong học kỳ 1 năm 2021
SELECT COUNT(DISTINCT MaMH) AS SoMon
FROM GIANGDAY
WHERE HocKy = 1 AND Nam = 2021

-- Câu 19: Cho biết điểm trung bình của sinh viên có mã số 'SV004'
SELECT MaSV, SUM(Diem * SoTC) / SUM(SoTC) AS DiemTrungBinh
FROM KETQUA
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MAMH
WHERE MaSV = 'SV004'
GROUP BY MaSV

-- Câu 20: Liệt kê mã, tên, địa chỉ và điểm trung bình của từng sinh viên
SELECT SINHVIEN.MSSV, SINHVIEN.Ten, SINHVIEN.DiaChi,
AVG(KETQUA.Diem) AS DiemTrungBinh
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
GROUP BY SINHVIEN.MSSV, SINHVIEN.Ten, SINHVIEN.DiaChi

-- Câu 21: Cho biết số lượng điểm >= 8 của từng sinh viên
SELECT SINHVIEN.MSSV, COUNT(KETQUA.MaSV) as SoLuongDiemLonHon8
FROM SINHVIEN
LEFT JOIN KETQUA 
ON KETQUA.MaSV = SINHVIEN.MSSV 
AND KETQUA.Diem >= 8
GROUP BY SINHVIEN.MSSV 

-- Câu 22: Cho biết tên khoa, số lượng sinh viên theo học
SELECT KHOA.TenKhoa, COUNT(SINHVIEN.MSSV) as SoLuongSinhVien
FROM KHOA
JOIN SINHVIEN ON SINHVIEN.MaKhoa = KHOA.MaKhoa
GROUP BY TenKhoa

-- Câu 23: Cho biết tên khoa, số lượng khóa học mà giảng viên của khoa đã giảng dạy
SELECT TenKhoa, COUNT(MaKhoaHoc) as SoLuongKhoaHoc
FROM KHOA
JOIN GIAOVIEN ON GIAOVIEN.MaKhoa = KHOA.MaKhoa
JOIN GIANGDAY ON GIANGDAY.MaGV = GIAOVIEN.MaGV
GROUP BY TenKhoa

-- Câu 24: Liệt kê tên sinh viên, điểm trung bình và số môn đã tham gia
SELECT SINHVIEN.Ten, SUM(KETQUA.Diem * SoTC) / SUM(SoTC) as DiemTrungBinh, COUNT(KETQUA.MaKhoaHoc) as SoLuongMon
FROM SINHVIEN 
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MAMH
GROUP BY SINHVIEN.Ten

-- Câu 25: Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia
SELECT SINHVIEN.MSSV, SUM(MONHOC.SoTC) as SoTinChi
FROM SINHVIEN 
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
GROUP BY SINHVIEN.MSSV 

-- Câu 26: Liệt kê tên sinh viên chỉ mới thi đúng 1 môn
SELECT SINHVIEN.MSSV, COUNT(KETQUA.Diem) as SoLuongMonDaThi
FROM SINHVIEN
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
GROUP BY SINHVIEN.MSSV
HAVING COUNT(KETQUA.Diem) = 1

-- Câu 27: Cho biết sinh viên có điểm trung bình > 8.5
SELECT MaSV, SUM(Diem * SoTC) / SUM(SoTC) as DiemTrungBinh
FROM KETQUA 
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
GROUP BY MaSV
HAVING SUM(Diem * SoTC) / SUM(SoTC) > 8.5

-- Câu 28: Cho biết các khóa học có số lượng sinh viên tham gia từ 2 đến 4
SELECT MaKhoaHoc, COUNT(MaSV) as SoLuongSinhVien
FROM KETQUA
GROUP BY MaKhoaHoc
HAVING COUNT(MaSV) between 2 and 4

-- Câu 29: Điểm cao nhất mà sinh viên đã đạt được trong tất cả các môn
SELECT MAX(Diem) as DiemCaoNhat
FROM KETQUA

-- Câu 30: Cho biết tên môn học có nhiều sinh viên tham gia nhất 
SELECT TOP 1 WITH TIES MONHOC.MaMH, COUNT(SINHVIEN.MSSV) as SoLuongSinhVien
FROM MONHOC 
JOIN GIANGDAY ON GIANGDAY.MaMH = MONHOC.MaMH
JOIN KETQUA ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN SINHVIEN ON SINHVIEN.MSSV = KETQUA.MaSV
GROUP BY MONHOC.MaMH
ORDER BY SoLuongSinhVien DESC

-- Câu 31: Với mỗi môn học, liệt kê tên và điểm của sinh viên có điểm cao nhất
SELECT MONHOC.MaMH, SINHVIEN.Ten, MAX(KETQUA.Diem) as DiemCaoNhat
FROM SINHVIEN 
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
GROUP BY SINHVIEN.Ten, MONHOC.MaMH

SELECT MONHOC.TenMH, SINHVIEN.Ten, KQ1.Diem
FROM KETQUA KQ1
JOIN SINHVIEN ON SINHVIEN.MSSV = KQ1.MaSV
JOIN GIANGDAY GD1 ON GD1.MaKhoaHoc = KQ1.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GD1.MaMH
WHERE KQ1.DIEM = (
	SELECT Diem
	FROM KETQUA KQ2
	JOIN GIANGDAY GD2
	ON GD2.MaKhoaHoc = KQ2.MaKhoaHoc
	WHERE GD1.MaMH = GD2.MaMH
)

-- Câu 32: Học kỳ nào có nhiều môn học được giảng dạy nhất
SELECT TOP 1 WITH TIES HocKy, COUNT(MaMH) SoLuongMon
FROM GIANGDAY 
GROUP BY HocKy
ORDER BY SoLuongMon DESC

-- Câu 33: Cho biết tên sinh viên có nhiều điểm 7 nhất

-- Câu 34: Cho biết tên sinh viên có số tín chỉ nhiều nhất

-- Câu 35: Cho biết môn học có số tín chỉ lớn nhất và nhỏ nhất

-- Câu 36: Liệt kê tên giáo viên tham gia giảng dạy nhiều nhất

-- Câu 37: Liệt kê các môn học chưa được tổ chức

-- Câu 38: Cho biết sinh viên đã học tất cả các môn học

-- Câu 39: Cho biết giáo viên giảng dạy tất cả các môn mà giáo viên 'GV03' đã dạy

-- Câu 40: Cho biết sinh viên đã học tất cả các môn mà sinh viên 'SV001' đã học

-- Câu 41: Thêm các field SLMon (số lượng môn), DTB (điểm trung bình), XL (xếp loại) vào bảng SinhVien

/*
Câu 42: Cập nhật thông tin cho các field vừa tạo:
	SLMon: tổng số môn có điểm
	DTB: điểm trung bình
	XL: xếp loại theo thang (Yếu, Trung bình, Khá, Giỏi, Xuất sắc)
*/

-- Câu 43: Xóa toàn bộ kết quả học tập của sinh viên 'SV002'

-- Câu 44: Xóa các sinh viên có điểm trung bình < 5

-- Câu 45: Xóa những khoa không có sinh viên theo học
