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

SET DATEFORMAT dmy 

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
Values 
(1, N'Nguyễn Vũ Phong', N'Tiền vệ', '20/02/1990', NULL, 'BBD', 'VN', 17),
(2, N'Nguyễn Công Vinh', N'Tiền đạo', '10/03/1992', NULL, 'HAGL', 'VN', 9),
(4, N'Trần Tấn Tài', N'Tiền vệ', '12/11/1999', NULL, 'BBD', 'VN', 8),
(5, N'Phan Hồng Sơn', N'Thủ môn', '10/06/1991', NULL, 'HAGL', 'VN', 1),
(6, N'Ronaldo', N'Tiền vệ', '12/12/1989', NULL, 'SDN', 'BRA', 7),
(7, N'Robinho', N'Tiền vệ', '12/10/1989', NULL, 'SDN', 'BRA', 8),
(8, N'Vidic', N'Hậu vệ', '15/10/1987', NULL, 'HAGL', 'ANH', 3),
(9, N'Trần Văn Santos', N'Thủ môn', '21/10/1990', NULL, 'BBD', 'BRA', 1),
(10, N'Nguyễn Trường Sơn', N'Hậu vệ', '26/08/1993', NULL, 'BBD', 'VN', 4)
SET IDENTITY_INSERT CAUTHU OFF
DBCC CHECKIDENT ('CAUTHU', RESEED, 10)

INSERT INTO HUANLUYENVIEN(MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)
Values ('HLV01', N'Vital', '15/10/1975', NULL, N'0918911975', 'BDN'),
('HLV02', N'Lê Huỳnh Đức', '20/05/1972', NULL, N'01223456789', 'VN'),
('HLV03', N'Kiatisuk', '11/12/1970', NULL, N'01990123456', 'THA'),
('HLV04', N'Hoàng Anh Tuấn', '10/06/1970', NULL, N'0989112233', 'VN'),
('HLV05', N'Trần Công Minh', '07/07/1973', NULL, N'0909099990', 'VN'),
('HLV06', N'Trần Văn Phúc', '02/03/1975', NULL, N'01650101234', 'VN')

INSERT INTO HLV_CLB(MAHLV, MACLB, VAITRO)
Values ('HLV01', 'BBD', N'HLV Chính'),
('HLV02', 'SDN', N'HLV Chính'),
('HLV03', 'HAGL', N'HLV Chính'),
('HLV04', 'KKH', N'HLV Chính'),
('HLV05', 'GDT', N'HLV Chính'),
('HLV06', 'BBD', N'HLV Thủ môn')

INSERT INTO TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, KETQUA)
Values (1, 2023, 1, '7/2/2023', 'BBD', 'SDN', 'GD', '3-0'),
(2, 2023, 1, '7/2/2023', 'KKH', 'GDT', 'NT', '1-1'),
(3, 2023, 2, '16/2/2023', 'SDN', 'KKH', 'CL', '2-2'),
(4, 2023, 2, '16/2/2023', 'TPY', 'BBD', 'TH', '5-0'),
(5, 2023, 3, '1/3/2023', 'TPY', 'GDT', 'TH', '0-2'),
(6, 2023, 3, '1/3/2023', 'KKH', 'BBD', 'NT', '0-1'),
(7, 2023, 4, '7/3/2023', 'KKH', 'TPY', 'NT', '1-0'),
(8, 2023, 4, '7/3/2023', 'BBD', 'GDT', 'GD', '2-2')

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

-- 1.Cho biết thông tin (Mã cầu thủ, họ tên, số áo, vị trí, ngày sinh, địa chỉ) của tất cả các cầu thủ
SELECT MACT, HOTEN, SO, VITRI, NGAYSINH, DIACHI 
FROM CAUTHU

-- 2. Hiển thị thông tin tất cả các cầu thủ có số áo là 7 chơi ở vị trí Tiền vệ
SELECT * 
FROM CAUTHU 
WHERE SO = 7 AND VITRI = N'Tiền vệ'

-- 3. Cho biết tên, ngày sinh, địa chỉ, điện thoại của tất cà các huấn luyện viên
SELECT TENHLV, NGAYSINH, DIACHI, DIENTHOAI 
FROM HUANLUYENVIEN

-- 4. Hiển thị thông tin tất cả các cầu thủ có quốc tịch Việt Nam thuộc câu lạc bộ Becamex Bình Dương 
SELECT CT.* 
FROM CAUTHU CT 
JOIN CAULACBO C ON CT.MACLB = C.MACLB 
WHERE CT.MAQG = 'VN' AND C.TENCLB = N'BECAMEX BÌNH DƯƠNG'

-- 5. Cho biết mã số, họ tên, ngày sinh, địa chỉ và vị trí của các cầu thủ thuộc đội bóng "SHB Đà Nẵng" có quốc tịch "Braxin"
SELECT MACT, HOTEN, NGAYSINH, CT.DIACHI, VITRI 
FROM CAUTHU CT JOIN CAULACBO C ON CT.MACLB = C.MACLB JOIN QUOCGIA Q ON CT.MAQG = Q.MAQG WHERE C.TENCLB = N'SHB ĐÀ NẴNG' AND Q.TENQG = N'Bra-xin';

-- 6. Hiển thị thông tin các cầu thủ đang thi đấu trong câu lạc bộ sân nhà "Long An"
SELECT CT.* FROM CAUTHU CT JOIN CAULACBO C ON CT.MACLB = C.MACLB JOIN SANVD S ON C.MASAN = S.MASAN WHERE S.TENSAN = N'Long An';

-- 7. Cho biết kết quà (MATRAN, NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) các trận đấu vòng 2 của mùa bóng năm 2025
SELECT T.MATRAN, T.NGAYTD, S.TENSAN, C1.TENCLB, C2.TENCLB, T.KETQUA FROM TRANDAU T JOIN SANVD S ON T.MASAN = S.MASAN JOIN CAULACBO C1 ON T.MACLB1 = C1.MACLB JOIN CAULACBO C2 ON T.MACLB2 = C2.MACLB WHERE T.VONG = 2 AND T.NAM = 2025;


-- 8. Cho biết mã huấn luyện viên, họ tên, ngày sỉnh, địa chỉ, vai trò và tên CLB đang làm việc của các huấn luyện viên có quốc tịch "Việt Nam"
SELECT H.MAHLV, H.TENHLV, H.NGAYSINH, H.DIACHI, HC.VAITRO, C.TENCLB 
FROM HUANLUYENVIEN H 
JOIN HLV_CLB HC ON H.MAHLV = HC.MAHLV 
JOIN CAULACBO C ON HC.MACLB = C.MACLB 
WHERE H.MAQG = 'VN';


-- 9. Lấy tên 3 câu lac bộ có điểm cao nhất sau vòng 3 năm 2025
SELECT TOP 3 C.TENCLB FROM BANGXH B JOIN CAULACBO C ON B.MACLB = C.MACLB WHERE B.VONG = 3 AND B.NAM = 2025 ORDER BY B.DIEM DESC;


-- 10. Cho biết mã huấn luyện viên, họ tên, ngày sinh, dia chỉ, vai trò và tên CLB đang làm việc mà câu lạc bộ đó đóng ở tỉnh Bình Dương 
SELECT H.MAHLV, H.TENHLV, H.NGAYSINH, H.DIACHI, HC.VAITRO, C.TENCLB FROM HUANLUYENVIEN H JOIN HLV_CLB HC ON H.MAHLV = HC.MAHLV JOIN CAULACBO C ON HC.MACLB = C.MACLB JOIN TINH T ON C.MATINH = T.MATINH WHERE T.TENTINH = N'Bình Dương';

-- 11. Thống kê số lượng cầu thù của mỗi câu lạc bộ 
SELECT MACLB, COUNT(MACT) AS SOLUONG FROM CAUTHU GROUP BY MACLB;

-- 12. Thống kế số lượng cầu thủ nước ngoài (có quốc tịch khác Việt Nam) của mỗi câu lạc bộ 
SELECT MACLB, COUNT(MACT) AS SL_NGOAI FROM CAUTHU WHERE MAQG <> 'VN' GROUP BY MACLB;

-- 13. Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, đia chỉ và s lượng câu thù nuớc thủ nước ngoài. ngoài (có quốc tịch khác "Viet Nam") tương ứng của các câu lac bộ có nhiều hơn 2 cá
SELECT C.MACLB, C.TENCLB, S.TENSAN, S.DIACHI, COUNT(CT.MACT) FROM CAULACBO C JOIN SANVD S ON C.MASAN = S.MASAN JOIN CAUTHU CT ON C.MACLB = CT.MACLB WHERE CT.MAQG <> 'VN' GROUP BY C.MACLB, C.TENCLB, S.TENSAN, S.DIACHI HAVING COUNT(CT.MACT) > 2;

-- 14.Cho biết tên tỉnh, số lượng cầu thủ đang thi đấu ở vị trí tiền đạo trong các câu lạc bộ thuốc địa bàn tỉnh đó quản lý
SELECT T.TENTINH, COUNT(CT.MACT) FROM TINH T JOIN CAULACBO C ON T.MATINH = C.MATINH JOIN CAUTHU CT ON C.MACLB = CT.MACLB WHERE CT.VITRI = N'Tiền đạo' GROUP BY T.TENTINH;

-- 15. Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng nằm ở vị trí cao nhất của bảng xếp hạng của vòng 3, năm 2025
SELECT C.TENCLB, T.TENTINH FROM BANGXH B JOIN CAULACBO C ON B.MACLB = C.MACLB JOIN TINH T ON C.MATINH = T.MATINH WHERE B.VONG = 3 AND B.NAM = 2025 AND B.HANG = 1;

-- 16.Cho biết tên huấn luyện viên đang năm giữ một vị trí trong một câu lạc bộ mà chưa có số điện thoại
SELECT H.TENHLV FROM HUANLUYENVIEN H JOIN HLV_CLB HC ON H.MAHLV = HC.MAHLV WHERE H.DIENTHOAI IS NULL OR H.DIENTHOAI = '';

-- 17.Liệt kế các huấn luyện viên thuộc quốc gia Việt Nam chưa làm công tác huấn luyện tai bất kỳ một câu lạc bộ nào
SELECT TENHLV FROM HUANLUYENVIEN WHERE MAQG = 'VN' AND MAHLV NOT IN (SELECT MAHLV FROM HLV_CLB);

-- 18. Liệt kê các cầu thủ đang thi đấu trong các câu lạc bộ có thứ hạng ở vòng 3 năm 2025 lớn hơn 6 hoặc nhỏ hơn 3
SELECT CT.HOTEN FROM CAUTHU CT JOIN BANGXH B ON CT.MACLB = B.MACLB WHERE B.VONG = 3 AND B.NAM = 2025 AND (B.HANG > 6 OR B.HANG < 3);

-- 19. Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) của câu lạc bộ CLB đang xếp hạng cao nhất tính đến hết vòng 3 năm 2025
SELECT T.NGAYTD, S.TENSAN, C1.TENCLB, C2.TENCLB, T.KETQUA FROM TRANDAU T JOIN SANVD S ON T.MASAN = S.MASAN JOIN CAULACBO C1 ON T.MACLB1 = C1.MACLB JOIN CAULACBO C2 ON T.MACLB2 = C2.MACLB WHERE (T.MACLB1 = (SELECT MACLB FROM BANGXH WHERE VONG = 3 AND NAM = 2025 AND HANG = 1) OR T.MACLB2 = (SELECT MACLB FROM BANGXH WHERE VONG = 3 AND NAM = 2025 AND HANG = 1)) AND T.VONG <= 3 AND T.NAM = 2025;

-- 20.Cho biết NGAYTD, TENCLB1, TENCLB2, KETQUA các trân đấu diễn ra vào tháng 3 trên sân nhà mà không bị thủng lưới
SELECT T.NGAYTD, C1.TENCLB, C2.TENCLB, T.KETQUA FROM TRANDAU T JOIN CAULACBO C1 ON T.MACLB1 = C1.MACLB JOIN CAULACBO C2 ON T.MACLB2 = C2.MACLB WHERE MONTH(T.NGAYTD) = 3 AND RIGHT(T.KETQUA, 1) = '0';

-- 21.Cho biết mã số, họ tên, ngày sinh của những cầu thủ có họ lót là "Công" 
SELECT MACT, HOTEN, NGAYSINH FROM CAUTHU WHERE HOTEN LIKE N'% Công %';

-- 22.Cho biết mã số, họ tên, ngày sinh của những càu thủ có họ không phải là họ "Nguyễn" 
SELECT MACT, HOTEN, NGAYSINH FROM CAUTHU WHERE HOTEN NOT LIKE N'Nguyễn%';

-- 23.Cho biết mã huấn luyện viên, họ tên, ngày sinh, địa chỉ cùa những huấn luyện viên Việt Nam có tuổi nằm trong khoảng 35 - 40
SELECT MAHLV, TENHLV, NGAYSINH, DIACHI FROM HUANLUYENVIEN WHERE MAQG = 'VN' AND (YEAR(GETDATE()) - YEAR(NGAYSINH)) BETWEEN 35 AND 40;

-- 24.Cho biết tên câu lạc bộ có huấn luyện viên trưởng sinh vào ngày 20 tháng 5
SELECT C.TENCLB FROM CAULACBO C JOIN HLV_CLB HC ON C.MACLB = HC.MACLB JOIN HUANLUYENVIEN H ON HC.MAHLV = H.MAHLV WHERE HC.VAITRO = N'HLV Chính' AND DAY(H.NGAYSINH) = 20 AND MONTH(H.NGAYSINH) = 5;

-- 25. hết vòng 3 năm 2025 Cho biết tên câu lạc bộ, tên tinh mà CLB đang đóng có số bàn tháng nhiều nhất tính đến hết vòng 3 năm 2025
SELECT TOP 1 C.TENCLB, T.TENTINH FROM BANGXH B JOIN CAULACBO C ON B.MACLB = C.MACLB JOIN TINH T ON C.MATINH = T.MATINH WHERE B.VONG = 3 AND B.NAM = 2025 ORDER BY B.DIEM DESC;

-- 26. Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng câu thù thủ nước ngoài (có quốc tịch khác "Việt Nam") tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài
SELECT C.MACLB, C.TENCLB, S.TENSAN, S.DIACHI, COUNT(CT.MACT) FROM CAULACBO C JOIN SANVD S ON C.MASAN = S.MASAN JOIN CAUTHU CT ON C.MACLB = CT.MACLB WHERE CT.MAQG <> 'VN' GROUP BY C.MACLB, C.TENCLB, S.TENSAN, S.DIACHI HAVING COUNT(CT.MACT) > 2;

-- 27. Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có hiệu số bàn thắng bại cao nhất năm 2025
SELECT TOP 1 C.TENCLB, T.TENTINH FROM BANGXH B JOIN CAULACBO C ON B.MACLB = C.MACLB JOIN TINH T ON C.MATINH = T.MATINH WHERE B.NAM = 2025 ORDER BY B.HANG ASC;

-- 28. Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) của câu lạc bộ CLB có thứ hạng thấp nhất trong bảng xép hạng vòng 3 năm 202̀5
SELECT T.* FROM TRANDAU T WHERE T.MACLB1 = (SELECT TOP 1 MACLB FROM BANGXH WHERE VONG = 3 AND NAM = 2025 ORDER BY HANG DESC) OR T.MACLB2 = (SELECT TOP 1 MACLB FROM BANGXH WHERE VONG = 3 AND NAM = 2025 ORDER BY HANG DESC);

-- 29. Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cá các câu lạc bộ còn lại (kế cả sân nhà và sân khách) trong mùa giải nắm 2025
SELECT MACLB, TENCLB FROM CAULACBO C WHERE NOT EXISTS (SELECT MACLB FROM CAULACBO C2 WHERE C2.MACLB <> C.MACLB EXCEPT (SELECT MACLB2 FROM TRANDAU WHERE MACLB1 = C.MACLB AND NAM = 2025 UNION SELECT MACLB1 FROM TRANDAU WHERE MACLB2 = C.MACLB AND NAM = 2025));

-- 30. Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đâu với tất cả các câu lạc bộ còn lại (chỉ tính sân nhà) trong mùa giải năm 2025
SELECT MACLB, TENCLB FROM CAULACBO C WHERE NOT EXISTS (SELECT MACLB FROM CAULACBO C2 WHERE C2.MACLB <> C.MACLB EXCEPT SELECT MACLB2 FROM TRANDAU WHERE MACLB1 = C.MACLB AND NAM = 2025);

-- 31. Khi thêm câu thủ mới, kiểm tra vị trí trên sân của cầu thủ chỉ thuộc một trong các vi trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ
ALTER TABLE CAUTHU ADD CONSTRAINT CK_VITRI CHECK (VITRI IN (N'Thủ môn', N'Tiền đạo', N'Tiền vệ', N'Trung vệ', N'Hậu vệ'));

-- 32. Khi phân công huân luyện viên, kiểm tra vai trò của huấn luyện viên chỉ thuộc một trong các vai trò sau: HLV chính, HLV phụ, HLV thể lực, HLV thủ môn
ALTER TABLE HLV_CLB ADD CONSTRAINT CK_VAITRO CHECK (VAITRO IN (N'HLV chính', N'HLV phụ', N'HLV thể lực', N'HLV thủ môn'));

-- 33. Khi thêm cầu thủ mới, kiểm tra cầu thủ đó có tuổi phải đủ 18 trờ lên (chỉ tính năm sinh)
ALTER TABLE CAUTHU ADD CONSTRAINT CK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGAYSINH) >= 18);

-- 34. Kiểm tra kết quả trận đấu có dạng số_bàn_thắng-số_bàn_thua
ALTER TABLE TRANDAU ADD CONSTRAINT CK_KETQUA CHECK (KETQUA LIKE '%-%');

-- 35. Với mỗi CLB, liệt kê 3 cầu thủ ghi nhiêu bàn nhất (MaCT, HoTen, SoBan, TenCLB)

-- 36. Tìm những câu thủ đã từng thi đâu ở từ 2 vị trí trờ lên trong các trận khác nhau

-- 37. Tìm CLB có số thẻ vàng + thè đỏ ít nhất trong mùa giải 2025

