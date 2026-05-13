USE master

IF DB_ID('QLDA') IS NOT NULL
	DROP DATABASE QLDA

CREATE DATABASE QLDA

USE QLDA

CREATE TABLE NHANVIEN (
	MANV varchar(5),
	HONV nvarchar(20),
	TENLOT nvarchar(20),
	TENNV nvarchar(10),
	NGAYSINH date,
	DIACHI nvarchar(100),
	PHAI varchar(5),
	LUONG decimal(10,2),
	MAPB varchar(5), 
	constraint pk_nv_mnv primary key(MANV)
)

CREATE TABLE THANNHAN (
	MANV varchar(5),
	TENTN nvarchar(30),
	PHAI varchar(5),
	NGAYSINH date,
	QUANHE nvarchar(20),
	constraint pk_tn_mnv_ttn primary key(MANV, TENTN)
)

CREATE TABLE DEAN (
	MADA varchar(5),
	TENDA nvarchar(50),
	DDIEM_DA nvarchar(100),
	MAPB varchar(5) not null,
	constraint pk_da_mda primary key(MADA)
)

CREATE TABLE DDIEMPB (
	MAPB varchar(5),
	DIADIEM nvarchar(100),
	constraint pk_ddpb_mpb_dd primary key(MAPB, DIADIEM)
)

CREATE TABLE PHANCONG (
	MANV varchar(5),
	MADA varchar(5),
	THOIGIAN decimal(5,1),
	constraint pk_pc_mnv_mda primary key(MANV, MADA)
)

CREATE TABLE PHONGBAN (
	MAPB varchar(5),
	TENPB nvarchar(50),
	TRUONGPHONG varchar(5),
	NG_NHANCHUC date,
	constraint pk_pb_mpb primary key(MAPB)
)

ALTER TABLE THANNHAN add constraint fk_tn_mnv foreign key(MANV) references NHANVIEN(MANV)
ALTER TABLE PHANCONG add constraint fk_pc_mnv foreign key(MANV) references NHANVIEN(MANV)
ALTER TABLE PHANCONG add constraint fk_pc_mda foreign key(MADA) references DEAN(MADA)
ALTER TABLE DEAN add constraint fk_da_mpb foreign key(MAPB) references PHONGBAN(MAPB)
ALTER TABLE DDIEMPB add constraint fk_ddpb_mpb foreign key(MAPB) references PHONGBAN(MAPB)
ALTER TABLE PHONGBAN add constraint fk_pb_tp foreign key(TRUONGPHONG) references NHANVIEN(MANV)

INSERT INTO NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
VALUES 
('NV1', N'DINH', N'BA', N'TIEN', '1985-01-09', N'731 Tran Hung Dao, q1, TPHCM', 'NAM', 30000, 'P3'),
('NV2', N'VO', N'THANH', N'TUNG', '1975-12-08', N'638 Tran Hung Dao', 'NAM', 40000, 'P3'),
('NV3', N'TRAN', N'THANH', N'TAM', '1982-07-31', N'853 Mai Thi Luu, Q1, TPHCM', 'NAM', 25000, 'P2'),
('NV4', N'VO', N'MANH', N'HUNG', '1972-09-15', N'975 Ba Ria, Vung Tau', 'NAM', 38000, 'P2'),
('NV5', N'LE', N'NGOC', N'QUYEN', '1987-10-10', N'450 Trung Vuong, Ha Noi', 'NU', 550000, 'P1'),
('NV6', N'TRAN', N'MINH', N'KHANG', '1982-06-24', N'Tran Binh Trong, TPHCM', 'NAM', 58000, 'P1'),
('NV7', N'LE', N'THI', N'NHAN', '1981-06-20', N'291 Ho Van Hue, QPN, TPHCM', 'NU', 43000, 'P3'),
('NV8', N'TRAN', N'HONG', N'QUANG', '1970-03-29', '980 Le Hong Phong, Q10, TPHCM', 'NAM', 25000, 'P2'),
('NV9', N'BUI', N'THUY', N'VU', '1978-07-19', N'322 Nguyen Thai Hoc, Q1, TPHCM', 'NU', 25000, 'P1')

INSERT INTO PHONGBAN(MAPB, TENPB, TRUONGPHONG, NG_NHANCHUC)
VALUES
('P1', N'QUANLY', 'NV5', '2016-06-19'),
('P2', N'DIEUHANH', 'NV8', '2018-01-01'),
('P3', N'NGHIENCUU', 'NV2', '2017-05-22')

INSERT INTO DEAN(MADA, TENDA, DDIEM_DA, MAPB)
VALUES
('DA1', N'San pham X', N'VUNG TAU', 'P3'),
('DA2', N'San pham Y', N'NHA TRANG', 'P3'),
('DA3', N'San pham Z', N'TPHCM', 'P3'),
('DA4', N'Tin hoc hoa', N'HA NOI', 'P2'),
('DA5', N'Cap quang', N'TPHCM', 'P1'),
('DA6', N'Dao tao', N'HA NOI', 'P2')

INSERT INTO DDIEMPB(MAPB, DIADIEM)
VALUES
('P1', N'TPHCM'),
('P2', N'HA NOI'),
('P3', N'NHA TRANG'),
('P3', N'TPHCM'),
('P3', N'VUNG TAU')

INSERT INTO PHANCONG(MANV, MADA, THOIGIAN)
VALUES
('NV1', 'DA1', 32.5),
('NV1', 'DA2', 7.5),
('NV1', 'DA3', 10),
('NV2', 'DA3', 40),
('NV2', 'DA4', 20),
('NV2', 'DA5', 20),
('NV3', 'DA1', 20),
('NV3', 'DA2', 20),
('NV4', 'DA3', 10),
('NV5', 'DA4', 10),
('NV5', 'DA5', 10),
('NV7', 'DA6', 30),
('NV8', 'DA4', 10),
('NV8', 'DA6', 20),
('NV9', 'DA4', 15)

INSERT INTO THANNHAN(MANV, TENTN, PHAI, NGAYSINH, QUANHE)
VALUES
('NV1', N'DINH BA KIEN', 'NAM', '1995-07-15', N'CON TRAI'),
('NV1', N'NGUYEN THANH THAO', 'NU', '1988-04-08', N'VỢ'),
('NV2', N'VO THANH SON', 'NAM', '1950-09-23', N'CHA'),
('NV3', N'LE THI HUONG', 'NU', '1984-01-08', N'VỢ'),
('NV3', N'TRAN LE NGOC HOA', 'NU', '2017-09-12', N'CON GÁI'),
('NV6', N'TRAN MINH AN', 'NAM', '1980-08-05', N'ANH TRAI'),
('NV7', N'LE THI NGAN', 'NU', '1980-06-07', N'EM GÁI'),
('NV9', N'TRAN QUOC VUONG', 'NAM', '1975-05-05', N'CHỒNG')

-- Bo sung them khoa ngoai (co the tao trong diagram)
ALTER TABLE NHANVIEN add constraint fk_nv_mpb foreign key(MaPB) references PHONGBAN(MaPB)

-- Bai tap chuong 4

-- 1. Cho biết tên, tuổi của từng nhân viên.
SELECT HONV, TENLOT, TENNV, YEAR(GETDATE()) - YEAR(NGAYSINH) AS TUOI FROM NHANVIEN

-- 2. Cho biết thông tin về những người có phái là nam và địa chỉ trên đường "Tran Hung Dao".
SELECT * FROM NHANVIEN WHERE PHAI = 'NAM' AND DIACHI LIKE N'%Tran Hung Dao%'

-- 3. Cho biết những người có họ là "Le" và tên bắt đầu bằng ký tự "N".
SELECT * FROM NHANVIEN WHERE HONV = N'LE' AND TENNV LIKE N'N%'

-- 4. Cho biết những người có ngày sinh trong tháng 7 năm 1978.
SELECT * FROM NHANVIEN WHERE YEAR(NGAYSINH) = 1978 AND MONTH(NGAYSINH) = 7

-- 5. Cho biết những người có ngày sinh trong quý 3.
SELECT * FROM NHANVIEN WHERE MONTH(NGAYSINH) BETWEEN 7 AND 9

-- 6. Cho biết số đề án được phân công của từng nhân viên (gồm mã số, tên, số lượng đề án được phân công).
SELECT NHANVIEN.MANV, COUNT(MADA) SLDA FROM PHANCONG JOIN NHANVIEN ON NHANVIEN.MANV = PHANCONG.MANV GROUP BY NHANVIEN.MANV

-- 7. Cho biết tên nhân viên có từ 2 thân nhân trở lên.
SELECT NHANVIEN.MANV, TENNV, COUNT(NHANVIEN.MANV) AS SLTN
FROM NHANVIEN
JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MANV
GROUP BY NHANVIEN.MANV, TENNV
HAVING COUNT(NHANVIEN.MANV) >= 2

-- 8. Tên nhân viên >= 30 tuổi được phân công làm việc cho đề án ở TPHCM.
SELECT NHANVIEN.MANV, TENNV
FROM NHANVIEN
JOIN PHANCONG ON NHANVIEN.MANV = PHANCONG.MANV
JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
WHERE YEAR(GETDATE()) - YEAR(NGAYSINH) >= 30 AND DDIEM_DA = 'TPHCM'

-- 9. Cho biết có bao nhiêu đề án ở TPHCM.
SELECT COUNT(MADA) AS SLDA FROM DEAN WHERE DDIEM_DA = 'TPHCM'

-- 10. Đối với mỗi thành phố, cho biết tên và số lượng đề án được thực hiện ờ đó.
SELECT DDIEM_DA, COUNT(MADA) AS SLDA FROM DEAN GROUP BY DDIEM_DA

-- 11. Cho biết số năm thâm niên (số năm làm việc) của từng trưởng phòng.
SELECT PB.TENPB, NV.TENNV, YEAR(GETDATE()) - YEAR(PB.NG_NHANCHUC) AS THAMNIEN FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV

-- 12. Cho biết số lượng địa điểm của từng phòng ban.
SELECT MAPB, COUNT(DIADIEM) AS SLDD FROM DDIEMPB GROUP BY MAPB

-- 13. Cho biết có bao nhiêu tên đề án là "sản phẩm".
SELECT COUNT(*) SLSP FROM DEAN WHERE TENDA LIKE N'San pham%'

-- 14. Cho biết tên phòng, địa điểm phòng, tên đề án, địa điểm đề án của những đề án có địa điểm của đề án trùng với địa điểm của phòng.
SELECT TENPB, DIADIEM, TENDA, DDIEM_DA FROM PHONGBAN JOIN DEAN ON PHONGBAN.MAPB = DEAN.MAPB JOIN DDIEMPB ON PHONGBAN.MAPB = DDIEMPB.MAPB WHERE DIADIEM = DDIEM_DA

-- 15. Tên các nhân viên quản lý có mức lương thấp hơn lương trung bình nhân viên họ quản lí trực tiếp.
SELECT NV.MANV, NV.TENNV, NV.LUONG
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE NV.LUONG < (
    SELECT AVG(LUONG)
    FROM NHANVIEN
    WHERE MAPB = PB.MAPB
)

-- 16. Xóa các nhân viên có số thân nhân >= 3.
BEGIN TRAN

DELETE FROM NHANVIEN 
WHERE MANV IN (
	SELECT MANV
	FROM THANNHAN TN
	GROUP BY MANV
	HAVING COUNT(MANV) >= 3
)

SELECT * FROM NHANVIEN

ROLLBACK

-- 17. Mã nhân viên "NV5" có mức lương cao nhất hay không? (Trà lời "có" hay "không"). 
SELECT CASE WHEN LUONG >= (SELECT MAX(LUONG) FROM NHANVIEN) THEN 'Có' ELSE 'Không' END AS RESULT FROM NHANVIEN NV WHERE MANV = 'NV5'

-- 18. Tên nhân viên đã có gia đình (thân nhân) nhưng chưa có con.
SELECT NV.MANV, NV.TENNV
FROM NHANVIEN NV
WHERE EXISTS (
	SELECT 1 
	FROM THANNHAN TN
	WHERE TN.MANV = NV.MANV
)
AND NOT EXISTS (
	SELECT 1 
	FROM THANNHAN TN 
	WHERE TN.MANV = NV.MANV 
		AND TN.QUANHE LIKE N'CON%'
)

-- 19. Đối với từng đề án, cho biết tên nhân viên, tên đề án, số giờ làm việc nhiều nhất.
WITH MaxHours AS (
	SELECT DA.MADA, NV.TENNV, DA.TENDA, PC.THOIGIAN, RANK() OVER(PARTITION BY DA.MADA ORDER BY PC.THOIGIAN DESC) AS XEPHANG
	FROM NHANVIEN NV
	JOIN PHANCONG PC ON NV.MANV = PC.MANV
	JOIN DEAN DA ON PC.MADA = DA.MADA	
)
SELECT TENNV, TENDA, THOIGIAN FROM MaxHours WHERE XEPHANG = 1

-- 20. Tên những nhân viên được phân công làm việc cho tất cá các đề án ở Hà Nội.
SELECT NV.MANV, NV.TENNV 
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MANV
JOIN DEAN DA ON PC.MADA = DA.MADA
WHERE DA.DDIEM_DA = N'HA NOI' 
GROUP BY NV.MANV, NV.TENNV
HAVING COUNT(DISTINCT DA.MADA) = (SELECT COUNT(*) FROM DEAN WHERE DDIEM_DA = N'HA NOI')

-- 21. Tên phòng ban có trưởng phòng là nhân viên nữ.
SELECT TENPB FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV WHERE NV.PHAI = 'NU'

-- 22. Đối với từng đề án, cho biết số lượng nhân viên tham gia đề án, tổng số giờ làm việc của đề án.
SELECT DA.MADA, DA.TENDA, COUNT(MANV) SLNV, SUM(THOIGIAN) AS TGLV FROM DEAN DA JOIN PHANCONG PC ON DA.MADA = PC.MADA GROUP BY DA.MADA, DA.TENDA

-- 23. Đối với từng phòng ban, cho biết tên phòng ban, tồng số nam, tổng số nữ.
SELECT TENPB, SUM(CASE WHEN PHAI = 'NAM' THEN 1 ELSE 0 END) AS SLNAM, SUM(CASE WHEN PHAI = 'NU' THEN 1 ELSE 0 END) AS SLNU FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV GROUP BY TENPB

-- 24. Tên phòng ban có nhân viên nữ nhiều nhất.
SELECT TOP 1 WITH TIES TENPB, COUNT(MANV) SLNU
FROM PHONGBAN PB
JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV
WHERE PHAI = 'NU'
GROUP BY TENPB
ORDER BY SLNU DESC

-- 25. Nhân viên có mã số là "NV4" lớn tuổi nhất hay không? (Trả lời "Có"/"Không").
SELECT CASE WHEN NGAYSINH = (SELECT MIN(NGAYSINH) FROM NHANVIEN) THEN 'Có' ELSE 'Không' END AS RESULT FROM NHANVIEN NV WHERE MANV = 'NV4'

-- 26. Đối với từng phòng ban, cho biết tên phòng ban, lương trung bình của nữ nhân viên, lương trung bình của nam nhân viên.
SELECT TENPB, AVG(CASE WHEN PHAI = 'NU' THEN LUONG END) AS LUONGTBNU, AVG(CASE WHEN PHAI = 'NAM' THEN LUONG END) AS LUONGTBNAM FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV GROUP BY TENPB

-- 27. Tăng 10% lương đối với các nhân viên là nữ và được phân công làm việc cho đề án ở Vũng Tàu hay Nha Trang.
UPDATE NHANVIEN
SET LUONG = LUONG * 1.1
WHERE MANV IN (
	SELECT DISTINCT MANV
	FROM DEAN DA
	JOIN PHANCONG PC ON DA.MADA = PC.MADA
	JOIN NHANVIEN NV ON PC.MANV = NV.MANV
	WHERE PHAI = 'NU' AND (DDIEM_DA = 'VUNG TAU' OR DDIEM_DA = 'NHA TRANG')
)

-- 28. Tên và địa chỉ các nhân viên làm việc cho một đề án ở thành phố nhưng địa điểm phòng ban mà họ trực thuộc đều không ở trong thành phố đó.
SELECT DISTINCT TENNV, DIACHI
FROM DEAN DA
JOIN PHANCONG PC ON DA.MADA = PC.MADA
JOIN NHANVIEN NV ON PC.MANV = NV.MANV
WHERE DDIEM_DA NOT IN (SELECT DIACHI FROM DDIEMPB WHERE MAPB = NV.MAPB)

-- 29. Tên các đề án thuộc các phòng ban có địa điểm ở Hà Nội.
SELECT DISTINCT TENDA
FROM DEAN DA
JOIN PHONGBAN PB ON DA.MAPB = PB.MAPB
JOIN DDIEMPB DDPB ON PB.MAPB = DDPB.MAPB
WHERE DIADIEM = 'HA NOI'

-- 30. Tên những nhân viên là trưởng phòng và cư ngụ tại TPHCM.
SELECT NV.MANV, NV.TENNV
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE DIACHI LIKE N'%TPHCM%'

-- 31. Tên nhân viên là trưởng phòng có ngày nhận chức sau cùng (mới nhất).
SELECT TOP 1 TENNV, TENPB, NG_NHANCHUC
FROM PHONGBAN PB
JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV
ORDER BY NG_NHANCHUC DESC

-- 32. Phòng ban nào chỉ phụ trách các đề án ở Hà Nội.
SELECT PB.TENPB
FROM PHONGBAN PB
WHERE NOT EXISTS (
    SELECT 1 
	FROM DEAN DA 
    WHERE DA.MAPB = PB.MAPB AND DA.DDIEM_DA <> N'HA NOI'
) 
AND EXISTS (
	SELECT 1 
	FROM DEAN DA 
	WHERE DA.MAPB = PB.MAPB
)

-- 33. Thêm vào quan hệ PHANCONG các bộ là các đề án mà nhân viên NV3 chưa được phân công.
INSERT INTO PHANCONG(MANV, MADA, THOIGIAN)
SELECT 'NV3', MADA, 0
FROM DEAN
WHERE MADA NOT IN (
	SELECT MADA 
	FROM PHANCONG 
	WHERE MANV = 'NV3'
)

-- 34. Liệt kê tên phòng ban, tên trưởng phòng của các phòng ban có nhiều nhân viên nữ nhất.
WITH MaxNu AS (
    SELECT TOP 1 MAPB 
    FROM NHANVIEN WHERE PHAI = 'NU' 
    GROUP BY MAPB ORDER BY COUNT(*) DESC
)
SELECT PB.TENPB, NV.TENNV AS Ten_Truong_Phong
FROM PHONGBAN PB
JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV
WHERE PB.MAPB IN (
	SELECT MAPB 
	FROM MaxNu
)

-- 35. Tên nhân viên được phân công làm việc cho tất cả các đề án của phòng P2.
SELECT NV.MANV, NV.TENNV
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MANV
WHERE PC.MADA IN (
	SELECT MADA 
	FROM DEAN 
	WHERE MAPB = 'P2'
)
GROUP BY NV.MANV, NV.TENNV
HAVING COUNT(DISTINCT PC.MADA) = (SELECT COUNT(*) FROM DEAN WHERE MAPB = 'P2')

-- 36. Cho biết tên đề án, tên nhân viên, số giờ của từng đề án được phân công và số giờ làm việc nhiều nhất.
SELECT DA.TENDA, NV.TENNV, PC.THOIGIAN,
       MAX(PC.THOIGIAN) OVER(PARTITION BY DA.MADA) AS Max_Gio_DA
FROM DEAN DA
JOIN PHANCONG PC ON DA.MADA = PC.MADA
JOIN NHANVIEN NV ON PC.MANV = NV.MANV

-- 37. Đối với từng nhân viên: cho biết tên nhân viên, mã phòng ban và tên của trưởng phòng.
SELECT NV.MANV, NV.TENNV, NV.MAPB, TP.TENNV AS Ten_Truong_Phong
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
JOIN NHANVIEN TP ON PB.TRUONGPHONG = TP.MANV

-- 38. Liệt kê những nhân viên là người quản lý có lương thấp hơn lương TB của chính nhóm họ quản lý.
SELECT TP.TENNV, TP.LUONG
FROM NHANVIEN TP
JOIN PHONGBAN PB ON TP.MANV = PB.TRUONGPHONG
WHERE TP.LUONG < (
    SELECT AVG(NV.LUONG) 
    FROM NHANVIEN NV 
    WHERE NV.MAPB = PB.MAPB
)

-- 39. Tính tổng số giờ thực hiện theo quý/năm cho từng đề án.
SELECT MADA, SUM(THOIGIAN) AS TongGio, YEAR(GETDATE()) AS Nam FROM PHANCONG GROUP BY MADA

-- 40. Liệt kê tên đề án mà tất cả các phòng ban đều có ít nhất một nhân viên tham gia.
SELECT DA.TENDA
FROM DEAN DA
JOIN PHANCONG PC ON DA.MADA = PC.MADA
JOIN NHANVIEN NV ON PC.MANV = NV.MANV
GROUP BY DA.MADA, DA.TENDA
HAVING COUNT(DISTINCT NV.MAPB) = (SELECT COUNT(*) FROM PHONGBAN)

-- CHUONG 5:
-- PHAN 1: TAO LOGIN

-- Cau 1: Tao login cho admin, nhan vien, truong phong
-- admin: quan tri toan bo csdl
-- nhanvien: chi duoc xem
-- truongphong: xem va sua trong phong

CREATE LOGIN admin_qlda WITH PASSWORD = 'Admin@123';
CREATE LOGIN nhanvien_qlda WITH PASSWORD = 'NhanVien@123';
CREATE LOGIN truongphong_qlda WITH PASSWORD = 'TruongPhong@123';

-- Cau 2: Tao user tu login trong database QLDA

USE QLDA;

CREATE USER admin_user FOR LOGIN admin_qlda;
CREATE USER nhanvien_user FOR LOGIN nhanvien_qlda;
CREATE USER truongphong_user FOR LOGIN truongphong_qlda;

-- PHAN 2: CAP QUYEN (GRANT)

-- Cau 3: Cap quyen doc (SELECT) cho nhan vien tren 3 bang

-- nhan vien chi duoc xem du lieu
GRANT SELECT ON NHANVIEN TO nhanvien_user;
GRANT SELECT ON DEAN TO nhanvien_user;
GRANT SELECT ON PHANCONG TO nhanvien_user;


-- Cau 4: Truong phong duoc them va cap nhat nhan vien

-- SELECT: xem
-- INSERT: them
-- UPDATE: sua
GRANT SELECT, INSERT, UPDATE ON NHANVIEN TO truongphong_user;


-- Cau 5: Cap quyen cao nhat cho admin (db_owner)

-- admin co toan quyen tren database
ALTER ROLE db_owner ADD MEMBER admin_user;

-- PHAN 3: THU HOI QUYEN (REVOKE, DENY)

-- Cau 6: Thu hoi quyen cap nhat bang DEAN cua nhan vien

-- REVOKE: bo quyen da cap
REVOKE UPDATE ON DEAN FROM nhanvien_user;


-- Cau 7: Cam truong phong xoa nhan vien

-- DENY: cam hanh dong (uu tien cao hon grant)
DENY DELETE ON NHANVIEN TO truongphong_user;

-- PHAN 4: XOA LOGIN VA USER

-- Cau 8: Xoa user va login cua nhan vien

-- phai xoa user truoc roi moi xoa login
USE QLDA;

DROP USER nhanvien_user;
DROP LOGIN nhanvien_qlda;


-- =========================================
-- PHAN 5: KIEM TRA QUYEN
-- =========================================

-- Cau 9: Liet ke quyen cua truong phong

-- fn_my_permissions: xem quyen hien tai
-- Liet ke quyen cua truongphong_user

SELECT *
FROM sys.database_permissions
WHERE grantee_principal_id = USER_ID('truongphong_user');


-- Cau 10: Kiem tra quyen tren bang NHANVIEN cua nhanvien_user

-- Kiem tra quyen tren bang NHANVIEN cua nhanvien_user

SELECT *
FROM sys.database_permissions
WHERE grantee_principal_id = USER_ID('nhanvien_user')
AND major_id = OBJECT_ID('NHANVIEN');


-- =========================================
-- PHAN 6: NANG CAO
-- =========================================

-- Cau 1: Tao login ke toan
CREATE LOGIN ke_toan_qlda WITH PASSWORD = 'KeToan@123';

-- Cau 2: Tao user ke toan
USE QLDA;
CREATE USER ke_toan_user FOR LOGIN ke_toan_qlda;

-- Cau 3: Cap quyen SELECT va UPDATE
GRANT SELECT, UPDATE ON NHANVIEN TO ke_toan_user;
GRANT SELECT, UPDATE ON PHANCONG TO ke_toan_user;

-- Cau 4: Cam xoa du lieu
DENY DELETE ON NHANVIEN TO ke_toan_user;

-- Cau 5: Xoa user va login ke toan

DROP USER ke_toan_user;
DROP LOGIN ke_toan_qlda;


--STORE PROCEDURE 

--1. Tìm danh sách nhân viên theo mã phòng ban
IF OBJECT_ID('sp_Find_NV', 'p') IS NOT NULL
	DROP PROCEDURE sp_Find_NV 

CREATE PROCEDURE sp_Find_NV
	@Mapb varchar(5)
AS
BEGIN
	SELECT *
	FROM NHANVIEN
	WHERE MAPB = @Mapb
END

EXEC sp_Find_NV 'P2'

--2. Tìm danh sách thân nhân theo mã nhân viên
IF OBJECT_ID('sp_Find_TN', 'p') IS NOT NULL
	DROP PROCEDURE sp_Find_TN

CREATE PROCEDURE sp_Find_TN
	@Manv varchar(5)
AS
BEGIN
	SELECT *
	FROM THANNHAN
	WHERE MANV = @Manv
END

EXEC sp_Find_TN 'NV1'


-- 3. Tìm những nhân viên theo mã phòng ban có có mức lương cao hơn mức lương cần tìm
IF OBJECT_ID('sp_Find_Luongcao', 'p') IS NOT NULL
	DROP PROCEDURE sp_Find_Luongcao

CREATE PROCEDURE sp_Find_Luongcao
	@Luong decimal(10, 2)
AS
BEGIN
	SELECT MAPB, COUNT(MAPB) as SL
	FROM NHANVIEN
	WHERE LUONG > @Luong
	GROUP BY MAPB
END

EXEC sp_Find_Luongcao 30000

-- 4. Thêm thông tin cho nhân viên mới (SP_THEM_NHANVIEN), yêu cầu chỉ thêm nhân viên phòng Nghiên cứu
if object_id('sp_them_nhanvien', 'p') is not null
	drop procedure sp_them_nhanvien

create procedure sp_them_nhanvien
	@Manv varchar(5),
	@Honv nvarchar(20),
	@Tenlot nvarchar(20),
	@Tennv nvarchar(10),
	@Ngaysinh date,
	@Diachi nvarchar(100),
	@Phai varchar(5),
	@Luong decimal(10,2),
	@Mapb varchar(5)
as begin
	 if(@Mapb <> 'P3')
		begin 
			print('Chi duoc them nhan vien vao phong nghien cuu!')
			return
		end

	insert into NHANVIEN(MANV, HONV, TENLOT, TENNV, NGAYSINH, DIACHI, PHAI, LUONG, MAPB)
	values (@Manv, @Honv, @Tenlot, @Tennv, @Ngaysinh, @Diachi, @Phai, @Luong, @Mapb)
end

-- 5. Tìm danh sách các đề án được thực hiện bởi nhân viên có mã cho trước (SP_DEAN_MANV)
if object_id('sp_dean_by_nhanvien', 'p') is not null
	drop procedure sp_dean_nhanvien

create procedure sp_dean_nhanvien
	@Manv varchar(5)
as begin
	select da.MADA, da.TENDA, da.DDIEM_DA, pc.THOIGIAN 
	from dean da
	join PHANCONG pc on pc.MADA = da.MADA
	where pc.MANV = @Manv
end

exec sp_dean_nhanvien 'NV1'

-- 6. Tính lương trung bình của phòng ban theo tên phòng (SP_LUONGTB_TENPB)
if object_id('sp_luongtb_pb', 'p') is not null 
	drop procedure sp_luongtb_pb

create procedure sp_luongtb_pb
	@Tenpb nvarchar(500)
as begin 
	select pb.TENPB, avg(nv.LUONG) as Luongtb
	from NHANVIEN nv
	join PHONGBAN pb on pb.MAPB = nv.MAPB
	where pb.TENPB = @Tenpb
	group by pb.TENPB
end

exec sp_luongtb_pb N'NGHIENCUU'

-- 7. Cho biết danh sách các công việc được phân công cho các nhần viên ở phòng ban cần tìm theo mã phòng (SP_CV_MAPHG)
if object_id('sp_congviec_pc', 'p') is not null
	drop procedure sp_congviec_pc

create procedure sp_congviec_pc
	@Mapb varchar(5)
as begin
	select nv.MANV, nv.TENNV, da.MADA, da.TENDA, pc.THOIGIAN
	from NHANVIEN nv
	join PHANCONG pc on pc.MANV = nv.MANV
	join DEAN da on da.MADA = pc.MADA
	where nv.MAPB = @Mapb
end

exec sp_congviec_pc 'P3'

-- 8. Tính số lượng công việc của nhân viên theo mã nhân viên (SP SOCV MANV)
if object_id('sp_socv_nv', 'p') is not null
	drop procedure sp_socv_nv

create procedure sp_socv_nv
	@Manv varchar(5)
as begin
	select MANV, count(*) as SLCongViec
	from PHANCONG
	where MANV = @Manv
	group by MANV
end

exec sp_socv_nv 'NV1'

--FUNCTION

--9. Cho biết địa chỉ của một nhân viên dựa theo tên nhân viên
DROP FUNCTION IF EXISTS FN_DiaChiNhanVien
GO
CREATE FUNCTION FN_DiaChiNhanVien (
	@Ten VARCHAR(10)
)
RETURNS NVARCHAR(100)
AS
BEGIN 
	DECLARE @DC NVARCHAR(100)
	SELECT @DC = DIACHI 
	FROM NHANVIEN 
	WHERE TENNV = @Ten
	RETURN @DC
END
GO
SELECT dbo.FN_DiaChiNhanVien('TIEN')

--10. Truyền vào một mã nhân viên, cho biết họ tên đầy đủ của nhân viên quản lý nhân viên đó
DROP FUNCTION IF EXISTS FN_HoTenQuanLy
GO
CREATE FUNCTION FN_HoTenQuanLy(@Manv varchar(5))
RETURNS nvarchar(50)
AS
BEGIN
    DECLARE @HoTen nvarchar(50)
    SELECT @HoTen = tp.HONV + N' ' + tp.TENLOT + N' ' + tp.TENNV
    FROM NHANVIEN nv
    JOIN PHONGBAN pb ON pb.MAPB = nv.MAPB
    JOIN NHANVIEN tp ON tp.MANV = pb.TRUONGPHONG
    WHERE nv.MANV = @Manv
    RETURN @HoTen
END
GO
SELECT dbo.FN_HoTenQuanLy('NV1')

--11. Tên công việc của nhân viên cần tìm theo mã nhân viên đó
drop function if exists fn_tencongviec
go
create function fn_tencongviec(@Manv varchar(5))
returns table
as return (
	select da.MADA, da.TENDA, pc.THOIGIAN
	from DEAN da
	join PHANCONG pc on pc.MADA = da.MADA
	where pc.MANV = @Manv
)
go
select * from dbo.fn_tencongviec('NV1')

--12. Cho biết tên của thân nhân có quan hệ vợ chồng với nhân viên theo mã
drop function if exists fn_vochong
go
create function fn_vochong(@Manv varchar(5))
returns nvarchar(30)
as begin 
	declare @Ten nvarchar(30)
	select @Ten = TENTN
	from THANNHAN 
	where MANV = @Manv and QUANHE in(N'VỢ', N'CHỒNG')
	return @Ten
end
go
select dbo.fn_vochong('NV1')

--13. Với mã phòng ban cho trước, tính lương trung bình của phòng ban đó
drop function if exists fn_luongtb_pb
go
create function fn_luongtb_pb(@Mapb varchar(5))
returns decimal(10,2)
as begin
	declare @Ltb decimal(10,2)
	select @Ltb = avg(LUONG) 
	from NHANVIEN
	where MAPB = @Mapb
	return @Ltb
end
go 
select dbo.fn_luongtb_pb('P3')

--14. Tính giờ công thực hiện để án cúa phòng ban theo mã phòng
drop function if exists fn_giocong_pb
go
create function fn_giocong_pb(@Mapb varchar(5))
returns decimal(10,1)
as begin
	declare @Gc decimal(10,1)
	select @Gc = sum(pc.THOIGIAN)
	from PHANCONG pc
	join NHANVIEN nv on nv.MANV = pc.MANV
	where nv.MAPB = @Mapb
	return @Gc
end
go
select dbo.fn_giocong_pb('P3')

--15. Cho biết số lượng nhân viên của phòng ban theo mã phòng
drop function if exists fn_soluongnv
go
create function fn_soluongnv(@Mapb varchar(5))
returns int
as begin 
	declare @Sl int
	select @Sl = count(*)
	from NHANVIEN 
	where MAPB = @Mapb
	return @Sl
end
go
select dbo.fn_soluongnv('P3')

--16. Họ tên đầy đủ của trưởng phòng cúa nhân viên theo mã nhân viên
drop function if exists fn_soluongnv
go
create function fn_soluongnv(@Mapb varchar(5))
returns int
as begin
	declare @Sl int
	select @Sl = count(*)
	from NHANVIEN
	where MAPB = @Mapb
	return @Sl
end
go
select dbo.fn_soluongnv('P3')

--17. Cho biết tên đề án của phòng ban chủ trì theo mã phòng ban
drop function if exists fn_tendean_pb
go
create function fn_tendean_pb(@Mapb varchar(5))
returns table 
as return (
	select MADA, TENDA, DDIEM_DA
	from DEAN
	where MAPB = @Mapb
)
go 
select * from dbo.fn_tendean_pb('P3')

--18. Tìm những nhân viên theo mã phòng ban có có mức lương cao hơn mức lương cần tìm
drop function if exists fn_nvluongcao
go 
create function fn_nvluongcao(@Mapb varchar(5), @Luong decimal(10,2))
returns table 
as return (
	select MANV, HONV, TENLOT, TENNV, LUONG
	from NHANVIEN
	where MAPB = @Mapb and LUONG > @Luong
)
go
select * from dbo.fn_nvluongcao('P3', 25000)

--19. Tìm danh sách các đề án được thực hiện bởi nhân viên có mã cho trước
drop function if exists fn_dean
go
create function fn_dean(@Manv varchar(5))
returns table 
as return (
	select da.MADA, da.TENDA, da.DDIEM_DA, pc.THOIGIAN
	from DEAN da
	join PHANCONG pc on pc.MADA = da.MADA
	where pc.MANV = @Manv
)
go
select * from dbo.fn_dean('NV2')

--20. Tính lương trung bình của phòng ban theo tên phòng
drop function if exists fn_luongtb
go
create function fn_luongtb(@Tenpb nvarchar(50))
returns decimal
as begin
	declare @Ltb decimal(10,2)
	select @Ltb = avg(nv.LUONG)
	from NHANVIEN nv
	join PHONGBAN pb on pb.MAPB = nv.MAPB
	where pb.TENPB = @Tenpb
	return @Ltb
end
go
select dbo.fn_luongtb(N'NGHIENCUU')

/* TRIGGER */

-- 21. Cài đặt ràng buộc không cho nhân viên có MaNV=1 tham gia đề án số 2
if object_id('trg_constr_nv1','tr') is not null
	drop trigger trg_constr_nv1

create trigger trg_constr_nv1
on PHANCONG 
instead of insert
as begin
	if exists (
		select 1
		from inserted 
		where MANV = 'NV1' and MADA = 'DA2'
	)
		begin
			print('Nhan vien co ma NV1 khong duoc tham gia de an co ma DA2!')
			return
		end

	insert into PHANCONG(MANV, MADA, THOIGIAN)
	select MANV, MADA, THOIGIAN
	from inserted
end

-- 22. Cài đặt ràng buộc sao cho lương của trưởng phòng phải lớn hơn lương của nhân viên
if object_id('trg_luong', 'tr') is not null
	drop trigger trg_luong

create trigger trg_luong
on NHANVIEN
after insert, update
as begin
	if exists (
		select 1
		from inserted i
		join PHONGBAN pb on pb.TRUONGPHONG = i.MANV
		join NHANVIEN nv on pb.MAPB = nv.MAPB and nv.MANV <> i.MANV
		where i.LUONG <= nv.LUONG
	)
		begin
			rollback transaction
			print('Luong truong phong phai lon hon tat ca nhan vien trong phong')
			return
		end

	if exists (
		select 1
		from inserted i
		join PHONGBAN pb on pb.MAPB = i.MAPB and pb.TRUONGPHONG <> i.MANV
		join NHANVIEN nv on nv.MANV = pb.TRUONGPHONG
		where i.LUONG >= nv.LUONG
	)
		begin
			rollback transaction
			print('Luong nhan vien phai nho hon luong truong phong')
			return
		end
end

-- 23. Cài đặt ràng buộc sao cho một nhân viên không được tham gia quá 3 đề án
if object_id('trg_dean', 'tr') is not null
	drop trigger trg_dean

create trigger trg_dean
on PHANCONG
after insert, update
as begin
	if exists (
		select MANV
		from PHANCONG
		where MANV in (select MANV from inserted)
		group by MANV
		having count(*) > 3
	)
		begin 
			rollback transaction
			print('Nhan vien khong duoc tham gia qua 3 de an')
			return
		end
end