/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLBD') IS NOT NULL
		DROP DATABASE QLBD
	GO

*/

CREATE DATABASE QLBongDa

USE QLBongDa

CREATE TABLE CAUTHU(
	MACT numeric identity(1, 1) primary key,
	HOTEN nvarchar(100) not null,
	VITRI nvarchar(20) not null,
	NGAYSINH datetime,
	DIACHI nvarchar(200),
	MACLB varchar(5) not null,
	MAQG varchar(5) not null,
	SO int not null
)

CREATE TABLE QUOCGIA (
	MAQG varchar(5) primary key,
	TENQG nvarchar(60)
)

CREATE TABLE CAULACBO (
	MACLB varchar(5) primary key,
	TENCLB nvarchar(100),
	MASAN varchar(5),
	MATINH varchar(5)
)

CREATE TABLE TINH (
	MATINH varchar(5) primary key,
	TENTINH nvarchar(60)
)

CREATE TABLE SANVD (
	MASAN varchar(5) primary key, 
	TENSAN nvarchar(100),
	DIACHI nvarchar(200)
)

CREATE TABLE HUANLUYENVIEN (
	MAHLV varchar(5) primary key,
	TENHLV nvarchar(100),
	NGAYSINH datetime,
	DIACHI nvarchar(200),
	DIENTHOAI nvarchar(20),
	MAQG varchar(5)
)

CREATE TABLE HLV_CLB (
	MAHLV varchar(5),
	MACLB varchar(5),
	VAITRO nvarchar(100),
	constraint pk_hlvclb_mhlv_mclb primary key(MAHLV, MACLB)
)

CREATE TABLE TRANDAU (
	MATRAN numeric primary key,
	NAM int, 
	VONG int,
	NGAYTD datetime,
	MACLB1 varchar(5),
	MACLB2 varchar(5),
	MASAN varchar(5),
	KETQUA varchar(5)
)

CREATE TABLE BANGXH (
	MACLB varchar(5),
	NAM int,
	VONG int,
	SOTRAN int, 
	THANG int,
	HOA int,
	THUA int, 
	HIEUSO varchar(5),
	DIEM int,
	HANG int,
	constraint pk_bxh_mclb_nam_vong primary key(MACLB, NAM, VONG)
)

ALTER TABLE TRANDAU ADD constraint fk_td_ms foreign key(MASAN) references SANVD(MASAN)
ALTER TABLE TRANDAU ADD constraint fk_td_mclb1 foreign key(MACLB1) references CAULACBO(MACLB)
ALTER TABLE TRANDAU ADD constraint fk_td_mclb2 foreign key(MACLB2) references CAULACBO(MACLB)
ALTER TABLE BANGXH ADD constraint fk_bxh_mclb foreign key(MACLB) references CAULACBO(MACLB)
ALTER TABLE CAULACBO ADD constraint fk_clb_mt foreign key(MATINH) references TINH(MATINH)
ALTER TABLE CAULACBO ADD constraint fk_clb_ms foreign key(MASAN) references SANVD(MASAN)
ALTER TABLE CAUTHU ADD constraint fk_ct_mclb foreign key(MACLB) references CAULACBO(MACLB)
ALTER TABLE CAUTHU ADD constraint fk_ct_mqg foreign key(MAQG) references QUOCGIA(MAQG)
ALTER TABLE HUANLUYENVIEN ADD constraint fk_hlv_mqg foreign key(MAQG) references QUOCGIA(MAQG)
ALTER TABLE HLV_CLB ADD constraint fk_hlvclb_mhlv foreign key(MAHLV) references HUANLUYENVIEN(MAHLV)
ALTER TABLE HLV_CLB ADD constraint fk_hlvclb_mclb foreign key(MACLB) references CAULACBO(MACLB)

INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('GD', N'Gò Đậu', N'123 QL1, TX Thủ Dầu Một, Bình Dương')
INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('PL', N'Pleiku', N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai')
INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('CL', N'Chi Lăng', N'127 Võ Văn Tần, Đà Nẵng')
INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('NT', N'Nha Trang', N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa')
INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('TH', N'Tuy Hòa', N'57 Trường Chinh, Tuy Hòa, Phú Yên')
INSERT INTO SANVD(MASAN, TENSAN, DIACHI) Values ('LA', N'Long An', N'102 Hùng Vương, Tp Tân An, Long An')

INSERT INTO QUOCGIA(MAQG, TENQG)
Values ('VN',N'Việt Nam'), 
('ANH', N'Anh Quốc'),
('TBN', N'Tây Ban Nha'),
('BDN', N'Bồ Đào Nha'),
('BRA', N'Bra-xin'),
('ITA', N'Ý'),
('THA', N'Thái Lan')

INSERT INTO TINH(MATINH, TENTINH)
Values ('BD', N'Bình Dương'),
('GL', N'Gia Lai'),
('DN', N'Đà Nẵng'),
('KH', N'Khánh Hòa'),
('PY', N'Phú Yên'),
('LA', N'Long An')

INSERT INTO CAULACBO(MACLB, TENCLB, MASAN, MATINH)
Values('BBD', N'BECAMEX BÌNH DƯƠNG', 'GD', 'BD'),
('HAGL', N'HOÀNG ANH GIA LAI', 'PL', 'GL'),
('SDN', N'SHB ĐÀ NẴNG', 'CL', 'DN'),
('KKH', N'KHATOCO KHÁNH HÒA', 'NT', 'KH'),
('TPY', N'THÉP PHÚ YÊN', 'TH', 'PY'),
('GDT', N'GẠCH ĐỒNG TÂM LONG', 'LA', 'LA')

SET IDENTITY_INSERT CAUTHU ON
INSERT INTO CAUTHU(MACT, HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO)
Values (1, N'Nguyễn Vũ Phong', N'Tiền vệ', 20/02/1990,  NULL, 'BBD', 'VN', 17),
(2, N'Nguyễn Công Vinh', N'Tiền đạo', 10/03/1992, NULL, 'HAGL', 'VN', 9),
(4, N'Trần Tấn Tài', N'Tiền vệ', 12/11/1999, NULL, 'BBD', 'VN', 8),
(5, N'Phan Hồng Sơn', N'Thủ môn', 10/06/1991, NULL, 'HAGL', 'VN', 1),
(6, N'Ronaldo', N'Tiền vệ', 12/12/1989, NULL, 'SDN', 'BRA', 7),
(7, N'Robinho', N'Tiền vệ', 12/10/1989, NULL, 'SDN', 'BRA', 8),
(8, N'Vidic', N'Hậu vệ', 15/10/1987, NULL, 'HAGL', 'ANH', 3),
(9, N'Trần Văn Santos', N'Thủ môn', 21/10/1990, NULL, 'BBD', 'BRA', 1),
(10, N'Nguyễn Trường Sơn', N'Hậu vệ', 26/8/1993, NULL, 'BBD', 'VN', 4)
SET IDENTITY_INSERT CAUTHU OFF 
DBCC CHECKIDENT ('CAUTHU', RESEED, 10)

INSERT INTO HUANLUYENVIEN(MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)
Values ('HLV01', N'Vital', 15/10/1975, NULL, N'0918911975', 'BDN'),
('HLV02', N'Lê Huỳnh Đức', 20/05/1972, NULL, N'01223456789', 'VN'),
('HLV03', N'Kiatisuk', 11/12/1970, NULL, N'01990123456', 'THA'),
('HLV04', N'Hoàng Anh Tuấn', 10/06/1970, NULL, N'0989112233', 'VN'),
('HLV05', N'Trần Công Minh', 07/07/1973, NULL, N'0909099990', 'VN'),
('HLV06', N'Trần Văn Phúc', 02/03/1975, NULL, N'01650101234', 'VN')

INSERT INTO HLV_CLB(MAHLV, MACLB, VAITRO)
Values ('HLV01', 'BBD', N'HLV Chính'),
('HLV02', 'SDN', N'HLV Chính'),
('HLV03', 'HAGL', N'HLV Chính'),
('HLV04', 'KKH', N'HLV Chính'),
('HLV05', 'GDT', N'HLV Chính'),
('HLV06', 'BBD', N'HLV Thủ môn')

INSERT INTO TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, KETQUA)
Values (1, 2023, 1, 7/2/2023, 'BBD', 'SDN', 'GD', '3-0'),
(2, 2023, 1, 7/2/2023, 'KKH', 'GDT', 'NT', '1-1'),
(3, 2023, 2,16/2/2023, 'SDN', 'KKH', 'CL', '2-2'),
(4, 2023, 2, 16/2/2023, 'TPY', 'BBD', 'TH', '5-0'),
(5, 2023, 3, 1/3/2023, 'TPY', 'GDT', 'TH', '0-2'),
(6, 2023, 3, 1/3/2023, 'KKH', 'BBD', 'NT', '0-1'),
(7, 2023, 4, 7/3/2023, 'KKH', 'TPY', 'NT', '1-0'),
(8, 2023, 4, 7/3/2023, 'BBD', 'GDT', 'GD', '2-2')

INSERT INTO BANGXH(MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, DIEM, HANG)
Values ('BBD', 2023, 1, 1, 1, 0, 0, '3-0', 3, 1),
('KKH', 2023, 1, 1, 0, 1, 0, '1-1', 1, 2),
('GDT', 2023, 1, 1, 0, 1, 0, '1-1', 1, 3),
('TPY', 2023, 1, 0, 0, 0, 0, '0-0', 0, 4),
('SDN', 2023, 1, 1, 0, 0, 1, '0-3', 0, 5),
('TPY', 2023, 2, 1, 1, 0, 0, '5-0', 3, 1),
('BBD', 2023, 2, 2, 1, 0, 2, '3-5', 3, 2),
('KKH', 2023, 2, 2, 0, 2, 0, '3-3', 2, 3),
('GDT', 2023, 2, 1, 0, 1, 0, '1-1', 1, 4),
('SDN', 2023, 2, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2023, 3, 3, 2, 0, 1, '4-5', 6, 1),
('GDT', 2023, 3, 2, 1, 1, 0, '3-1', 4, 2),
('TPY', 2023, 3, 2, 1, 0, 1, '5-2', 3, 3),
('KKH', 2023, 3, 3, 0, 2, 1, '3-4', 2, 4),
('SDN', 2023, 3, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2023, 4, 4, 2, 1, 1, '6-7', 7, 1),
('GDT', 2023, 4, 3, 1, 2, 0, '5-1', 5, 2),
('KKH', 2023, 4, 4, 1, 2, 1, '4-4', 5, 3),
('TPY', 2023, 4, 3, 1, 0, 2, '5-3', 3, 4),
('SDN', 2023, 4, 2, 1, 1, 0, '2-5', 1, 5)

SELECT * FROM SANVD
SELECT * FROM QUOCGIA
SELECT * FROM TINH 
SELECT * FROM CAULACBO 
SELECT * FROM CAUTHU 
SELECT * FROM HUANLUYENVIEN 
SELECT * FROM HLV_CLB 
SELECT * FROM TRANDAU 
SELECT * FROM BANGXH 