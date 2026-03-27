/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLDA') IS NOT NULL
		DROP DATABASE QLDA
	GO

*/

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
--ALTER TABLE NHANVIEN add constraint fk_nv_mpb foreign key(MAPB) references PHONGBAN(MAPB)--

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

--Query--

1. Cho biết tên, tuổi của từng nhân viên 

2. Cho biết thông tin về những người có phái là nam và địa chỉ trên đường "Tran Hung Dao"

3. Cho biết những người có học là "Le" và tên bắt đầu bằng ký tự "N"

4. Cho biết những người có ngày sinh trong tháng 7 năm 1978

5. Cho biết những người có ngày sinh trong quý 3

6. Cho biết số đề án được phân công của từng nhân viên (gồm mã số, tên, số lượng đề án được phân công)

7. Cho biết tên nhân viên có từ 2 thân nhân trở lên

8. Tên nhân viên >= 30 tuổi được phân công làm việc cho đề án ở TPHCM

9. Cho biết có bao nhiêu đề án ở TPHCM

10. Đối với mỗi thành phố, cho biết tên và số lượng đề án được thực hiện ờ đó

11. Cho biết số năm thâm niên (số năm làm việc) của từng trường phòng

12. Cho biết số lượng địa điểm của từng phòng ban 

13. Cho biết có bao nhiêu tên đề án là "sản phẩm"

14. Cho biết tên phòng, địa điểm phòng, tên đề án, địa điểm đề án của những đề án có địa điểm của đề án trùng với địa điểm của phòng

15. Tên các nhân viên quản lý có mức lương thấp hơn lương trung bình nhân viên họ quản lí trực tiếp 

