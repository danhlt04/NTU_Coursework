-- Tao co so du lieu

USE master
IF DB_ID('QLSV') IS NOT NULL
    DROP DATABASE QLSV

CREATE DATABASE QLSV

-- Su dung co so du lieu

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


-- Bai tap chuong 4

-- Câu 1: Liệt kê tên, địa chỉ, điện thoại của tất cả sinh viên.
SELECT Ten, DiaChi, DienThoai FROM SINHVIEN 

-- Câu 2: Cho biết tên các môn học và số tín chỉ của từng môn.
SELECT TenMH, SoTC FROM MONHOC 

-- Câu 3: Liệt kê kết quả học tập của sinh viên có Mã số "SV003".
SELECT * FROM KETQUA WHERE MaSV = 'SV003'

-- Câu 4: Cho biết tên các môn học có chứa chữ "DU" (VD: Cơ sở dữ liệu, Cấu trúc dữ liệu, ...).
SELECT TenMH FROM MONHOC WHERE TenMH LIKE '%DU%'

-- Câu 5: Liệt kê tên, địa chỉ của những sinh viên ở đường "Cống Quỳnh".
SELECT Ten, DiaChi FROM SINHVIEN WHERE DiaChi LIKE '%CONG QUYNH%'

-- Câu 6: Liệt kê danh sách các môn học được dạy trong năm 2020.
SELECT DISTINCT MONHOC.MaMH, MONHOC.TenMH FROM GIANGDAY JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH WHERE Nam = 2020

-- Câu 7: Cho biết mã, tên, địa chỉ các SV theo từng khoa, sắp theo thứ tự A-Z của tên SV.
SELECT SV.MSSV, SV.Ten, SV.DiaChi, K.TenKhoa FROM SINHVIEN SV JOIN KHOA K ON SV.MaKhoa = K.MaKhoa ORDER BY K.TenKhoa, SV.Ten

-- Câu 8: Liệt kê điểm của tất cả sinh viên theo từng môn học.
SELECT SINHVIEN.Ten, MONHOC.TenMH, KETQUA.Diem 
FROM SINHVIEN
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
ORDER BY MONHOC.TenMH

-- Câu 9: Cho biết các sinh viên học môn 'CSDL' có điểm từ 8 đến 10.
SELECT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE MONHOC.MaMH = 'CSDL' and Diem between 8 and 10

-- Câu 10: Cho biết bảng điểm của sinh viên có tên là 'TÙNG'.
SELECT MH.TenMH, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
WHERE Ten LIKE N'%TUNG'

-- Câu 11: Cho biết tên khoa, tên môn học mà sinh viên trong khoa đã học.
SELECT DISTINCT KHOA.TenKhoa, MONHOC.TenMH
FROM KHOA
JOIN SINHVIEN ON KHOA.MaKhoa = SINHVIEN.MaKhoa
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH

-- Câu 12: Liệt kê các giáo viên tham gia giảng dạy môn "Kỹ thuật lập trình".
SELECT GIAOVIEN.MaGV, GIAOVIEN.TenGV
FROM GIAOVIEN
JOIN GIANGDAY ON GIAOVIEN.MaGV = GIANGDAY.MaGV
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE MONHOC.MaMH = 'KTLT'

-- Câu 13: Cho biết môn học mà giáo viên "Trần Văn Tiến" giảng dạy trong học kỳ 1 năm 2020.
SELECT MONHOC.MaMH, MONHOC.TenMH, MONHOC.SoTC
FROM MONHOC
JOIN GIANGDAY ON MONHOC.MaMH = GIANGDAY.MaMH
JOIN GIAOVIEN ON GIANGDAY.MaGV = GIAOVIEN.MaGV
WHERE TenGV = N'TRAN VAN TIEN'
AND HocKy = 1
AND Nam = 2020

-- Câu 14: Liệt kê sinh viên đã học môn 'CSDL' và 'CTDL'.
SELECT SINHVIEN.MSSV, SINHVIEN.Ten
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV
JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
WHERE MONHOC.MaMH IN ('CSDL','CTDL')
GROUP BY SINHVIEN.MSSV, SINHVIEN.Ten
HAVING COUNT(DISTINCT MONHOC.MaMH) = 2

-- Câu 15: Cho biết mã, tên sinh viên có ít nhất một môn đạt điểm > 8.
SELECT DISTINCT SINHVIEN.MSSV, SINHVIEN.Ten FROM SINHVIEN JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV WHERE Diem > 8

-- Câu 16: Cho biết nã, tên sinh viên có kết quả tất cả các môn đều trên 8 điểm .
SELECT SINHVIEN.MSSV, SINHVIEN.Ten FROM SINHVIEN JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MaSV GROUP BY SINHVIEN.MSSV, SINHVIEN.Ten HAVING MIN(Diem) > 8

-- Câu 17: Đếm số sinh viên nữ của khoa CNTT.
SELECT COUNT(MSSV) AS SVNu FROM SINHVIEN WHERE GioiTinh = N'Nữ' AND MaKhoa = 'CNTT'

-- Câu 18: Cho biết số lượng môn học được giảng dạy trong học kỳ 1 năm 2021.
SELECT COUNT(DISTINCT MaMH) AS SoMon FROM GIANGDAY WHERE HocKy = 1 AND Nam = 2021

-- Câu 19: Cho biết điểm trung bình của sinh viên có mã số 'SV004'.
SELECT MaSV, SUM(Diem * SoTC) / SUM(SoTC) AS DiemTrungBinh
FROM KETQUA
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MAMH
WHERE MaSV = 'SV004'
GROUP BY MaSV

-- Câu 20: Liệt kê mã, tên, địa chỉ và điểm trung bình của từng sinh viên.
SELECT SV.MSSV, SV.Ten, SV.DiaChi,
SUM(KQ.DIEM * MH.SoTC) / SUM(MH.SoTC) AS DiemTrungBinh
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.MSSV, SV.Ten, SV.DiaChi

-- Câu 21: Cho biết số lượng điểm >= 8 của từng sinh viên.
SELECT SINHVIEN.MSSV, COUNT(KETQUA.MaSV) as SoLuongDiemLonHon8
FROM SINHVIEN
LEFT JOIN KETQUA 
ON KETQUA.MaSV = SINHVIEN.MSSV 
AND KETQUA.Diem >= 8
GROUP BY SINHVIEN.MSSV 

-- Câu 22: Cho biết tên khoa, số lượng sinh viên theo học
SELECT KHOA.TenKhoa, COUNT(SINHVIEN.MSSV) as SoLuongSinhVien FROM KHOA LEFT JOIN SINHVIEN ON SINHVIEN.MaKhoa = KHOA.MaKhoa GROUP BY TenKhoa

-- Câu 23: Cho biết tên khoa, số lượng khóa học mà giảng viên của khoa đã giảng dạy.
SELECT K.TenKhoa, COUNT(GD.MaKhoaHoc) as SoLuongKhoaHoc
FROM KHOA K
LEFT JOIN GIAOVIEN GV ON GV.MaKhoa = K.MaKhoa 
LEFT JOIN GIANGDAY GD ON GD.MaGV = GV.MaGV 
GROUP BY K.MaKhoa, K.TenKhoa

-- Câu 24: Liệt kê tên sinh viên, điểm trung bình và số môn đã tham gia.
SELECT SINHVIEN.Ten, SUM(KETQUA.Diem * SoTC) / SUM(SoTC) as DiemTrungBinh, COUNT(KETQUA.MaKhoaHoc) as SoLuongMon
FROM SINHVIEN 
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MAMH
GROUP BY SINHVIEN.Ten

-- Câu 25: Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia.
SELECT SINHVIEN.MSSV, SUM(MONHOC.SoTC) as SoTinChi
FROM SINHVIEN 
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
GROUP BY SINHVIEN.MSSV 

-- Câu 26: Liệt kê tên sinh viên chỉ mới thi đúng 1 môn.
SELECT SINHVIEN.MSSV, COUNT(KETQUA.Diem) as SoLuongMonDaThi
FROM SINHVIEN
JOIN KETQUA ON KETQUA.MaSV = SINHVIEN.MSSV
GROUP BY SINHVIEN.MSSV
HAVING COUNT(KETQUA.Diem) = 1

-- Câu 27: Cho biết sinh viên có điểm trung bình > 8.5.
SELECT MaSV, SUM(Diem * SoTC) / SUM(SoTC) as DiemTrungBinh
FROM KETQUA 
JOIN GIANGDAY ON GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
GROUP BY MaSV
HAVING SUM(Diem * SoTC) / SUM(SoTC) > 8.5

-- Câu 28: Cho biết các khóa học có số lượng sinh viên tham gia từ 2 đến 4.
SELECT MaKhoaHoc, COUNT(MaSV) as SoLuongSinhVien
FROM KETQUA
GROUP BY MaKhoaHoc
HAVING COUNT(MaSV) between 2 and 4

-- Câu 29: Điểm cao nhất mà sinh viên đã đạt được trong tất cả các môn
SELECT MAX(Diem) as DiemCaoNhat FROM KETQUA

-- Câu 30: Cho biết tên môn học có nhiều sinh viên tham gia nhất. 
SELECT TOP 1 WITH TIES MONHOC.MaMH, MONHOC.TenMH, COUNT(SINHVIEN.MSSV) as SoLuongSinhVien
FROM MONHOC 
JOIN GIANGDAY ON GIANGDAY.MaMH = MONHOC.MaMH
JOIN KETQUA ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
JOIN SINHVIEN ON SINHVIEN.MSSV = KETQUA.MaSV
GROUP BY MONHOC.MaMH, MONHOC.TenMH
ORDER BY SoLuongSinhVien DESC

-- Câu 31: Với mỗi môn học, liệt kê tên và điểm của sinh viên có điểm cao nhất.
SELECT MONHOC.TenMH, SINHVIEN.Ten, KQ1.Diem
FROM KETQUA KQ1
JOIN SINHVIEN ON SINHVIEN.MSSV = KQ1.MaSV
JOIN GIANGDAY GD1 ON GD1.MaKhoaHoc = KQ1.MaKhoaHoc
JOIN MONHOC ON MONHOC.MaMH = GD1.MaMH
WHERE KQ1.DIEM = (
    SELECT MAX(KQ2.Diem)
    FROM KETQUA KQ2
    JOIN GIANGDAY GD2 ON GD2.MaKhoaHoc = KQ2.MaKhoaHoc
    WHERE GD1.MaMH = GD2.MaMH
)

-- Câu 32: Học kỳ nào có nhiều môn học được giảng dạy nhất.
SELECT TOP 1 WITH TIES HocKy, COUNT(MaMH) SoLuongMon
FROM GIANGDAY 
GROUP BY HocKy
ORDER BY SoLuongMon DESC

-- Câu 33: Cho biết tên sinh viên có nhiều điểm 7 nhất.
SELECT TOP 1 WITH TIES SV.MSSV, SV.Ten
FROM KETQUA KQ
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
WHERE Diem = 7
GROUP BY SV.MSSV, SV.Ten
ORDER BY COUNT(*) DESC

-- Câu 34: Cho biết tên sinh viên có số tín chỉ nhiều nhất.
SELECT TOP 1 WITH TIES SV.MSSV, SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.MSSV, SV.Ten
ORDER BY SUM(MH.SoTC) DESC

-- Câu 35: Cho biết môn học có số tín chỉ lớn nhất và nhỏ nhất.
SELECT * FROM MONHOC WHERE SoTC = (SELECT MAX(SoTC) FROM MONHOC) OR SoTC = (SELECT MIN(SoTC) FROM MONHOC)

-- Câu 36: Liệt kê tên giáo viên tham gia giảng dạy nhiều nhất.
SELECT TOP 1 WITH TIES GV.MaGV, GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
GROUP BY GV.MaGV, GV.TenGV
ORDER BY COUNT(*) DESC

-- Câu 37: Liệt kê các môn học chưa được tổ chức.
SELECT MH.MaMH, MH.TenMH
FROM MONHOC MH
WHERE NOT EXISTS (
    SELECT *
    FROM GIANGDAY GD
    WHERE GD.MaMH = MH.MaMH
)

-- Câu 38: Cho biết sinh viên đã học tất cả các môn học.
SELECT SV.MSSV, SV.Ten
FROM SINHVIEN SV
WHERE NOT EXISTS (
    SELECT *
    FROM MONHOC MH
    WHERE NOT EXISTS (
        SELECT *
        FROM GIANGDAY GD
        JOIN KETQUA KQ ON KQ.MaKhoaHoc = GD.MaKhoaHoc
        WHERE KQ.MaSV = SV.MSSV
          AND GD.MaMH = MH.MaMH
    )
)

-- Câu 39: Cho biết giáo viên giảng dạy tất cả các môn mà giáo viên 'GV03' đã dạy.
SELECT GV.MaGV, GV.TenGV
FROM GIAOVIEN GV
WHERE GV.MaGV <> 'GV03' 
AND NOT EXISTS (
    SELECT *
    FROM GIANGDAY GD1
    WHERE GD1.MaGV = 'GV03'
    AND NOT EXISTS (
        SELECT *
        FROM GIANGDAY GD2
        WHERE GD2.MaGV = GV.MaGV
          AND GD2.MaMH = GD1.MaMH
    )
)

-- Câu 40: Cho biết sinh viên đã học tất cả các môn mà sinh viên 'SV001' đã học.
SELECT SV.MSSV, SV.Ten
FROM SINHVIEN SV
WHERE SV.MSSV <> 'SV001'
AND NOT EXISTS (
    SELECT *
    FROM KETQUA KQ1
    JOIN GIANGDAY GD1 ON KQ1.MaKhoaHoc = GD1.MaKhoaHoc
    WHERE KQ1.MaSV = 'SV001'
    AND NOT EXISTS (
        SELECT *
        FROM KETQUA KQ2
        JOIN GIANGDAY GD2 ON KQ2.MaKhoaHoc = GD2.MaKhoaHoc
        WHERE KQ2.MaSV = SV.MSSV
          AND GD2.MaMH = GD1.MaMH
    )
)

-- Câu 41: Thêm các field SLMon (số lượng môn), DTB (điểm trung bình), XL (xếp loại) vào bảng SinhVien.
BEGIN TRAN

IF COL_LENGTH('SINHVIEN', 'SLMon') IS NULL ALTER TABLE SINHVIEN ADD SLMon INT
IF COL_LENGTH('SINHVIEN', 'DTB') IS NULL ALTER TABLE SINHVIEN ADD DTB FLOAT
IF COL_LENGTH('SINHVIEN', 'XL') IS NULL ALTER TABLE SINHVIEN ADD XL NVARCHAR(20)

ROLLBACK

/*
Câu 42: Cập nhật thông tin cho các field vừa tạo:
	SLMon: tổng số môn có điểm
	DTB: điểm trung bình
	XL: xếp loại theo thang (Yếu, Trung bình, Khá, Giỏi, Xuất sắc).
*/
BEGIN TRAN

UPDATE SV 
SET SLMon = T.SoMon, 
    DTB = T.DTB, 
    XL = CASE 
        WHEN T.DTB < 5 THEN N'Yếu' 
        WHEN T.DTB < 6.5 THEN N'Trung bình' 
        WHEN T.DTB < 8 THEN N'Khá' WHEN T.DTB < 9 
        THEN N'Giỏi' ELSE N'Xuất sắc' 
    END 
FROM SINHVIEN SV JOIN ( SELECT MaSV, COUNT(*) AS SoMon, AVG(Diem) AS DTB FROM KETQUA GROUP BY MaSV ) T ON SV.MSSV = T.MaSV

SELECT * FROM SINHVIEN

ROLLBACK

-- Câu 43: Xóa toàn bộ kết quả học tập của sinh viên 'SV002'.
BEGIN TRAN

DELETE FROM KETQUA WHERE MaSV = 'SV002'

SELECT * FROM KETQUA WHERE MaSV = 'SV002'

ROLLBACK

-- Câu 44: Xóa các sinh viên có điểm trung bình < 5.
BEGIN TRAN

-- Xóa kết quả trước
DELETE FROM KETQUA
WHERE MaSV IN (
    SELECT SV.MSSV
    FROM SINHVIEN SV
    JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
    JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
    JOIN MONHOC MH ON GD.MaMH = MH.MaMH
    GROUP BY SV.MSSV
    HAVING SUM(KQ.Diem * MH.SoTC) / SUM(MH.SoTC) < 5
);

-- Sau đó xóa sinh viên
DELETE FROM SINHVIEN
WHERE MSSV IN (
    SELECT SV.MSSV
    FROM SINHVIEN SV
    JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
    JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
    JOIN MONHOC MH ON GD.MaMH = MH.MaMH
    GROUP BY SV.MSSV
    HAVING SUM(KQ.Diem * MH.SoTC) / SUM(MH.SoTC) < 5
);

SELECT * FROM SINHVIEN

SELECT * FROM KETQUA

ROLLBACK

-- Câu 45: Xóa những khoa không có sinh viên theo học.
BEGIN TRAN

DELETE FROM KHOA WHERE NOT EXISTS ( SELECT * FROM SINHVIEN SV WHERE SV.MaKhoa = KHOA.MaKhoa )

SELECT * FROM KHOA

ROLLBACK



--Bai tap chuong 6

--STORE PROCEDURE

/*
1
sp_SelectSinhVien(@Masv) 
Thực hiện các thủ tục tương tự đối với các bảng còn lại
Hiển thị thông tin dựa vào mã truyền vào
*/

--SINHVIEN 
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_SinhVien')
    DROP PROCEDURE sp_Select_SinhVien;
GO

CREATE PROCEDURE sp_Select_SinhVien
    @Masv VARCHAR(5)
AS
BEGIN
    SELECT MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa
    FROM SINHVIEN
    WHERE MSSV = @Masv;
END;
GO

EXEC sp_Select_SinhVien 'SV001';

-- KHOA
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_Khoa')
    DROP PROCEDURE sp_Select_Khoa;
GO

CREATE PROCEDURE sp_Select_Khoa
    @MaKhoa VARCHAR(10)
AS
BEGIN
    SELECT MaKhoa, TenKhoa, SL_CBGD
    FROM KHOA
    WHERE MaKhoa = @MaKhoa;
END;
GO

EXEC sp_Select_Khoa 'CNTT';

-- GIAOVIEN
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_GiaoVien')
    DROP PROCEDURE sp_Select_GiaoVien;
GO

CREATE PROCEDURE sp_Select_GiaoVien
    @MaGV VARCHAR(5)
AS
BEGIN
    SELECT MaGV, TenGV, MaKhoa
    FROM GIAOVIEN
    WHERE MaGV = @MaGV;
END;
GO

EXEC sp_Select_GiaoVien 'GV01';

-- MONHOC
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_MonHoc')
    DROP PROCEDURE sp_Select_MonHoc;
GO

CREATE PROCEDURE sp_Select_MonHoc
    @MaMH VARCHAR(5)
AS
BEGIN
    SELECT MaMH, TenMH, SoTC
    FROM MONHOC
    WHERE MaMH = @MaMH;
END;
GO

EXEC sp_Select_MonHoc 'CSDL';

-- GIANGDAY
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_GiangDay')
    DROP PROCEDURE sp_Select_GiangDay;
GO

CREATE PROCEDURE sp_Select_GiangDay
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    SELECT MaKhoaHoc, MaGV, MaMH, HocKy, Nam
    FROM GIANGDAY
    WHERE MaKhoaHoc = @MaKhoaHoc;
END;
GO

EXEC sp_Select_GiangDay 'K1';

-- KETQUA
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'sp_Select_KetQua')
    DROP PROCEDURE sp_Select_KetQua;
GO

CREATE PROCEDURE sp_Select_KetQua
    @Masv VARCHAR(5),
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    SELECT MaSV, MaKhoaHoc, Diem
    FROM KETQUA
    WHERE MaSV = @Masv AND MaKhoaHoc = @MaKhoaHoc;
END;
GO

EXEC sp_Select_KetQua 'SV001', 'K1';

/*
2
sp_Insert_Sinhvien(@Masv, @Hoten, @Diachi, @Malop) 
Thực hiện các thủ tục tương tự đối với các bảng còn lại
Thêm mới thông tin vào một bảng, yêu cầu masv bắt buộc phải có, nếu không hiền thị thông báo lỗi
*/

--SINHVIEN
IF OBJECT_ID('sp_Insert_Sinhvien', 'P') IS NOT NULL
    DROP PROCEDURE sp_Insert_Sinhvien;

CREATE PROCEDURE sp_Insert_Sinhvien
    @MaSV VARCHAR(5),
    @Hoten NVARCHAR(50),
    @Diachi NVARCHAR(100),
    @Malop VARCHAR(10)
AS
BEGIN
    -- Kiểm tra MaSV bắt buộc
    IF @MaSV IS NULL OR LTRIM(RTRIM(@MaSV)) = ''
    BEGIN
        PRINT N'Lỗi: Mã sinh viên không được để trống!';
        RETURN;
    END

    -- Kiểm tra trùng khóa chính
    IF EXISTS (SELECT 1 FROM SINHVIEN WHERE MSSV = @MaSV)
    BEGIN
        PRINT N'Lỗi: Mã sinh viên đã tồn tại!';
        RETURN;
    END

    -- Thêm dữ liệu
    INSERT INTO SINHVIEN(MSSV, Ten, GioiTinh, DiaChi, MaKhoa)
    VALUES(@MaSV, @Hoten, N'Nam', @Diachi, @Malop);

    PRINT N'Thêm sinh viên thành công!';
END


--KHOA 
IF OBJECT_ID('sp_Insert_Khoa','P') IS NOT NULL 
    DROP PROCEDURE sp_Insert_Khoa


CREATE PROCEDURE sp_Insert_Khoa
    @Makhoa varchar(10),
    @Tenkhoa nvarchar(50),
    @Slcb smallint
AS
BEGIN
    IF @Makhoa IS NULL OR TRIM(@Makhoa) = ''
    BEGIN
        PRINT N'Lỗi: Mã khoa không được để trống!';
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM KHOA WHERE MaKhoa = @Makhoa)
    BEGIN
        PRINT N'Lỗi: Mã khoa đã tồn tại!';
        RETURN;
    END

    INSERT INTO KHOA(MaKhoa, TenKhoa, SL_CBGD) 
    VALUES(@Makhoa, @Tenkhoa, @Slcb)

END


-- GIAOVIEN 
IF OBJECT_ID('sp_Insert_GiaoVien','P') IS NOT NULL DROP PROCEDURE sp_Insert_GiaoVien
GO
CREATE PROCEDURE sp_Insert_GiaoVien
    @MaGV   VARCHAR(5),
    @TenGV  NVARCHAR(50),
    @MaKhoa VARCHAR(10)
AS
BEGIN
    IF @MaGV IS NULL OR LTRIM(RTRIM(@MaGV)) = ''
        BEGIN PRINT N'Lỗi: Mã giáo viên không được để trống!'; RETURN END
    IF EXISTS (SELECT 1 FROM GIAOVIEN WHERE MaGV = @MaGV)
        BEGIN PRINT N'Lỗi: Mã giáo viên đã tồn tại!'; RETURN END
    IF @MaKhoa IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KHOA WHERE MaKhoa = @MaKhoa)
        BEGIN PRINT N'Lỗi: Mã khoa không tồn tại!'; RETURN END

    INSERT INTO GIAOVIEN(MaGV, TenGV, MaKhoa) VALUES(@MaGV, @TenGV, @MaKhoa)
    PRINT N'Thêm giáo viên thành công!'
END
GO

-- MONHOC 
IF OBJECT_ID('sp_Insert_MonHoc','P') IS NOT NULL DROP PROCEDURE sp_Insert_MonHoc
GO
CREATE PROCEDURE sp_Insert_MonHoc
    @MaMH  VARCHAR(5),
    @TenMH NVARCHAR(50),
    @SoTC  SMALLINT
AS
BEGIN
    IF @MaMH IS NULL OR LTRIM(RTRIM(@MaMH)) = ''
        BEGIN PRINT N'Lỗi: Mã môn học không được để trống!'; RETURN END
    IF EXISTS (SELECT 1 FROM MONHOC WHERE MaMH = @MaMH)
        BEGIN PRINT N'Lỗi: Mã môn học đã tồn tại!'; RETURN END
    IF @SoTC < 2 OR @SoTC > 6
        BEGIN PRINT N'Lỗi: Số tín chỉ phải từ 2 đến 6!'; RETURN END

    INSERT INTO MONHOC(MaMH, TenMH, SoTC) VALUES(@MaMH, @TenMH, @SoTC)
    PRINT N'Thêm môn học thành công!'
END
GO


-- GIANGDAY 
IF OBJECT_ID('sp_Insert_GiangDay','P') IS NOT NULL DROP PROCEDURE sp_Insert_GiangDay
GO
CREATE PROCEDURE sp_Insert_GiangDay
    @MaKhoaHoc VARCHAR(5), @MaGV VARCHAR(5),
    @MaMH VARCHAR(5), @HocKy SMALLINT, @Nam INT
AS
BEGIN
    IF @MaKhoaHoc IS NULL OR LTRIM(RTRIM(@MaKhoaHoc)) = ''
        BEGIN PRINT N'Lỗi: Mã khóa học không được để trống!'; RETURN END
    IF EXISTS (SELECT 1 FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Mã khóa học đã tồn tại!'; RETURN END
    IF NOT EXISTS (SELECT 1 FROM GIAOVIEN WHERE MaGV = @MaGV)
        BEGIN PRINT N'Lỗi: Mã giáo viên không tồn tại!'; RETURN END
    IF NOT EXISTS (SELECT 1 FROM MONHOC WHERE MaMH = @MaMH)
        BEGIN PRINT N'Lỗi: Mã môn học không tồn tại!'; RETURN END

    INSERT INTO GIANGDAY(MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
    VALUES(@MaKhoaHoc, @MaGV, @MaMH, @HocKy, @Nam)
    PRINT N'Thêm giảng dạy thành công!'
END
GO

-- KETQUA 
IF OBJECT_ID('sp_Insert_KetQua','P') IS NOT NULL DROP PROCEDURE sp_Insert_KetQua
GO
CREATE PROCEDURE sp_Insert_KetQua
    @MaSV VARCHAR(5), @MaKhoaHoc VARCHAR(5), @Diem DECIMAL(3,1)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM SINHVIEN WHERE MSSV = @MaSV)
        BEGIN PRINT N'Lỗi: Mã sinh viên không tồn tại!'; RETURN END
    IF NOT EXISTS (SELECT 1 FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Mã khóa học không tồn tại!'; RETURN END
    IF EXISTS (SELECT 1 FROM KETQUA WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Kết quả đã tồn tại!'; RETURN END
    IF @Diem < 0 OR @Diem > 10
        BEGIN PRINT N'Lỗi: Điểm phải từ 0 đến 10!'; RETURN END

    INSERT INTO KETQUA(MaSV, MaKhoaHoc, Diem) VALUES(@MaSV, @MaKhoaHoc, @Diem)
    PRINT N'Thêm kết quả thành công!'
END
GO

/*
3 
sp_Update_Sinhvien(@Masv, @Hoten, @Diachi, @Malop) 
Thực hiện các thủ tục tương tự đối với các bảng còn lại
Sửa thông tin dựa vào masv. Kiểm tra nếu biến nào khác NULL thì mới cập nhật.
*/


--SINHVIEN
IF OBJECT_ID('sp_Update_SinhVien', 'P') IS NOT NULL
    DROP PROCEDURE sp_Update_SinhVien
GO

CREATE PROCEDURE sp_Update_SinhVien(
    @Masv varchar(5), 
    @Hoten nvarchar(50) = NULL, 
    @Diachi nvarchar(100) = NULL, 
    @Malop varchar(10) = NULL
)
AS
BEGIN
	UPDATE SINHVIEN
	SET Ten = ISNULL(@Hoten, Ten),
		DiaChi = ISNULL(@Diachi, DiaChi),
		MaKhoa = ISNULL(@Malop, MaKhoa)
	WHERE @Masv = MSSV;
END
GO

EXEC sp_Update_SinhVien @Masv = 'SV001', @Hoten = N'NGUYEN VAN NAM'
GO

-- KHOA
IF OBJECT_ID('sp_Update_Khoa','P') IS NOT NULL DROP PROCEDURE sp_Update_Khoa
GO
CREATE PROCEDURE sp_Update_Khoa
    @MaKhoa  VARCHAR(10),
    @TenKhoa NVARCHAR(50) = NULL,
    @SL_CBGD SMALLINT     = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM KHOA WHERE MaKhoa = @MaKhoa)
        BEGIN PRINT N'Lỗi: Mã khoa không tồn tại!'; RETURN END

    UPDATE KHOA
    SET TenKhoa = ISNULL(@TenKhoa, TenKhoa),
        SL_CBGD = ISNULL(@SL_CBGD, SL_CBGD)
    WHERE MaKhoa = @MaKhoa
    PRINT N'Cập nhật khoa thành công!'
END
GO

-- GIAOVIEN
IF OBJECT_ID('sp_Update_GiaoVien','P') IS NOT NULL DROP PROCEDURE sp_Update_GiaoVien
GO
CREATE PROCEDURE sp_Update_GiaoVien
    @MaGV   VARCHAR(5),
    @TenGV  NVARCHAR(50) = NULL,
    @MaKhoa VARCHAR(10)  = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GIAOVIEN WHERE MaGV = @MaGV)
        BEGIN PRINT N'Lỗi: Giáo viên không tồn tại!'; RETURN END
    IF @MaKhoa IS NOT NULL AND NOT EXISTS (SELECT 1 FROM KHOA WHERE MaKhoa = @MaKhoa)
        BEGIN PRINT N'Lỗi: Mã khoa không tồn tại!'; RETURN END

    UPDATE GIAOVIEN
    SET TenGV  = ISNULL(@TenGV,  TenGV),
        MaKhoa = ISNULL(@MaKhoa, MaKhoa)
    WHERE MaGV = @MaGV
    PRINT N'Cập nhật giáo viên thành công!'
END
GO

-- MONHOC
IF OBJECT_ID('sp_Update_MonHoc','P') IS NOT NULL DROP PROCEDURE sp_Update_MonHoc
GO
CREATE PROCEDURE sp_Update_MonHoc
    @MaMH  VARCHAR(5),
    @TenMH NVARCHAR(50) = NULL,
    @SoTC  SMALLINT     = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM MONHOC WHERE MaMH = @MaMH)
        BEGIN PRINT N'Lỗi: Môn học không tồn tại!'; RETURN END
    IF @SoTC IS NOT NULL AND (@SoTC < 2 OR @SoTC > 6)
        BEGIN PRINT N'Lỗi: Số tín chỉ phải từ 2 đến 6!'; RETURN END

    UPDATE MONHOC
    SET TenMH = ISNULL(@TenMH, TenMH),
        SoTC  = ISNULL(@SoTC,  SoTC)
    WHERE MaMH = @MaMH
    PRINT N'Cập nhật môn học thành công!'
END
GO

-- GIANGDAY
IF OBJECT_ID('sp_Update_GiangDay','P') IS NOT NULL DROP PROCEDURE sp_Update_GiangDay
GO
CREATE PROCEDURE sp_Update_GiangDay
    @MaKhoaHoc VARCHAR(5),
    @MaGV      VARCHAR(5)  = NULL,
    @MaMH      VARCHAR(5)  = NULL,
    @HocKy     SMALLINT    = NULL,
    @Nam       INT         = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Khóa học không tồn tại!'; RETURN END
    IF @MaGV IS NOT NULL AND NOT EXISTS (SELECT 1 FROM GIAOVIEN WHERE MaGV = @MaGV)
        BEGIN PRINT N'Lỗi: Mã giáo viên không tồn tại!'; RETURN END
    IF @MaMH IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MONHOC WHERE MaMH = @MaMH)
        BEGIN PRINT N'Lỗi: Mã môn học không tồn tại!'; RETURN END

    UPDATE GIANGDAY
    SET MaGV  = ISNULL(@MaGV,  MaGV),
        MaMH  = ISNULL(@MaMH,  MaMH),
        HocKy = ISNULL(@HocKy, HocKy),
        Nam   = ISNULL(@Nam,   Nam)
    WHERE MaKhoaHoc = @MaKhoaHoc
    PRINT N'Cập nhật giảng dạy thành công!'
END
GO

-- KETQUA
IF OBJECT_ID('sp_Update_KetQua','P') IS NOT NULL DROP PROCEDURE sp_Update_KetQua
GO
CREATE PROCEDURE sp_Update_KetQua
    @MaSV      VARCHAR(5),
    @MaKhoaHoc VARCHAR(5),
    @Diem      DECIMAL(3,1) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM KETQUA WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Kết quả không tồn tại!'; RETURN END
    IF @Diem IS NOT NULL AND (@Diem < 0 OR @Diem > 10)
        BEGIN PRINT N'Lỗi: Điểm phải từ 0 đến 10!'; RETURN END

    UPDATE KETQUA
    SET Diem = ISNULL(@Diem, Diem)
    WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc
    PRINT N'Cập nhật kết quả thành công!'
END
GO

/*
4
sp_ Delete_SinhVien(@Masv)
Thực hiện các thủ tục tương tự đối với các bảng còn lại
Xóa thông tin dựa vào mã truyền vào
*/

-- SINHVIEN

IF OBJECT_ID('sp_Delete_SinhVien', 'P') IS NOT NULL
    DROP PROCEDURE sp_Delete_SinhVien;
GO
CREATE PROCEDURE sp_Delete_SinhVien
    @Masv VARCHAR(5)
AS
BEGIN
    -- Kiểm tra tồn tại
    IF NOT EXISTS (SELECT 1 FROM SINHVIEN WHERE MSSV = @Masv)
    BEGIN
        PRINT N'Lỗi: Sinh viên không tồn tại!';
        RETURN;
    END

    -- Xóa dữ liệu liên quan trước (tránh lỗi khóa ngoại)
    DELETE FROM KETQUA WHERE MaSV = @Masv;

    -- Xóa sinh viên
    DELETE FROM SINHVIEN WHERE MSSV = @Masv;

    PRINT N'Xóa sinh viên thành công!';
END
GO

-- KHOA
IF OBJECT_ID('sp_Delete_Khoa','P') IS NOT NULL DROP PROCEDURE sp_Delete_Khoa
GO
CREATE PROCEDURE sp_Delete_Khoa
    @MaKhoa VARCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM KHOA WHERE MaKhoa = @MaKhoa)
        BEGIN PRINT N'Lỗi: Khoa không tồn tại!'; RETURN END

    UPDATE SINHVIEN SET MaKhoa = NULL WHERE MaKhoa = @MaKhoa
    UPDATE GIAOVIEN SET MaKhoa = NULL WHERE MaKhoa = @MaKhoa
    DELETE FROM KHOA WHERE MaKhoa = @MaKhoa
    PRINT N'Xóa khoa thành công!'
END
GO

-- GIAOVIEN
IF OBJECT_ID('sp_Delete_GiaoVien','P') IS NOT NULL DROP PROCEDURE sp_Delete_GiaoVien
GO
CREATE PROCEDURE sp_Delete_GiaoVien
    @MaGV VARCHAR(5)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GIAOVIEN WHERE MaGV = @MaGV)
        BEGIN PRINT N'Lỗi: Giáo viên không tồn tại!'; RETURN END

    DELETE FROM KETQUA
    WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM GIANGDAY WHERE MaGV = @MaGV)

    DELETE FROM GIANGDAY WHERE MaGV = @MaGV
    DELETE FROM GIAOVIEN WHERE MaGV = @MaGV
    PRINT N'Xóa giáo viên thành công!'
END
GO

-- MONHOC
IF OBJECT_ID('sp_Delete_MonHoc','P') IS NOT NULL DROP PROCEDURE sp_Delete_MonHoc
GO
CREATE PROCEDURE sp_Delete_MonHoc
    @MaMH VARCHAR(5)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM MONHOC WHERE MaMH = @MaMH)
        BEGIN PRINT N'Lỗi: Môn học không tồn tại!'; RETURN END

    DELETE FROM KETQUA
    WHERE MaKhoaHoc IN (SELECT MaKhoaHoc FROM GIANGDAY WHERE MaMH = @MaMH)

    DELETE FROM GIANGDAY WHERE MaMH = @MaMH
    DELETE FROM MONHOC   WHERE MaMH = @MaMH
    PRINT N'Xóa môn học thành công!'
END
GO

-- GIANGDAY
IF OBJECT_ID('sp_Delete_GiangDay','P') IS NOT NULL DROP PROCEDURE sp_Delete_GiangDay
GO
CREATE PROCEDURE sp_Delete_GiangDay
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Khóa học không tồn tại!'; RETURN END

    DELETE FROM KETQUA   WHERE MaKhoaHoc = @MaKhoaHoc
    DELETE FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc
    PRINT N'Xóa giảng dạy thành công!'
END
GO

-- KETQUA
IF OBJECT_ID('sp_Delete_KetQua','P') IS NOT NULL DROP PROCEDURE sp_Delete_KetQua
GO
CREATE PROCEDURE sp_Delete_KetQua
    @MaSV VARCHAR(5), @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM KETQUA WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc)
        BEGIN PRINT N'Lỗi: Kết quả không tồn tại!'; RETURN END

    DELETE FROM KETQUA WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc
    PRINT N'Xóa kết quả thành công!'
END
GO

--TRIGGER

select * from sys.triggers 


-- 5. Khi thêm bảng Sinh Vien: Nếu mã khoa không tồn tại bên bảng KHOA, nếu mã sv để trống hoặc bị trùng thì không cho thêm vào.

IF OBJECT_ID('trg_InsertSV', 'tr') IS NOT NULL
    DROP TRIGGER trg_InsertSV;
GO

CREATE TRIGGER trg_InsertSV
ON SINHVIEN
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE MSSV IS NULL OR LTRIM(RTRIM(MSSV)) = ''
    )
        BEGIN
            PRINT(N'Lỗi: Mã sinh viên không được để trống!');
            RETURN;
        END

    IF EXISTS (
        SELECT 1 
        FROM SINHVIEN sv 
        JOIN inserted i ON sv.MSSV = i.MSSV
    )
        BEGIN
            PRINT(N'Lỗi: Mã sinh viên đã tồn tại!');
            RETURN;
        END

    IF EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE i.MaKhoa IS NOT NULL
        AND NOT EXISTS (
            SELECT 1 FROM KHOA k WHERE k.MaKhoa = i.MaKhoa
        )
    )
        BEGIN
            PRINT(N'Lỗi: Mã khoa không tồn tại!');
            RETURN;
        END

    INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
    SELECT MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa
    FROM inserted;
END;
GO

-- Ví dụ

INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa) VALUES ('', N'Nguyen Van A', N'Nam', N'HCM', NULL, 'CNTT');

INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa) VALUES ('SV001', N'Nguyen Van B', N'Nam', N'HCM', NULL, 'CNTT');

INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa) VALUES ('SV099', N'Nguyen Van C', N'Nam', N'HCM', NULL, 'VATLY');

INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa) VALUES ('SV006', N'Nguyen Van D', N'Nam', N'HCM', NULL, 'CNTT');

SELECT * FROM SINHVIEN 

-- 6. Khi thêm vào bảng MonHoc: tinchi phải >=2 và <=6

IF OBJECT_ID('trg_InsertMH', 'tr') IS NOT NULL
    DROP TRIGGER trg_InsertMH;
GO
CREATE TRIGGER trg_InsertMH
ON MONHOC
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE SoTC < 2 OR SoTC > 6
    )
        BEGIN
            PRINT N'Lỗi: Số tín chỉ phải từ 2 đến 6!';
            RETURN;
        END

    INSERT INTO MONHOC(MaMH, TenMH, SoTC)
    SELECT MaMH, TenMH, SoTC
    FROM inserted 
END
GO

-- Ví dụ 

INSERT INTO MONHOC VALUES ('MH01', N'Môn Test', 1);

INSERT INTO MONHOC VALUES ('MH02', N'Môn Test', 7);

INSERT INTO MONHOC VALUES ('NMLT', N'NHAP MON LAP TRINH', 3);

SELECT * FROM MONHOC 

-- 7. Khi sửa bảng Sinh Vien, sửa đổi MSSV tương ứng ở bảng KETQUA

IF OBJECT_ID('trg_UpdateSV', 'tr') IS NOT NULL
    DROP TRIGGER trg_UpdateSV;
GO
CREATE TRIGGER trg_UpdateSV
ON SINHVIEN
INSTEAD OF UPDATE
AS
BEGIN
    IF UPDATE(MSSV)
    BEGIN
        DECLARE @oldMSSV varchar(5) = (SELECT MSSV FROM deleted);
        DECLARE @newMSSV varchar(5) = (SELECT MSSV FROM inserted);

        ALTER TABLE KETQUA NOCHECK CONSTRAINT fk_kq_msv;

        UPDATE SINHVIEN
        SET MSSV = @newMSSV
        WHERE MSSV = @oldMSSV;

        UPDATE KETQUA
        SET MaSV = @newMSSV
        WHERE MaSV = @oldMSSV;

        ALTER TABLE KETQUA CHECK CONSTRAINT fk_kq_msv;
    END
    ELSE
        BEGIN
            UPDATE SINHVIEN
            SET Ten       = i.Ten,
                GioiTinh  = i.GioiTinh,
                DiaChi    = i.DiaChi,
                DienThoai = i.DienThoai,
                MaKhoa    = i.MaKhoa
            FROM SINHVIEN sv
            JOIN inserted i ON sv.MSSV = i.MSSV;
        END
END;
GO

-- Ví dụ 

SELECT * FROM SINHVIEN WHERE MSSV = 'SV001';
SELECT * FROM KETQUA   WHERE MaSV = 'SV001';

UPDATE SINHVIEN SET MSSV = 'SV010' WHERE MSSV = 'SV001';

SELECT * FROM SINHVIEN WHERE MSSV = 'SV010'; 
SELECT * FROM KETQUA   WHERE MaSV = 'SV010'; 
SELECT * FROM SINHVIEN WHERE MSSV = 'SV001'; 
SELECT * FROM KETQUA   WHERE MaSV = 'SV001'; 

-- 8. Khi sửa bảng KHOA, sửa đổi MaKhoa trên bảng SinhVien

IF OBJECT_ID('trg_UpdateKhoa','TR') IS NOT NULL DROP TRIGGER trg_UpdateKhoa
GO
CREATE TRIGGER trg_UpdateKhoa ON KHOA INSTEAD OF UPDATE
AS
BEGIN
    IF UPDATE(MaKhoa)
    BEGIN
        DECLARE @oldMaKhoa VARCHAR(10) = (SELECT MaKhoa FROM deleted)
        DECLARE @newMaKhoa VARCHAR(10) = (SELECT MaKhoa FROM inserted)

        ALTER TABLE SINHVIEN NOCHECK CONSTRAINT fk_sv_mk
        ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT fk_gv_mk

        UPDATE KHOA     SET MaKhoa = @newMaKhoa WHERE MaKhoa = @oldMaKhoa
        UPDATE SINHVIEN SET MaKhoa = @newMaKhoa WHERE MaKhoa = @oldMaKhoa
        UPDATE GIAOVIEN SET MaKhoa = @newMaKhoa WHERE MaKhoa = @oldMaKhoa  -- [THÊM]

        ALTER TABLE SINHVIEN CHECK CONSTRAINT fk_sv_mk
        ALTER TABLE GIAOVIEN CHECK CONSTRAINT fk_gv_mk
    END
    ELSE
    BEGIN
        UPDATE KHOA
        SET TenKhoa = i.TenKhoa, SL_CBGD = i.SL_CBGD
        FROM KHOA k JOIN inserted i ON k.MaKhoa = i.MaKhoa
    END
END
GO

-- Ví dụ 

SELECT * FROM KHOA     WHERE MaKhoa = 'CNTT';
SELECT * FROM SINHVIEN WHERE MaKhoa = 'CNTT';

UPDATE KHOA SET MaKhoa = 'IT' WHERE MaKhoa = 'CNTT';

SELECT * FROM KHOA     WHERE MaKhoa = 'IT';   
SELECT * FROM SINHVIEN WHERE MaKhoa = 'IT';   
SELECT * FROM KHOA     WHERE MaKhoa = 'CNTT'; 
SELECT * FROM SINHVIEN WHERE MaKhoa = 'CNTT'; 

-- 9. Khi sửa bảng monhoc, sửa đổi MAMH trên bảng GIANGDAY

IF OBJECT_ID('trg_UpdateMH', 'tr') IS NOT NULL
    DROP TRIGGER trg_UpdateMH;
GO
CREATE TRIGGER trg_UpdateMH
ON MONHOC
INSTEAD OF UPDATE
AS
BEGIN
    IF UPDATE(MaMH)
        BEGIN
            DECLARE @oldMaMH varchar(5) = (SELECT MaMH FROM deleted);
            DECLARE @newMaMH varchar(5) = (SELECT MaMH FROM inserted);

            ALTER TABLE GIANGDAY NOCHECK CONSTRAINT fk_gd_mmh;

            UPDATE MONHOC
            SET MaMH = @newMaMH
            WHERE MaMH = @oldMaMH;

            UPDATE GIANGDAY
            SET MaMH = @newMaMH
            WHERE MaMH = @oldMaMH;

            ALTER TABLE GIANGDAY CHECK CONSTRAINT fk_gd_mmh;
        END
    ELSE
        BEGIN
            UPDATE MONHOC
            SET TenMH = i.TenMH,
                SoTC  = i.SoTC
            FROM MONHOC m
            JOIN inserted i ON m.MaMH = i.MaMH;
        END
END;
GO

-- Ví dụ

UPDATE MONHOC SET MaMH = 'DSA' WHERE MaMH = 'CTDL'
SELECT * FROM MONHOC 
SELECT * FROM GIANGDAY 

-- 10. Khi xóa bảng Sinh Vien. Xóa những sinh viên tương ứng trong bảng KetQua

IF OBJECT_ID('trg_DeleteSV', 'tr') IS NOT NULL
    DROP TRIGGER trg_DeleteSV;
GO
CREATE TRIGGER trg_DeleteSV
ON SINHVIEN
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM KETQUA
    WHERE MaSV IN (SELECT MSSV FROM deleted);

    DELETE FROM SINHVIEN
    WHERE MSSV IN (SELECT MSSV FROM deleted);
END;
GO

-- Ví dụ

DELETE SINHVIEN WHERE MSSV = 'SV001'
SELECT * FROM SINHVIEN 
SELECT * FROM KETQUA 

-- 11. Xóa bảng MonHoc, xóa mã môn học tương ứng trên bảng GIANGDAY

IF OBJECT_ID('trg_DeleteMH', 'tr') IS NOT NULL
    DROP TRIGGER trg_DeleteMH;
GO
CREATE TRIGGER trg_DeleteMH
ON MONHOC
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM KETQUA WHERE MaKhoaHoc IN ( SELECT MaKhoaHoc FROM GIANGDAY WHERE MaMH IN (SELECT MaMH FROM deleted));

    DELETE FROM GIANGDAY WHERE MaMH IN (SELECT MaMH FROM deleted);

    DELETE FROM MONHOC WHERE MaMH IN (SELECT MaMH FROM deleted);
END;
GO

-- Ví dụ

DELETE FROM MONHOC WHERE MaMH = 'NMLT';
SELECT * FROM MONHOC;
SELECT * FROM GIANGDAY;
SELECT * FROM KETQUA;