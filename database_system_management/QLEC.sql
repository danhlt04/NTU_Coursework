/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLECommerce') IS NOT NULL
		DROP DATABASE QLECommerce
	GO

*/

CREATE DATABASE QLECommerce

USE QLECommerce 

CREATE TABLE KHACHHANG (
	MaKH varchar(10) constraint pk_kh_mkh primary key,
	HoTen nvarchar(100) not null,
	Email varchar(100) unique not null,
	DienThoai varchar(20) null,
	NgayDangKy datetime2 not null default sysdatetime(),
	TrangThai bit not null default 1
)

CREATE TABLE DIACHI (
	MaDiaChi int identity(1, 1) constraint pk_dc_mdc primary key,
	MaKH varchar(10) not null constraint fk_dc_mkh foreign key(MaKH) references KHACHHANG(MaKH),
	SoNha nvarchar(50) not null,
	Duong nvarchar(100) not null,
	QuanHuyen nvarchar(100) not null,
	TinhThanh nvarchar(100) not null,
	QuocGia nvarchar(100) not null,
	LaMacDinh bit not null default 0
)

CREATE TABLE DANHMUC (
	MaDM varchar(10) constraint pk_dm_mdm primary key,
	TenDM nvarchar(100) not null,
	MaDMCha varchar(10) null constraint fk_dm_mdmc foreign key(MaDMCha) references DANHMUC(MaDM)
)

CREATE TABLE SANPHAM (
	MaSP varchar(10) constraint pk_sp_msp primary key,
	TenSP nvarchar(150) not null,
	MaDM varchar(10) not null constraint fk_sp_mdm foreign key(MaDM) references DANHMUC(MaDM),
	MoTa nvarchar(500) null,
	Gia decimal(18,2) not null check(Gia>=0),
	TrangThai bit not null default 1,
	ThuocTinhJSON nvarchar(MAX) null
)

CREATE TABLE KHO (
	MaSP varchar(10) constraint pk_k_msp primary key constraint fk_k_msp foreign key(MaSP) references SANPHAM(MaSP),
	SoLuong int not null check(SoLuong>=0),
	CapNhatLanCuoi datetime2 not null default sysdatetime()
)

CREATE TABLE DONDATHANG (
	MaDon varchar(12) constraint pk_ddh_md primary key,
	MaKH varchar(10) not null constraint fk_ddh_mkh foreign key(MaKH) references KHACHHANG(MaKH),
	NgayDat datetime2 not null default sysdatetime(),
	TongTien decimal(18,2) not null check(TongTien>=0),
	TrangThai nvarchar(30) not null default N'CHO_THANH_TOAN'
)

CREATE TABLE CTDONDATHANG (
	MaDon varchar(12) not null constraint fk_ctddh_md foreign key(MaDon) references DONDATHANG(MaDon),
	MaSP varchar(10) not null constraint fk_ctdh_msp foreign key(MaSP) references SANPHAM(MaSP),
	SoLuong int not null check (SoLuong > 0),
	DonGia decimal(18,2) not null check(DonGia>=0),
	ChietKhau decimal(5,2) not null default 0 check(ChietKhau between 0 and 100),
	constraint pk_ctddh_md_msp primary key(MaDon, MaSP)
)

CREATE TABLE THANHTOAN (
	MaTT bigint identity(1, 1) constraint pk_tt_mtt primary key,
	MaDon varchar(12) not null constraint fk_tt_md foreign key(MaDon) references DONDATHANG(MaDon),
	PhuongThuc nvarchar(50) not null,
	SoTien decimal(18,2) not null check(SoTien>=0), 
	ThoiDiem datetime2 not null default sysdatetime(),
	TrangThai nvarchar(30) not null 
)

CREATE TABLE VANCHUYEN (
	MaVC bigint identity(1, 1) constraint pk_vc_mvc primary key,
	MaDon varchar(12) not null constraint fk_vc_md foreign key(MaDon) references DONDATHANG(MaDon),
	MaDiaChi int not null constraint fk_vc_mdc foreign key(MaDiaChi) references DIACHI(MaDiaChi),
	DonViVC nvarchar(100) not null,
	MaVanDon nvarchar(50) null,
	TrangThai nvarchar(30) not null default N'CHO_LAY_HANG',
	NgayCapNhat datetime2 not null default sysdatetime()
)

-- 1. Tắt kiểm tra khóa ngoại trên toàn hệ thống
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

-- 2. Xóa sạch dữ liệu và reset ID tự tăng (Thứ tự bảng con trước cha)
TRUNCATE TABLE CTDONDATHANG;
TRUNCATE TABLE THANHTOAN;
TRUNCATE TABLE VANCHUYEN;
TRUNCATE TABLE KHO;
TRUNCATE TABLE DIACHI;
DELETE FROM DONDATHANG; -- Bảng này không có Identity nên dùng DELETE
DELETE FROM SANPHAM;
DELETE FROM DANHMUC;
DELETE FROM KHACHHANG;
GO

-- 1. Tắt kiểm tra khóa ngoại trên toàn hệ thống
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
GO

-- 2. Xóa dữ liệu bằng DELETE (Thay cho TRUNCATE để tránh lỗi tham chiếu)
DELETE FROM CTDONDATHANG;
DELETE FROM THANHTOAN;
DELETE FROM VANCHUYEN;
DELETE FROM KHO;
DELETE FROM DIACHI;
DELETE FROM DONDATHANG;
DELETE FROM SANPHAM;
DELETE FROM DANHMUC;
DELETE FROM KHACHHANG;
GO

-- 3. Reset bộ đếm Identity về 0 (Để khi chèn mới nó sẽ bắt đầu từ 1)
-- Việc này có tác dụng tương tự TRUNCATE nhưng không bị lỗi tham chiếu
DBCC CHECKIDENT ('DIACHI', RESEED, 0);
DBCC CHECKIDENT ('THANHTOAN', RESEED, 0);
DBCC CHECKIDENT ('VANCHUYEN', RESEED, 0);
GO

PRINT 'Da xoa du lieu va reset bo dem Identity thanh cong!';

-- 1. KHACHHANG
INSERT INTO KHACHHANG(MaKH, HoTen, Email, DienThoai, NgayDangKy, TrangThai) VALUES
('KH01', N'Nguyen Van A', 'a@gmail.com', '0901111111', DEFAULT, 1),
('KH02', N'Tran Thi B', 'b@gmail.com', '0902222222', DEFAULT, 1),
('KH03', N'Le Van C', 'c@gmail.com', '0903333333', DEFAULT, 1),
('KH04', N'Pham Thi D', 'd@gmail.com', '0904444444', DEFAULT, 1),
('KH05', N'Hoang Van E', 'e@gmail.com', '0905555555', DEFAULT, 1),
('KH06', N'Vo Thi F', 'f@gmail.com', '0906666666', DEFAULT, 1),
('KH07', N'Do Van G', 'g@gmail.com', '0907777777', DEFAULT, 1),
('KH08', N'Nguyen Thi H', 'h@gmail.com', '0908888888', DEFAULT, 1);

-- 2. DIACHI (MaDiaChi se tu dong sinh ra 1, 2, 3...)
INSERT INTO DIACHI (MaKH, SoNha, Duong, QuanHuyen, TinhThanh, QuocGia, LaMacDinh) VALUES
('KH01', N'12', N'Le Loi', N'Q1', N'HCM', N'VN', 1),
('KH01', N'34', N'Nguyen Hue', N'Q1', N'HCM', N'VN', 0),
('KH02', N'56', N'Tran Hung Dao', N'Q5', N'HCM', N'VN', 1),
('KH02', N'78', N'Ly Thuong Kiet', N'Q10', N'HCM', N'VN', 0),
('KH03', N'90', N'Pham Van Dong', N'Thu Duc', N'HCM', N'VN', 1),
('KH04', N'11', N'Vo Van Tan', N'Q3', N'HCM', N'VN', 0),
('KH05', N'22', N'Le Van Sy', N'Q3', N'HCM', N'VN', 1),
('KH06', N'33', N'Hai Ba Trung', N'Q1', N'HCM', N'VN', 0),
('KH07', N'44', N'Dien Bien Phu', N'Binh Thanh', N'HCM', N'VN', 1),
('KH08', N'55', N'Nguyen Trai', N'Q5', N'HCM', N'VN', 0);

-- 3. DANHMUC
INSERT INTO DANHMUC(MaDM, TenDM, MaDMCha) VALUES
('DM01', N'Dien tu', NULL), ('DM02', N'Dien thoai', 'DM01'), ('DM03', N'Laptop', 'DM01'),
('DM04', N'Thuc pham', NULL), ('DM05', N'Do uong', 'DM04'), ('DM06', N'Quan ao', NULL);

-- 4. SANPHAM
INSERT INTO SANPHAM(MaSP, TenSP, MaDM, MoTa, Gia, TrangThai) VALUES
('SP01', N'IPhone 13', 'DM02', NULL, 15000000, 1),
('SP02', N'Samsung S22', 'DM02', NULL, 14000000, 1),
('SP03', N'Macbook Air', 'DM03', NULL, 25000000, 1),
('SP04', N'Dell XPS', 'DM03', NULL, 27000000, 1),
('SP05', N'Banh mi', 'DM04', NULL, 20000, 1),
('SP06', N'Sua tuoi', 'DM05', NULL, 30000, 1),
('SP07', N'Tra sua', 'DM05', NULL, 50000, 1),
('SP08', N'Ao thun', 'DM06', NULL, 150000, 1),
('SP09', N'Quan jean', 'DM06', NULL, 300000, 1),
('SP10', N'Laptop HP', 'DM03', NULL, 20000000, 1),
('SP11', N'Nuoc ngot', 'DM05', NULL, 10000, 1),
('SP12', N'Tai nghe', 'DM01', NULL, 500000, 1);

-- 5. KHO
INSERT INTO KHO(MaSP, SoLuong) VALUES
('SP01', 50), ('SP02', 40), ('SP03', 30), ('SP04', 20), ('SP05', 100), ('SP06', 80),
('SP07', 70), ('SP08', 60), ('SP09', 50), ('SP10', 25), ('SP11', 120), ('SP12', 90);

-- 6. DONDATHANG
INSERT INTO DONDATHANG (MaDon, MaKH, NgayDat, TongTien, TrangThai) VALUES
('DH001','KH01','2025-01-15 08:30:00', 0, N'CHO_THANH_TOAN'),
('DH002','KH02','2025-02-20 14:45:00', 0, N'DA_THANH_TOAN'),
('DH003','KH03','2025-03-10 09:00:00', 0, N'DANG_XU_LY'),
('DH004','KH04','2025-09-05 16:20:00', 0, N'CHO_THANH_TOAN'),
('DH005','KH05','2025-11-12 11:15:00', 0, N'DA_THANH_TOAN'),
('DH006','KH01','2025-12-25 19:00:00', 0, N'DANG_XU_LY');

-- 7. CTDONDATHANG
INSERT INTO CTDONDATHANG(MaDon, MaSP, SoLuong, DonGia, ChietKhau) VALUES
('DH001','SP01',1,15000000,5), ('DH001','SP05',2,20000,0),
('DH002','SP02',1,14000000,10), ('DH002','SP06',3,30000,0),
('DH003','SP03',1,25000000,15), ('DH003','SP07',2,50000,5),
('DH004','SP04',1,27000000,20), ('DH004','SP08',2,150000,0),
('DH005','SP09',2,300000,5), ('DH005','SP11',5,10000,0),
('DH006','SP10',1,20000000,10), ('DH006','SP12',2,500000,0);

-- 8. THANHTOAN (Bo MaTT vi tu tang)
INSERT INTO THANHTOAN (MaDon, PhuongThuc, SoTien, TrangThai) VALUES
('DH001', N'COD', 10000000, N'PENDING'),
('DH002', N'BANK', 14200000, N'SUCCESS'),
('DH003', N'MOMO', 5000000, N'PENDING'),
('DH004', N'COD', 10000000, N'PENDING'),
('DH005', N'BANK', 620000, N'SUCCESS'),
('DH006', N'MOMO', 10000000, N'PENDING');

-- 9. VANCHUYEN (MaDiaChi 1,2,3... se khop vi vua reset o tren)
INSERT INTO VANCHUYEN (MaDon, MaDiaChi, DonViVC, TrangThai) VALUES
('DH001', 1, N'GHN', N'CHO_LAY_HANG'),
('DH002', 3, N'GHTK', N'DANG_GIAO'),
('DH003', 5, N'VNPOST', N'CHO_LAY_HANG'),
('DH004', 6, N'GHN', N'DANG_GIAO'),
('DH005', 7, N'GHTK', N'CHO_LAY_HANG'),
('DH006', 2, N'VNPOST', N'DANG_GIAO');


UPDATE DONDATHANG
SET TongTien = (
    SELECT SUM(SoLuong * DonGia * (1 - ChietKhau/100.0))
    FROM CTDONDATHANG
    WHERE CTDONDATHANG.MaDon = DONDATHANG.MaDon
);
GO

-- Bật lại kiểm tra khóa ngoại
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
GO

PRINT 'Hoan tat quy trinh: Reset -> Insert -> Update -> Enable Constraints';

/*

--Cập nhật TongTien
UPDATE DONDATHANG
SET TongTien = (
    SELECT SUM(SoLuong * DonGia * (1 - ChietKhau/100.0))
    FROM CTDONDATHANG
    WHERE CTDONDATHANG.MaDon = DONDATHANG.MaDon
)

*/


/*

CREATE TRIGGER trg_UpdateTongTien
ON CTDONDATHANG
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE DONDATHANG
    SET TongTien = (
        SELECT SUM(SoLuong * DonGia * (1 - ChietKhau/100.0))
        FROM CTDONDATHANG
        WHERE CTDONDATHANG.MaDon = DONDATHANG.MaDon
    )
    WHERE MaDon IN (
        SELECT MaDon FROM inserted
        UNION
        SELECT MaDon FROM deleted
    )
END

*/


--1. Liệt kê MaKH, HoTen, Email, NgayDangKy của tất cả khách hàng, sắp theo NgayDangKy giảm dần
SELECT MaKH, HoTen, Email, NgayDangKy
FROM KHACHHANG
ORDER BY NgayDangKy DESC

--2. Liệt kê MaSP, TenSP, Gia của các sản phầm đang bán (TrangThai=1)
SELECT MaSP, TenSP, Gia
FROM SANPHAM
WHERE TrangThai = 1

--3. Liệt kê MaSP, TenSP, SoLuong còn lại trong KHO (join SANPHAM<->KHO)
SELECT SP.MaSP, SP.TenSP, K.SoLuong
FROM SANPHAM SP
JOIN KHO K ON SP.MaSP = K.MaSP

--4. Liệt kê MaDon, MaKH, NgayDat, TrangThai của tất cả đơn hàng trong tháng 9/2025
SELECT MaDon, MaKH, NgayDat, TrangThai
FROM DONDATHANG
WHERE NgayDat >= '2025-09-01' AND NgayDat < '2025-10-01'

--5. Tính doanh thu thô mỗi dòng đơn = SoLuong * DonGia cho bang CTDONDATHANG
SELECT MaDon, MaSP, SoLuong, DonGia, SoLuong * DonGia AS DoanhThuTho
FROM CTDONDATHANG

--6. Tính thành tiền sau chiết khấu mỗi dòng = SoLuong * DonGia * (1 - ChietKhau/100)
SELECT MaDon, MaSP, SoLuong, DonGia, ChietKhau,
SoLuong * DonGia * (1 - ChietKhau/100.0) AS ThanhTien
FROM CTDONDATHANG

--7. Liệt kê tất cả địa chỉ mặc định của khách hàng (từ DIACHI.LaMacDinh=1)
SELECT MaKH, SoNha, Duong, QuanHuyen, TinhThanh
FROM DIACHI
WHERE LaMacDinh = 1

--8. Liệt kê sản phẩm theo danh mục: MaDM, TenDM, MaSP, TenSP
SELECT DM.MaDM, DM.TenDM, SP.MaSP, SP.TenSP
FROM SANPHAM SP
JOIN DANHMUC DM ON SP.MaDM = DM.MaDM

--9. Đếm số sản phầm trong mỗi danh mục
SELECT DM.MaDM, DM.TenDM, COUNT(SP.MaSP) AS SoLuongSP
FROM DANHMUC DM
JOIN SANPHAM SP ON DM.MaDM = SP.MaDM
GROUP BY DM.MaDM, DM.TenDM

--10. Đếm số đơn hàng của từng khách hàng trong năm 2025
SELECT KH.MaKH, KH.HoTen, COUNT(DH.MaDon) AS SoDon
FROM KHACHHANG KH
JOIN DONDATHANG DH 
ON KH.MaKH = DH.MaKH
AND YEAR(DH.NgayDat) = 2025
GROUP BY KH.MaKH, KH.HoTen

--11. Liệt kê MaDon, TongTien các đơn có TrangThai='DA_THANH_TOAN'
SELECT MaDon, TongTien 
FROM DONDATHANG
WHERE TrangThai='DA_THANH_TOAN'

--12. Liệt kê MaDon, TrangThai vận chuyển hiện tại, DonViVC (lấy bản ghi mới nhất theo VANCHUYEN.NgayCapNhat)
SELECT MaDon, TrangThai, DonViVC
FROM VANCHUYEN 
WHERE NgayCapNhat = GETDATE()


--13. Liệt kê Top 10 sản phẩm có Giá cao nhất
SELECT TOP 10 WITH TIES *
FROM SANPHAM
ORDER BY GIA DESC

--14. Liệt kê đơn chưa có thanh toán nào (anti-join THANHTOAN)
SELECT DH.*
FROM DONDATHANG DH
LEFT JOIN THANHTOAN TT ON DH.MaDon = TT.MaDon
WHERE TT.MaDon IS NULL

--15. Liệt kê đơn đã thanh toán đủ (tổng THANHTOAN.SoTien = DONDATHANG.TongTien)
SELECT *
FROM THANHTOAN 
JOIN DONDATHANG
ON THANHTOAN.MaDon = DONDATHANG.MaDon
WHERE THANHTOAN.SoTien = DONDATHANG.TongTien

--16. Top 5 khách hàng có tổng chi tiêu cao nhất trong quý 1/2025 (sum theo đơn hàng đã thanh toán)
SELECT TOP 5 WITH TIES *
FROM KHACHHANG
JOIN DONDATHANG ON DONDATHANG.MAKH = KHACHHANG.MaKH
JOIN THANHTOAN ON THANHTOAN.MaDon = DONDATHANG.MaDon
ORDER BY THANHTOAN.SoTien DESC

--17. Tính doanh thu theo danh mục trong năm 2025
SELECT DANHMUC.MaDM, SUM(TongTien) AS DoanhThu
FROM DANHMUC 
JOIN SANPHAM ON SANPHAM.MaDM = DANHMUC.MaDM
JOIN CTDONDATHANG ON CTDONDATHANG.MaSP = SANPHAM.MaSP
JOIN DONDATHANG ON DONDATHANG.MaDon = CTDONDATHANG.MaDon
JOIN THANHTOAN ON THANHTOAN.MaDon = DONDATHANG.MaDon
GROUP BY DANHMUC.MaDM

--18. Liệt kê đơn hàng có từ 3 dòng chi tiết trở lên (COUNT theo CTDONDATHANG)
SELECT MaDon, COUNT(*) AS SoDong
FROM CTDONDATHANG
GROUP BY MaDon
HAVING COUNT(*) >= 3

--19. Liệt kê sản phẩm chưa từng bán (không xuất hiện trong CTDONDATHANG)
SELECT SANPHAM.MaSP, SANPHAM.TenSP
FROM SANPHAM
JOIN CTDONDATHANG
ON CTDONDATHANG.MaSP = SANPHAM.MaSP
EXCEPT (
	SELECT CTDONDATHANG.MaSP
	FROM CTDONDATHANG
)

--20. Liệt kê đơn hàng thiếu thanh toán: tổng đã trả < TongTien, kèm theo số tiền còn thiếu
SELECT *, TongTien - SoTien AS ConThieu
FROM THANHTOAN
JOIN DONDATHANG
ON THANHTOAN.MaDon = DONDATHANG.MaDon
WHERE SoTien < TongTien

--21. Liệt kê đơn đang giao (vận chuyển TrangThai='DANG_GIAO') kèm địa chỉ nhận (join DIACHI)
SELECT *
FROM VANCHUYEN
JOIN DIACHI
ON VANCHUYEN.MaDiaChi = DIACHI.MaDiaChi

--22. Phân trang: lấy 20 sản phẩm trang 2 theo TenSP tăng dần (OFFSET/FETCH)
SELECT * FROM SANPHAM
ORDER BY TenSP ASC
OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY

--23. Top-N theo nhóm: với mỗi danh mục, lấy 2 sản phẩm giá cao nhất (window ROW_NUMBER)
SELECT * 
FROM (
    SELECT MaDM, MaSP, TenSP, Gia,
           ROW_NUMBER() OVER(PARTITION BY MaDM ORDER BY Gia DESC) AS RankSP
    FROM SANPHAM
) AS Result
WHERE RankSP <= 2

--24. Liệt kê tổng số lượng đã bán của từng sản phẩm trong 30 ngày gần nhất
SELECT SP.MaSP, SP.TenSP, SUM(CT.SoLuong) AS TongBan
FROM CTDONDATHANG CT
JOIN DONDATHANG DH ON CT.MaDon = DH.MaDon
JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
WHERE DH.NgayDat >= DATEADD(DAY, -30, GETDATE())
GROUP BY SP.MaSP, SP.TenSP

--25. Tỉnh tỉ lệ chiết khấu trung bình (trọng số theo SoLuong) của mỗi sản phẩm trong năm 2025
SELECT MaSP, 
       SUM(ChietKhau * SoLuong) / SUM(SoLuong) AS ChietKhauTB_TrongSo
FROM CTDONDATHANG CT
JOIN DONDATHANG DH ON CT.MaDon = DH.MaDon
WHERE YEAR(DH.NgayDat) = 2025
GROUP BY MaSP

--26. Với mỗi khách hàng, gộp danh sách mã đơn bằng STRING_AGG(MaDon, ',')
SELECT MaKH, STRING_AGG(MaDon, ', ') AS DanhSachDonHang
FROM DONDATHANG
GROUP BY MaKH

--27. Liệt kê đơn hoàn tất (TrangThai='HOAN_TAT) nhưng chưa có vận đơn (không có bản ghi trong VANCHUYEN)
SELECT DH.*
FROM DONDATHANG DH
LEFT JOIN VANCHUYEN VC ON DH.MaDon = VC.MaDon
WHERE DH.TrangThai = N'HOAN_TAT' AND VC.MaVC IS NULL

--28. Tính số ngày giao hàng = (thời điểm DA_GIAO mới nhất - NgayDat) cho các đơn đã giao trong 90 ngày gần đây
SELECT VC.MaDon, DATEDIFF(DAY, DH.NgayDat, VC.NgayCapNhat) AS SoNgayGiao
FROM VANCHUYEN VC
JOIN DONDATHANG DH ON VC.MaDon = DH.MaDon
WHERE VC.TrangThai = N'DA_GIAO' 
  AND VC.NgayCapNhat >= DATEADD(DAY, -90, GETDATE())

--29. Thống kê doanh thu theo tháng trong năm 2025 (cột: Thang, Doanh Thu)
SELECT MONTH(NgayDat) AS Thang, SUM(TongTien) AS DoanhThu
FROM DONDATHANG
WHERE YEAR(NgayDat) = 2025
GROUP BY MONTH(NgayDat)
ORDER BY Thang

--30. Liệt kê Top 3 danh mục có doanh thu cao nhất trong quý 2/2025 
SELECT TOP 3 DM.TenDM, SUM(DH.TongTien) AS DoanhThu
FROM DANHMUC DM
JOIN SANPHAM SP ON DM.MaDM = SP.MaDM
JOIN CTDONDATHANG CT ON SP.MaSP = CT.MaSP
JOIN DONDATHANG DH ON CT.MaDon = DH.MaDon
WHERE DH.NgayDat BETWEEN '2025-04-01' AND '2025-06-30'
GROUP BY DM.TenDM
ORDER BY DoanhThu DESC

--31. Tìm tập khách hàng đóng góp 80% doanh thu năm 2025, kèm % tích lũy. (Gợi ý: SUM(TongTien) GROUP BY MaKH, dùng SUM() OVER (ORDER BY DoanhThu DESC) để tính % tích lũy)
WITH KhachHangDoanhThu AS (
    SELECT MaKH, SUM(TongTien) AS DoanhThu
    FROM DONDATHANG WHERE YEAR(NgayDat) = 2025
    GROUP BY MaKH
),
TichLuy AS (
    SELECT MaKH, DoanhThu,
           SUM(DoanhThu) OVER(ORDER BY DoanhThu DESC) AS DoanhThuTichLuy,
           SUM(DoanhThu) OVER() AS TongDoanhThu
    FROM KhachHangDoanhThu
)
SELECT *, (DoanhThuTichLuy/TongDoanhThu)*100 AS PhanTramTichLuy
FROM TichLuy
WHERE (DoanhThuTichLuy - DoanhThu) / TongDoanhThu < 0.8

--32. Liệt kê cặp (SP_A, SP. B) cùng xuất hiện trong 210 đơn trong 6 tháng gần đây. (Gợi Self-join CTDONDATHANG theo MaDon, HAVING COUNT(*) >= 10) 
SELECT A.MaSP AS SP_A, B.MaSP AS SP_B, COUNT(*) AS SoLanMuaCung
FROM CTDONDATHANG A
JOIN CTDONDATHANG B ON A.MaDon = B.MaDon AND A.MaSP < B.MaSP
GROUP BY A.MaSP, B.MaSP
HAVING COUNT(*) >= 10

--33. Liệt kê sản phẩm tồn kho >0 nhưng không bán trong 90 ngày gần nhất. (Gợi ý: NOT EXISTS với CTDONDATHANG lọc NgayDat >= DATEADD(DAY,-90,GETDATE())) 
SELECT SP.MaSP, SP.TenSP
FROM SANPHAM SP
JOIN KHO K ON SP.MaSP = K.MaSP
WHERE K.SoLuong > 0
AND NOT EXISTS (
    SELECT 1 FROM CTDONDATHANG CT
    JOIN DONDATHANG DH ON CT.MaDon = DH.MaDon
    WHERE CT.MaSP = SP.MaSP AND DH.NgayDat >= DATEADD(DAY, -90, GETDATE())
)

--34. Với mỗi sản phầm, sánh giá niêm yết (Gia) và giá bán thực tế TB (sau chiết khẩu). (Gợi ý: AVG(DonGia*(1-ChietKhau/100)), tính % chênh lệch)
SELECT SP.MaSP, 
       MAX(Gia) AS GiaNiemYet,
       AVG(DonGia * (1 - ChietKhau/100.0)) AS GiaBanThucTeTB,
       (MAX(Gia) - AVG(DonGia * (1 - ChietKhau/100.0))) / MAX(Gia) * 100 AS PhanTramGiam
FROM SANPHAM SP
JOIN CTDONDATHANG CT ON SP.MaSP = CT.MaSP
GROUP BY SP.MaSP

--35. Tính tổng doanh thu theo địa chỉ nhận hàng trong năm 2025. (Gợi ý: join VANCHUYEN -> DIACHI, nhóm SUM(TongTien) theo ThanhPho)
SELECT DC.TinhThanh, SUM(DH.TongTien) AS DoanhThu
FROM DIACHI DC
JOIN VANCHUYEN VC ON DC.MaDiaChi = VC.MaDiaChi
JOIN DONDATHANG DH ON VC.MaDon = DH.MaDon
WHERE YEAR(DH.NgayDat) = 2025
GROUP BY DC.TinhThanh

--36. Báo cáo doanh thu mỗi danh mục x từng tháng năm 2025, (Goi ý: PIVOT SUM(TongTien) FOR MONTH(NgayDat)
SELECT TenDM,
    SUM(CASE WHEN MONTH(NgayDat) = 1 THEN DH.TongTien ELSE 0 END) AS T1,
    SUM(CASE WHEN MONTH(NgayDat) = 2 THEN DH.TongTien ELSE 0 END) AS T2,
    SUM(CASE WHEN MONTH(NgayDat) = 3 THEN DH.TongTien ELSE 0 END) AS T3,
	SUM(CASE WHEN MONTH(NgayDat) = 4 THEN DH.TongTien ELSE 0 END) AS T4,
	SUM(CASE WHEN MONTH(NgayDat) = 5 THEN DH.TongTien ELSE 0 END) AS T5,
	SUM(CASE WHEN MONTH(NgayDat) = 6 THEN DH.TongTien ELSE 0 END) AS T6,
	SUM(CASE WHEN MONTH(NgayDat) = 7 THEN DH.TongTien ELSE 0 END) AS T7,
	SUM(CASE WHEN MONTH(NgayDat) = 8 THEN DH.TongTien ELSE 0 END) AS T8,
	SUM(CASE WHEN MONTH(NgayDat) = 9 THEN DH.TongTien ELSE 0 END) AS T9,
	SUM(CASE WHEN MONTH(NgayDat) = 10 THEN DH.TongTien ELSE 0 END) AS T10,
	SUM(CASE WHEN MONTH(NgayDat) = 11 THEN DH.TongTien ELSE 0 END) AS T11,
    SUM(CASE WHEN MONTH(NgayDat) = 12 THEN DH.TongTien ELSE 0 END) AS T12
FROM DANHMUC DM
JOIN SANPHAM SP ON DM.MaDM = SP.MaDM
JOIN CTDONDATHANG CT ON SP.MaSP = CT.MaSP
JOIN DONDATHANG DH ON CT.MaDon = DH.MaDon
WHERE YEAR(DH.NgayDat) = 2025
GROUP BY TenDM

--37. Tìm top 3 sản phẩm có biên lợi nhuận (gỉa định công thức cho sẵn) cao nhất trong 2025. (Gợi ý: Tính AVG(GiaBanSauCK) - 0.6*DonGia, sắp xếp giảm dần)
SELECT TOP 3 SP.MaSP, 
       (AVG(DonGia * (1 - ChietKhau/100.0)) - (MAX(Gia) * 0.6)) AS BienLoiNhuan
FROM CTDONDATHANG CT
JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
GROUP BY SP.MaSP
ORDER BY BienLoiNhuan DESC

--38. Tính doanh thu và tỷ lệ % theo từng phương thức thanh toán trong quý gần nhắt. ( Gợi ý: GROUP BY PhuongThuc, SUM(SoTien), % = SoTien/ SUM() OVER())
SELECT PhuongThuc, SUM(SoTien) AS DoanhThu,
       SUM(SoTien) * 100.0 / SUM(SUM(SoTien)) OVER() AS TyLePhanTram
FROM THANHTOAN
WHERE ThoiDiem BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY PhuongThuc

--39. Với mỗi hãng (DonViVC), tính thời gian giao trung bình trong 60 ngày gần đây. (Gợi ý: DATEDIFF(DAY, NgayDat, MAX(NgayCapNhat), nhóm theo DonViVC)
SELECT DonViVC, AVG(DATEDIFF(HOUR, DH.NgayDat, VC.NgayCapNhat)) / 24.0 AS SoNgayTB
FROM VANCHUYEN VC
JOIN DONDATHANG DH ON VC.MaDon = DH.MaDon
WHERE VC.TrangThai = N'DA_GIAO' AND VC.NgayCapNhat >= DATEADD(DAY, -60, GETDATE())
GROUP BY DonViVC

--40. Tìm khách hàng đăng ký gần đây (quý gần nhất) có chi tiêu cao nhất. (Gợi ý: lọc NgayDangKy, SUM(TongTien) theo MaKH, sắp xếp giảm dần)
SELECT TOP 1 KH.MaKH, KH.HoTen, SUM(DH.TongTien) AS TongChi
FROM KHACHHANG KH
JOIN DONDATHANG DH ON KH.MaKH = DH.MaKH
WHERE KH.NgayDangKy BETWEEN '2025-10-01' AND '2025-12-31'
GROUP BY KH.MaKH, KH.HoTen
ORDER BY TongChi DESC

--41. Tính số đơn đã thanh toán đủ/ số đơn đặt hàng theo tháng năm 2025. (Gợi ý: COUNT(CASE WHEN Paid=1 THEN 1 END) * 1.0/ COUNT(*))
SELECT MONTH(NgayDat) AS Thang,
       COUNT(CASE WHEN TrangThai = N'DA_THANH_TOAN' THEN 1 END) * 1.0 / COUNT(*) AS TyLeThanhToan
FROM DONDATHANG
WHERE YEAR(NgayDat) = 2025
GROUP BY MONTH(NgayDat)

--42. Tính doanh thu hàng tháng và doanh thu lũy kế theo tháng năm 2025. (Gợi ý: SUM(TongTien) GROUP BY MONTH, thêm SUM(TongTien) OVER (ORDER BY Thang) 
SELECT MONTH(NgayDat) AS Thang,
       SUM(TongTien) AS DoanhThuThang,
       SUM(SUM(TongTien)) OVER(ORDER BY MONTH(NgayDat)) AS DoanhThuLuyKe
FROM DONDATHANG
WHERE YEAR(NgayDat) = 2025
GROUP BY MONTH(NgayDat)

--43. Tìm khách hàng chỉ có đúng 1 đơn trong vòng 1 năm gần đây. (Gợi ý: COUNT(Don) = 1 với WHERE NgayDat >= DATEADD(YEAR,-1,GETDATE()))
SELECT MaKH, COUNT(MaDon) AS SoDon
FROM DONDATHANG
WHERE NgayDat >= DATEADD(YEAR, -1, GETDATE())
GROUP BY MaKH
HAVING COUNT(MaDon) = 1

--44. Liệt kê khách hàng không có địa chỉ mặc định hoặc có >1 địa chỉ (Goi ý: GROUP BY MaKH HAVING SUM(CASE WHEN LaMacDinh=1 THEN 1 ELSE 0 END) <> 1)
SELECT MaKH, SUM(CAST(LaMacDinh AS INT)) AS SoDiaChiMacDinh
FROM DIACHI
GROUP BY MaKH
HAVING SUM(CAST(LaMacDinh AS INT)) <> 1