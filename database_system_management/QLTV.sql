/*
	Xoa database vi nhap nham du lieu

	USE master
	GO

	IF DB_ID('QLTV') IS NOT NULL
		DROP DATABASE QLTV
	GO

*/

CREATE DATABASE QLTV

USE QLTV 

CREATE TABLE DocGia (
	Ma_DocGia varchar(50),
	Ho nvarchar(30),
	TenLot nvarchar(30),
	Ten nvarchar(30),
	NgaySinh date
	constraint pk_dg_mdg primary key(Ma_DocGia)
)

CREATE TABLE NguoiLon (
	Ma_DocGia varchar(50), 
	SoNha varchar(20),
	Duong nvarchar(50),
	Quan tinyint,
	DienThoai varchar(12),
	HanSuDung date 
	constraint pk_nl_mdg primary key(Ma_DocGia)
)

CREATE TABLE TreEm (
	Ma_DocGia varchar(50),
	Ma_DocGia_NguoiLon varchar(50)
	constraint pk_te_mdg primary key(Ma_DocGia)
)

CREATE TABLE TuaSach (
	Ma_TuaSach varchar(50),
	TuaSach nvarchar(50),
	TacGia nvarchar(50),
	TomTat nvarchar(500)
	constraint pk_ts_mts primary key(Ma_TuaSach)
)

CREATE TABLE DauSach (
	ISBN varchar(25),
	Ma_TuaSach varchar(50),
	NgonNgu varchar(20),
	Bia nvarchar(20),
	TrangThai nvarchar(50)
	constraint pk_ds_isbn primary key(ISBN)
)

CREATE TABLE CuonSach (
	ISBN varchar(25),
	Ma_CuonSach varchar(50),
	TinhTrang nvarchar(10)
	constraint pk_cs_isbn_mcs primary key(ISBN, Ma_CuonSach)
)

CREATE TABLE DangKy (
	ISBN varchar(25),
	Ma_DocGia varchar(50), 
	NgayDK datetime,
	GhiChu nvarchar(100) 
	constraint pk_dk_isbn_mdg primary key(ISBN, Ma_DocGia)
)

CREATE TABLE Muon (
	ISBN varchar(25),
	Ma_CuonSach varchar(50),
	Ma_DocGia varchar(50),
	NgayMuon datetime,
	NgayHetHan datetime
	constraint pk_m_isbn_mcs primary key(ISBN, Ma_CuonSach)
)

CREATE TABLE QuaTrinhMuon (
	ISBN varchar(25),
	Ma_CuonSach varchar(50),
	NgayMuon datetime,
	Ma_DocGia varchar(50), 
	NgayHetHan datetime,
	NgayTra datetime, 
	TienMuon decimal(5,2),
	TienDaTra decimal(5, 2),
	TienDatCoc decimal(10, 2),
	GhiChu nvarchar(100) 
	constraint pk_qtm_isbn_mcs_nm primary key (ISBN, Ma_CuonSach, NgayMuon)
)

ALTER TABLE DangKy add constraint fk_dk_isbn foreign key(ISBN) references DauSach(ISBN)
ALTER TABLE DangKy add constraint fk_dk_mdg foreign key(Ma_DocGia) references DocGia(Ma_DocGia)
ALTER TABLE DauSach add constraint fk_ds_mts foreign key(Ma_TuaSach) references TuaSach(Ma_TuaSach)
ALTER TABLE Muon add constraint fk_m_mdg foreign key(Ma_DocGia) references DocGia(Ma_DocGia)
ALTER TABLE Muon add constraint fk_m_isbn_mcs foreign key(ISBN, Ma_CuonSach) references CuonSach(ISBN, Ma_CuonSach)
ALTER TABLE CuonSach add constraint fk_cs_isbn foreign key(ISBN) references DauSach(ISBN)
ALTER TABLE QuaTrinhMuon add constraint fk_qtm_isbn_mcs foreign key(ISBN, Ma_CuonSach) references CuonSach(ISBN, Ma_CuonSach)
ALTER TABLE QuaTrinhMuon add constraint fk_qtm_mdg foreign key(Ma_DocGia) references DocGia(Ma_DocGia)
ALTER TABLE NguoiLon add constraint fk_nl_mdg foreign key(Ma_DocGia) references DocGia(Ma_DocGia)
ALTER TABLE TreEm add constraint fk_te_mdg foreign key(Ma_DocGia) references DocGia(Ma_DocGia)
ALTER TABLE TreEm add constraint fk_te_mdgnl foreign key(Ma_DocGia_NguoiLon) references NguoiLon(Ma_DocGia)


-- 1. Nhập dữ liệu cho bảng DocGia (Cần nhập trước để làm khóa ngoại)
-- Bao gồm cả người lớn và trẻ em
INSERT INTO DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh) VALUES
('DG001', N'Nguyễn', N'Văn', N'An', '1985-05-12'),
('DG002', N'Trần', N'Thị', N'Bình', '1990-08-20'),
('DG003', N'Lê', N'Hoàng', N'Cường', '1978-12-05'),
('DG004', N'Phạm', N'Minh', N'Đức', '1995-03-15'),
('DG005', N'Vũ', N'Thu', N'Hà', '1988-11-25'),
('DG006', N'Nguyễn', N'Minh', N'Khôi', '2015-01-10'), -- Trẻ em
('DG007', N'Trần', N'Bảo', N'Ngọc', '2016-06-22'),  -- Trẻ em
('DG008', N'Lê', N'Tuấn', N'Kiệt', '2017-09-14'),   -- Trẻ em
('DG009', N'Phạm', N'Thùy', N'Dương', '2014-04-30'), -- Trẻ em
('DG010', N'Đặng', N'Gia', N'Huy', '2018-02-18');    -- Trẻ em


-- 2. Nhập dữ liệu cho bảng NguoiLon
INSERT INTO NguoiLon (Ma_DocGia, SoNha, Duong, Quan, DienThoai, HanSuDung) VALUES
('DG001', '123', N'Lê Lợi', 1, '0901234567', '2026-12-31'),
('DG002', '456', N'Nguyễn Huệ', 1, '0912345678', '2025-10-20'),
('DG003', '78', N'Cách Mạng Tháng 8', 3, '0923456789', '2026-05-15'),
('DG004', '12', N'Trần Hưng Đạo', 5, '0934567890', '2025-08-12'),
('DG005', '99', N'Phan Đăng Lưu', 7, '0945678901', '2027-01-01');


-- 3. Nhập dữ liệu cho bảng TreEm (Ma_DocGia_NguoiLon phải tồn tại trong bảng NguoiLon)
INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon) VALUES
('DG006', 'DG001'),
('DG007', 'DG002'),
('DG008', 'DG003'),
('DG009', 'DG004'),
('DG010', 'DG005');


-- 4. Nhập dữ liệu cho bảng TuaSach
INSERT INTO TuaSach (Ma_TuaSach, TuaSach, TacGia, TomTat) VALUES
('TS001', N'Số Đỏ', N'Vũ Trọng Phụng', N'Tác phẩm văn học hiện thực phê phán Việt Nam.'),
('TS002', N'Dế Mèn Phiêu Lưu Ký', N'Tô Hoài', N'Truyện về chú dế mèn nghị lực và những chuyến đi.'),
('TS003', N'Lập trình C cơ bản', N'Nguyễn Văn A', N'Hướng dẫn học lập trình C cho người mới.'),
('TS004', N'Lịch sử Việt Nam', N'Nhiều tác giả', N'Tóm tắt các giai đoạn lịch sử hào hùng.'),
('TS005', N'Vũ trụ trong vỏ hạt dẻ', N'Stephen Hawking', N'Khám phá những bí ẩn của vật lý lý thuyết.');


-- 5. Nhập dữ liệu cho bảng DauSach (ISBN là khóa chính)
INSERT INTO DauSach (ISBN, Ma_TuaSach, NgonNgu, Bia, TrangThai) VALUES
('978-604-1', 'TS001', N'Tiếng Việt', N'Bìa mềm', N'Sẵn có'),
('978-604-2', 'TS002', N'Tiếng Việt', N'Bìa cứng', N'Sẵn có'),
('978-604-3', 'TS003', N'Tiếng Việt', N'Bìa mềm', N'Cho mượn'),
('978-604-4', 'TS004', N'Tiếng Việt', N'Bìa mềm', N'Sẵn có'),
('978-604-5', 'TS005', N'Tiếng Anh', N'Bìa cứng', N'Sẵn có');


-- 6. Nhập dữ liệu cho bảng CuonSach
INSERT INTO CuonSach (ISBN, Ma_CuonSach, TinhTrang) VALUES
('978-604-1', 'CS001', N'Mới'),
('978-604-2', 'CS002', N'Tốt'),
('978-604-3', 'CS003', N'Cũ'),
('978-604-4', 'CS004', N'Mới'),
('978-604-5', 'CS005', N'Tốt');


-- 7. Nhập dữ liệu cho bảng DangKy
INSERT INTO DangKy (ISBN, Ma_DocGia, NgayDK, GhiChu) VALUES
('978-604-1', 'DG001', GETDATE(), N'Đăng ký mượn sớm'),
('978-604-2', 'DG006', GETDATE(), N'Phụ huynh bảo lãnh'),
('978-604-3', 'DG002', GETDATE(), N'Sách chuyên ngành'),
('978-604-4', 'DG003', GETDATE(), N'Mượn nghiên cứu'),
('978-604-5', 'DG004', GETDATE(), NULL);


-- 8. Nhập dữ liệu cho bảng Muon
INSERT INTO Muon (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan) VALUES
('978-604-1', 'CS001', 'DG001', '2024-03-20', '2024-04-03'),
('978-604-2', 'CS002', 'DG006', '2024-03-21', '2024-04-04'),
('978-604-3', 'CS003', 'DG002', '2024-03-22', '2024-04-05'),
('978-604-4', 'CS004', 'DG003', '2024-03-23', '2024-04-06'),
('978-604-5', 'CS005', 'DG004', '2024-03-24', '2024-04-07');


-- 9. Nhập dữ liệu cho bảng QuaTrinhMuon (Lịch sử đã trả hoặc đang mượn)
INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, NgayMuon, Ma_DocGia, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc, GhiChu) VALUES
('978-604-1', 'CS001', '2024-01-10', 'DG001', '2024-01-24', '2024-01-23', 5.00, 5.00, 50.00, N'Trả đúng hạn'),
('978-604-2', 'CS002', '2024-01-15', 'DG006', '2024-01-29', '2024-01-30', 5.00, 7.00, 50.00, N'Trễ 1 ngày, phạt 2$'),
('978-604-3', 'CS003', '2024-02-01', 'DG002', '2024-02-15', '2024-02-14', 10.00, 10.00, 100.00, N'Tình trạng tốt'),
('978-604-4', 'CS004', '2024-02-10', 'DG003', '2024-02-24', '2024-02-24', 5.00, 5.00, 50.00, NULL),
('978-604-5', 'CS005', '2024-03-01', 'DG004', '2024-03-15', '2024-03-15', 8.00, 8.00, 80.00, N'Sách ngoại văn');


-- 1. Có bao nhiêu phiếu mượn sách thư viện trong năm qua?
-- 2. Cho biết danh sách số ngày mượn sách của các lần đã mượn sách?
-- 3. Cho biết danh sách số ngày mượn sách trung bình của các lần đã mượn sách?
-- 4. Cho biết danh sách những phiếu mượn trả sách quá hạn?
-- 5. Cho biết danh sách (độc giả, sách được mượn) những độc giả đã được mượn quá hạn?
-- 6. Cho biết danh sách (độc giả, sách được mượn) những độc giả đã và đang được mượn quá han?
-- 7. Số lượng sách nhiều nhất mà một người đã mượn?
-- 8. Bạn dọc mượn sách nhiều nhắt là ngày nào? 
-- 9. Tính tống số tiền mượn đã trả trong quá trình mượn sách
-- 10. Tìm số cuốn sách có tình trạng "Hỏng"
-- 11. Tính số cuốn sách trung bình mỗi độc giả đã mượn
-- 12. Tìm số lượng sách của từng tác giả
-- 13. Tìm các tác giả có hơn 5 đầu sách trong thư viện
-- 14. Tìm các độc giả đã mượn hơn 3 cuốn sách
-- 15. Tìm các đầu sách có hơn 2 cuốn sách bị hỏng
-- 16. Tìm độc giả đã đăng ký mượn hơn 2 cuốn sách
-- 17. Tìm các ngày có hơn 3 lượt mượn sách
-- 18. Tìm độc giả trẻ nhất
-- 19. Tìm đầu sách có số lượng sách ít nhất
-- 20. Tìm độc giả chưa từng mượn sách
-- 21. Tìm sách chưa được ai đăng ký mượn
-- 22. Tìm độc giả đã mượn nhưng chưa trả sách
-- 23. Lấy danh sách tất cả độc giả cả người lớn và trẻ em
-- 24. Lấy danh sách độc gỉa vừa đăng ký vừa mượn sách
-- 25. Lấy danh sách độc giả chỉ đăng ký nhưng chưa mượn sách
-- 26. Cập nhật tình trạng sách bị hỏng thành "Đang sửa"
-- 28. Xóa tất cá độc giả chưa từng mượn sách
-- 27. Gia hạn thêm 1 năm cho tất cả độc giả người lớn
-- 30. Xóa tất cả sách đã bị hỏng
-- 29. Cập nhật số điện thoại của độc giả có mã số là 5 thành 0909123456
-- 31. Tìm độc giả đã mượn tất cả các đầu sách
-- 32. Tìm độc giả đã đăng ký mượn tất cả các đầu sách
-- 33. Liệt kê top 5 bạn dọc mượn sách nhiều nhất trong năm 2024
-- 34. Liệt kê thể loại sách được mượn nhiều nhất trong quý 1 năm 2025
-- 35. Tìm bạn đọc trả sách trễ nhiều lần nhất (Tính số lần NgayTra > HanTra cho từng bạn đọc, lọc ra top đầu COUNT(CASE WHEN ... THEN 1 END))
-- 36.Tìm những bạn dọc mượn đù tất cá sách cùa tác giả "Nguyễn Nhật Ánh"
-- 37.Danh sách bạn đọc chưa mượn quyển sách nào kể từ khi đăng ký

/*
Bài tập chương 6
Bài 4.
Sử dụng Cơ sở dữ liệu Quản lý thư viện.
Tạo các store procedure như sau
*/

/*
4.1. Xem thông tin độc giả
Tên: sp_ThongtinDocGia
Nội dung: Liệt kê những thông tin của độc giả tương ứng với mã độc giả. 
Nếu độc già là người lốn thì hiền thị thông tin độc giả + thông tin trong bàng người lớn.
Nếu độc giả là trẻ em thì hiền thị những thông tin độc giả + thông tin của bảng trẻ em.
Các bước thực hiện
[1] Kiểm tra độc giả này thuộc loại người lớn hay trẻ em.
[2] Nếu là người lớn thì in những thông tin liên quan đên độc giả này, gôm có: thông tin độc giả + thông tín người lớn.
[3] Nếu là trẻ em thì in những thông tin liên quan đến độc giả này, gồm có: thông tin độc giả + thông tin trẻ em.
*/

CREATE OR ALTER PROC sp_ThongtinDocGia
    @Ma_DocGia varchar(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        SELECT dg.*, nl.SoNha, nl.Duong, nl.Quan, nl.DienThoai, nl.HanSuDung, 'Nguoi Lon' as LoaiDocGia
        FROM DocGia dg JOIN NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
        WHERE dg.Ma_DocGia = @Ma_DocGia;
    END
    ELSE IF EXISTS (SELECT 1 FROM TreEm WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        SELECT dg.*, te.Ma_DocGia_NguoiLon as NguoiBaoLanh, 'Tre Em' as LoaiDocGia
        FROM DocGia dg JOIN TreEm te ON dg.Ma_DocGia = te.Ma_DocGia
        WHERE dg.Ma_DocGia = @Ma_DocGia;
    END
    ELSE
        PRINT N'Không tìm thấy độc giả này!';
END

/*
4.2. Thông tin đầu sách
Tên: sp_ThongtinDausach
Nội dung: Liệt kê những thông tin của đầu sách, thông tin tựa sách và số lượng sách hiện chưa được mượn của một đầu sách cụ thể (ISBN).
*/

CREATE OR ALTER PROC sp_ThongtinDausach
    @ISBN varchar(25)
AS
BEGIN
    SELECT 
        ds.ISBN, ts.TuaSach, ts.TacGia, ds.NgonNgu, ds.TrangThai,
        (SELECT COUNT(*) FROM CuonSach cs WHERE cs.ISBN = ds.ISBN 
         AND NOT EXISTS (SELECT 1 FROM Muon m WHERE m.ISBN = cs.ISBN AND m.Ma_CuonSach = cs.Ma_CuonSach)
        ) AS SoLuongSanSang
    FROM DauSach ds JOIN TuaSach ts ON ds.Ma_TuaSach = ts.Ma_TuaSach
    WHERE ds.ISBN = @ISBN;
END

/*
4.3. Liệt kê những độc giả người lớn đang mượn sách
Tên: sp_ThongtinNguoilonDangmuon
Nội dung: Liệt kê những thông tin của tất cá độc giả đang mượn sách của thư viện
*/

CREATE OR ALTER PROC sp_ThongtinNguoilonDangmuon
AS
BEGIN
    SELECT DISTINCT dg.*, nl.DienThoai
    FROM DocGia dg 
    JOIN NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
    JOIN Muon m ON dg.Ma_DocGia = m.Ma_DocGia;
END

/*
4.4. Liệt kê những độc giả người lớn đang mượn sách quá hạn
Tên: sp_ThongtinNguoilonQuahan
Nội dụng: Liệt kê những thông tin cùa tất cá độc giả đang mượn sách của thư viện đang trong tình trạng mượn quá hạn 14 ngày.
*/

CREATE OR ALTER PROC sp_ThongtinNguoilonQuahan
AS
BEGIN
    SELECT DISTINCT dg.*, m.NgayHetHan, DATEDIFF(day, m.NgayHetHan, GETDATE()) AS SoNgayTre
    FROM DocGia dg 
    JOIN NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
    JOIN Muon m ON dg.Ma_DocGia = m.Ma_DocGia
    WHERE DATEDIFF(day, m.NgayHetHan, GETDATE()) > 14;
END

/*
4.5. Liệt kê những độc giả người lớn đang mượn sách có trẻ em cũng đang mượn sách
Tên: sp_DocGiaCoTreEmMuon
Nội dung: Liệt kê những những độc giả đang trong tình trạng mượn sách và những trè em độc giả này đang bảo lãnh cũng đang trong tình trạng mượn sách.
*/

CREATE OR ALTER PROC sp_DocGiaCoTreEmMuon
AS
BEGIN
    SELECT DISTINCT dg_nl.*
    FROM DocGia dg_nl
    JOIN Muon m_nl ON dg_nl.Ma_DocGia = m_nl.Ma_DocGia -- Người lớn đang mượn
    JOIN TreEm te ON dg_nl.Ma_DocGia = te.Ma_DocGia_NguoiLon
    JOIN Muon m_te ON te.Ma_DocGia = m_te.Ma_DocGia; -- Trẻ em được bảo lãnh cũng đang mượn
END

/*
4.6. Cập nhật trạng thái của đầu sách
Nội dung: Cập nhật trạng thái của một đầu sách cu thế tương ứng với isbn: nếu đầu sách không còn cuốn sách nào trong thư viện thì tình trạng là no; 
nếu đầu sách còn một quyền sách trở lên thì tình trạng là 'Y'
Tên: sp_CapnhatTrangthaiDausach
Bước thực hiện 
[1] Xác định số cuốn sách hiện giờ còn trong thư viện của đầu sách có isbn.
[2] Nếu không còn quyển nào: Cập nhật tình trạng đầu sách là no.
[3] Nếu còn ít nhắt 1 quyển thì: Cập nhật tình trạng đầu sách là yes.
*/

CREATE OR ALTER PROC sp_CapnhatTrangthaiDausach
    @ISBN varchar(25)
AS
BEGIN
    DECLARE @SoLuongCon int;
    SELECT @SoLuongCon = COUNT(*) FROM CuonSach cs 
    WHERE cs.ISBN = @ISBN AND NOT EXISTS (SELECT 1 FROM Muon m WHERE m.ISBN = cs.ISBN AND m.Ma_CuonSach = cs.Ma_CuonSach);

    IF @SoLuongCon = 0
        UPDATE DauSach SET TrangThai = 'No' WHERE ISBN = @ISBN;
    ELSE
        UPDATE DauSach SET TrangThai = 'Yes' WHERE ISBN = @ISBN;
END

/*
4.7. Thêm tựa sách mới
Tên: sp_ThemTuaSach
Nội dung: Thêm tựa sách vào hệ thống với điều kiên là bộ 3 thuộc tính tựa sách, tác giả, tóm tắt phải khác với các bộ trong bảng tựa sách đã có.
Và phải bảo đảm quy định QĐ-1 được tuân thủ.
Bước thưc hiện 
[1] Xác định mã tựa sách sẽ cấp cho tựa sách này thỏa quy định QĐ-1
[2] Kiểm tra phải có ít nhất 1 trong 3 thuộc tính tựa sách, tác giả, tóm tắt khác với các bộ trong bảng tựa sách đã có.
[3] Nếu thỏa điều kiện này thì: Thêm vào tựa sách
[4] Nếu không thỏa điều kiện thì: Thông báo lỗi và chắm dứt stored procedure.
*/

CREATE OR ALTER PROC sp_ThemTuaSach
    @Ma_TuaSach varchar(50), @TuaSach nvarchar(50), @TacGia nvarchar(50), @TomTat nvarchar(500)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TuaSach WHERE TuaSach = @TuaSach AND TacGia = @TacGia AND TomTat = @TomTat)
    BEGIN
        PRINT N'Lỗi: Tựa sách này đã tồn tại (trùng Tên, Tác giả, Tóm tắt).';
        RETURN;
    END
    
    INSERT INTO TuaSach (Ma_TuaSach, TuaSach, TacGia, TomTat)
    VALUES (@Ma_TuaSach, @TuaSach, @TacGia, @TomTat);
    PRINT N'Thêm tựa sách thành công!';
END


/*
4.8. Thêm cuốn sách mới
Tên: sp_ThemCuonSach
Nôi dung: Thêm cuốn sách vào hệ thống với điều kiện phải bảo đảm quy định QĐ-2 được tuân thủ. Và phải cập nhất trạng thái của đầu sách.
Bước thưc hiện 
[1] Kiểm tra mã isbn nếu không tồn tại thì thông báo & return. 
[2] Xác định mã cuôn sách sẽ cấp cho cuồn sách này thỏa quy định QĐ-2. 
[3] Thêm cuốn sách mới với mã cuồn sách đã xác định và tình trạng là yes. 
[4] Thay đối trạng thái của đầu sách là yes.
*/

CREATE OR ALTER PROC sp_ThemCuonSach
    @ISBN varchar(25), @Ma_CuonSach varchar(50), @TinhTrang nvarchar(10)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM DauSach WHERE ISBN = @ISBN)
    BEGIN
        PRINT N'Lỗi: ISBN không tồn tại trong Đầu Sách.';
        RETURN;
    END

    INSERT INTO CuonSach (ISBN, Ma_CuonSach, TinhTrang) VALUES (@ISBN, @Ma_CuonSach, @TinhTrang);
    EXEC sp_CapnhatTrangthaiDausach @ISBN;
    PRINT N'Thêm cuốn sách thành công!';
END

/*
4.9. Thêm độc giả người lớn
Tên: sp_ThemNguoilon
Nội dung: thêm thông tin mới vào bảng dữ liệu người lớn và bảng dữ liệu độc giả của hệ thống.
Bước thực hiện
[1] Xác định mã độc giả sẽ cấp cho dộc giả người lớn này thỏa quy định QĐ-2.
[2] Thêm một bộ dữ liệu vào bảng độc giả.
[3] Kiểm tra tuồi của độc giả này có đủ 18 tuổi.
[4] Nếu không đủ tuổi: Thông báo lỗi và chầm dứt stored procedure. 
[5] Nếu đủ tuổi thì thêm một bộ dữ liệu vào bảng người lớn.
*/

CREATE OR ALTER PROC sp_ThemNguoilon
    @Ma_DocGia varchar(50), @Ho nvarchar(30), @TenLot nvarchar(30), @Ten nvarchar(30), @NgaySinh date,
    @SoNha varchar(20), @Duong nvarchar(50), @Quan tinyint, @DienThoai varchar(12), @HanSuDung date
AS
BEGIN
    IF DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
    BEGIN
        PRINT N'Lỗi: Độc giả chưa đủ 18 tuổi để làm người lớn.';
        RETURN;
    END

    BEGIN TRAN
        BEGIN TRY
            INSERT INTO DocGia VALUES (@Ma_DocGia, @Ho, @TenLot, @Ten, @NgaySinh);
            INSERT INTO NguoiLon VALUES (@Ma_DocGia, @SoNha, @Duong, @Quan, @DienThoai, @HanSuDung);
            COMMIT TRAN
            PRINT N'Thêm người lớn thành công!';
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN
            PRINT N'Lỗi hệ thống khi thêm người lớn!';
        END CATCH
END

/*
4.10. Thêm độc giả trẻ em
Tên: sp_ThemTreEm
Nội dung: thêm thông tin mới vào bằng dữ liệu trẻ em và bảng dữ liệu độc giả trong hệ thống.
Bước thực hiện 
[1] Xác định mã độc giả sẽ cấp cho độc giả trẻ em này thỏa quy định QĐ-2.
[2] Thêm một bộ dữ liệu vào bảng độc giả.
[3] Đếm số trẻ em của độc giả người lớn bảo lãnh trẻ em mới này.
[4] Kiểm tra, nếu không thỏa quy định QĐ-3 thì:
	[4.1] Thông báo lỗi.
	[4.2] Chầm dứt stored procedure.
[5] Nếu thỏa quy định QĐ-3 thì thêm một bộ dữ liệu vào bảng trẻ em.
*/

CREATE PROC sp_ThemTreEm
    @Ma_DocGia varchar(50),
    @Ho nvarchar(30),
    @TenLot nvarchar(30),
    @Ten nvarchar(30),
    @NgaySinh date,
    @Ma_DocGia_NguoiLon varchar(50)
AS
BEGIN
    -- Kiểm tra họ tên, ngày sinh có trùng với dữ liệu đã có trong bảng DocGia hay chưa
    IF EXISTS (SELECT 1 FROM DocGia 
               WHERE Ho = @Ho AND TenLot = @TenLot AND Ten = @Ten AND NgaySinh = @NgaySinh)
    BEGIN
        PRINT N'Lỗi: Độc giả có cùng Họ tên và Ngày sinh này đã tồn tại!';
        RETURN;
    END

    -- Kiểm tra người lớn bảo lãnh có tồn tại trong bảng NguoiLon không
    IF NOT EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia_NguoiLon)
    BEGIN
        PRINT N'Lỗi: Mã người lớn bảo lãnh không tồn tại!';
        RETURN;
    END

    -- Kiểm tra QĐ-3 (Giả sử quy định mỗi người lớn bảo lãnh tối đa 2 trẻ em)
    DECLARE @SoLuongTreEm int;
    SELECT @SoLuongTreEm = COUNT(*) FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia_NguoiLon;

    IF @SoLuongTreEm >= 2
    BEGIN
        PRINT N'Lỗi QĐ-3: Người lớn này đã bảo lãnh tối đa 2 trẻ em, không thể bảo lãnh thêm.';
        RETURN;
    END

    -- Thực hiện thêm dữ liệu (Sử dụng Transaction để đảm bảo tính toàn vẹn)
    BEGIN TRY
        BEGIN TRAN
            -- Thêm vào bảng Độc Giả
            INSERT INTO DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
            VALUES (@Ma_DocGia, @Ho, @TenLot, @Ten, @NgaySinh);

            -- Thêm vào bảng Trẻ Em
            INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon)
            VALUES (@Ma_DocGia, @Ma_DocGia_NguoiLon);

        COMMIT TRAN
        PRINT N'Thêm độc giả trẻ em thành công!';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        PRINT N'Lỗi hệ thống: ' + ERROR_MESSAGE();
    END CATCH
END

/*
4.11. Xóa độc giả
Tên: sp_XoaDocGia
Nội dung: Xóa toàn bộ thông tin liên quan đến độc giả này gồm có: quá trình mượn, đăng ký, mượn, độc giả, 
người lớn (nếu độc giả này là người lớn), 
trẻ em (nếu độc giả là trè em hay độc giả người lớn có bảo lãnh trẻ em). 
Chỉ thực hiện xóa khi độc giả không đang mượn sách.
Bước thực hiện
[1] Kiểm tra xem độc giả có tồn tại hay không.
Nếu độc giả không tồn tại thì thông báo không tôn tại độc giả và kết thúc. 
[2] Kiểm tra độc giả có đang mượng sách hay khôn. Nếu độc giả có mượn sách thì thông báo không thể xóa được và kết thúc. 
[3] Kiểm tra độc giả này là độc giả người lớn hay trẻ em: 
	[3.1] Nếu độc giả là người lớn:
		[3.1.1] Kiểm tra xem độc giả có bảo lãnh trẻ em nào hay không?
		[3.1.2] Nếu độc giả không bảo lãnh trẻ em thì xóa độc giả này. (Lưu ý: thứ tự xóa các bảng trên phải được tuần tự vì ràng buộc khóa ngoại.)
		[3.1.3] Ta phải xóa trên các bản nguoilon hoặc treem, bảng QuaTrinhMuon, bảng DangKy sau đó mới được xóa trong bảng DocGia.
			[3.1.3.1] Xóa trong bảng NguoiLon, bảng QuaTrinhMuon, bảng DangKy, sau cùng là xóa trong bảng DocGia.
		[3.1.4] Nếu độc giả này có bảo lãnh trẻ em thì:
			[3.1.4.1] Tìm các trẻ em mà độc giả này bảo lãnh để xóa. Quá trình xóa làm theo các bước trên - gọi đệ quy.
Ghi chú: Trong quá trình xóa trẻ em, nếu xảy ra trường hợp trẻ em này đang mượn sách thì không thể xóa được. 
Khi đó phải rollback transaction và thông báo lỗi : "khong the xoa duoc nguoi lon vi tre em ma nguoi lon do bao lanh van con dang muon sach". 
(Vì vậy, gọi đệ quy nhờ xét giá trị return để biết có thành công hay không) 
			[3.1.4.2] Xóa trong bảng NguoiLon, bảng QuaTrinhMuon, bảng DangKy.
			[3.1.4.3] Sau cùng là xóa trong bảng DocGia
	[3.2] Nếu độc giả là tẻ em thì xóa trong bảng TreEm, bảng QuaTrinhMuon, bảng DangKy.
		[3.2.1] Xóa trong bảng TreEm, bảng QuaTrinhMuon, bảng DangKy. 
		[3.2.2] Sau cùng là xóa trong bảng DocGia
Ghi chú: Nếu trong lúc tạo khóa ngoại có sử dụng delete cascade thì ta chỉ cần xóa trong bảng DocGia và bảng NguoiLlon hay TreEm thì toàn bộ dữ liệu liên quan đên độc giả trong các bảng khác sẽ tự động được xóa. 
Trong hướng dẫn này, không cài delete cascade! 
*/

CREATE PROC sp_XoaDocGia
    @Ma_DocGia varchar(50)
AS
BEGIN
    -- Kiểm tra xem độc giả có tồn tại hay không 
    IF NOT EXISTS (SELECT 1 FROM DocGia WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Không tồn tại độc giả này.'; RETURN;
    END

    IF EXISTS (SELECT 1 FROM Muon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Độc giả đang mượn sách, không thể xóa!'; RETURN;
    END

    -- Kiểm tra nếu là người lớn có bảo lãnh trẻ em đang mượn sách
    IF EXISTS (SELECT 1 FROM TreEm te JOIN Muon m ON te.Ma_DocGia = m.Ma_DocGia WHERE te.Ma_DocGia_NguoiLon = @Ma_DocGia)
    BEGIN
        PRINT N'Không thể xóa người lớn vì trẻ em mà người lớn đó bảo lãnh vẫn còn đang mượn sách.'; RETURN;
    END

    BEGIN TRAN
    BEGIN TRY
        -- Xóa lịch sử trẻ em được bảo lãnh
        DELETE FROM QuaTrinhMuon WHERE Ma_DocGia IN (SELECT Ma_DocGia FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia);
        DELETE FROM DangKy WHERE Ma_DocGia IN (SELECT Ma_DocGia FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia);
        
        -- Xóa thông tin trẻ em do độc giả này bảo lãnh
        DECLARE @Kids TABLE (Ma_DocGia varchar(50));
        INSERT INTO @Kids SELECT Ma_DocGia FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia;
        DELETE FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia;
        DELETE FROM DocGia WHERE Ma_DocGia IN (SELECT Ma_DocGia FROM @Kids);

        -- Xóa bản thân độc giả
        DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM TreEm WHERE Ma_DocGia = @Ma_DocGia; -- Nếu bản thân là trẻ em
        DELETE FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM DocGia WHERE Ma_DocGia = @Ma_DocGia;

        COMMIT TRAN
        PRINT N'Xóa độc giả thành công!';
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
        PRINT N'Có lỗi xảy ra trong quá trình xóa!';
    END CATCH
END

-- Kiểm tra 

EXEC sp_XoaDocGia @Ma_DocGia = 'DG001';

SELECT * 
FROM DocGia 
WHERE Ma_DocGia = 'DG001';

/*
4.12. Mượn sách
Tên: sp_MuonSach
Nội dung: Kiểm tra cuốn sách cùng loại này có đang được mượn bởi độc giả này hay không. Nếu không, kiểm tra xem cuốn sách này còn quyền nào trong thư viện chưa được ai mượn không. Nếu được thì thực hiện việc mượn. 
Còn nếu không thì thực hiện việc đăng ký phải chú ý đảm bảo kiểm tra số lượng sách đang mượn của độc giả này. Nếu là độc giả người lớn thì phải thỏa quy định QĐ-4; nếu là độc giả trẻ em thì phải quy định QĐ-5.
Và đặc biệt đối với độc giả người lớn thì phải bảo đảm QĐ-6 cũng phải được tuân thủ.
Bước thực hiện
[1] Kiểm tra độc giả có đang mượn quyền sách cùng loại không"? Nếu có:
	[1.1] báo lỗi
	[1.2] return
[2] Nếu không: Kiểm tra số lượng sách độc giả đang mượn: 
	[2.1] Kiểm tra độc giả là người lớn hay trẻ em? Nếu là người lớn: tính tống số sách độc giả đang mượn và trẻ em do độc giả bảo lãnh mượn (nếu có). Nếu >= 5 thì: báo lỗi & return. 
	[2.2] Nếu là trẻ em: Tính số sách trẻ em đang mượn: 
		[2.2.1] Nếu < 1: tính số sách người lớn bảo lãnh cho trẻ em này: Nếu = 5 thì báo lỗi và return. Nếu = 1 thì báo lỗi và return.
[3] Kiểm tra có còn sách trong thư viện không?
	[3.1] Nếu còn:
		[3.1,1] Thêm một record vào bảng mượn
		[3.1.2] Cập nhật tình trạng cuốn sach
		[3.1.3] Cập nhật trạng thái đâu sách
		[3.1.4] Thông báo mượn sách thành công 
    [3.2] Nếu không còn thì thông báo cho độc giả chờ thêm một record vào bảng DangKy
*/

CREATE PROC sp_MuonSach
    @ISBN varchar(25),
    @Ma_DocGia varchar(50)
AS
BEGIN
    -- Kiểm tra độc giả có đang mượn cuốn sách cùng loại không
    IF EXISTS (SELECT 1 FROM Muon WHERE ISBN = @ISBN AND Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Lỗi: Độc giả đang mượn một cuốn sách cùng loại (ISBN).';
        RETURN;
    END

    -- Kiểm tra số lượng sách đang mượn
    DECLARE @SoSachDangMuon int;
    IF EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        SELECT @SoSachDangMuon = COUNT(*) FROM Muon 
        WHERE Ma_DocGia = @Ma_DocGia OR Ma_DocGia IN (SELECT Ma_DocGia FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia);
        
        IF @SoSachDangMuon >= 5
        BEGIN
            PRINT N'Lỗi: Vượt quá số lượng sách tối đa (5 cuốn).';
            RETURN;
        END
    END
    ELSE
    BEGIN
        SELECT @SoSachDangMuon = COUNT(*) FROM Muon WHERE Ma_DocGia = @Ma_DocGia;
        IF @SoSachDangMuon >= 1
        BEGIN
            PRINT N'Lỗi: Trẻ em chỉ được mượn tối đa 1 cuốn.';
            RETURN;
        END
    END

    -- Kiểm tra có còn sách trong thư viện không
    DECLARE @Ma_CuonSach varchar(50);
    
    -- Tìm cuốn sách có ISBN này mà hiện tại không có trong bảng Muon
    SELECT TOP 1 @Ma_CuonSach = cs.Ma_CuonSach 
    FROM CuonSach cs
    WHERE cs.ISBN = @ISBN 
      AND cs.Ma_CuonSach NOT IN (SELECT Ma_CuonSach FROM Muon WHERE ISBN = @ISBN);

    -- Thực hiện mượn hoặc đăng ký
    IF @Ma_CuonSach IS NOT NULL
    BEGIN
        BEGIN TRAN
            INSERT INTO Muon (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan)
            VALUES (@ISBN, @Ma_CuonSach, @Ma_DocGia, GETDATE(), DATEADD(day, 14, GETDATE()));
            EXEC sp_CapnhatTrangthaiDausach @ISBN;
        COMMIT TRAN
        PRINT N'Mượn sách thành công! Mã cuốn sách mượn được là: ' + @Ma_CuonSach;
    END
    ELSE
    BEGIN
        INSERT INTO DangKy (ISBN, Ma_DocGia, NgayDK) VALUES (@ISBN, @Ma_DocGia, GETDATE());
        PRINT N'Sách trong kho đã được mượn hết. Đã chuyển sang danh sách Đăng ký.';
    END
END

-- Kiểm tra 

EXEC sp_MuonSach @ISBN = '978-604-1', @Ma_DocGia = 'DG002'

SELECT * 
FROM DangKy

/*
4.13. Trả sách
Tên: sp_TraSach
Nội dung: Khi độc giả trả sách thì hệ thống phải chuyền thông tin mượn sang bảng quá trình mượn.
Bước thưc hiện:
[1] Xác định tiền phạt nếu trà quá hạn (= 1000 * số ngày trễ hạn)
[2] Thêm vào bảng quá trình mượn
[3] Xóa dữ liệu trong bảng mượn
*/

CREATE OR ALTER PROC sp_TraSach
    @ISBN varchar(25),
    @Ma_CuonSach varchar(50),
    @Ma_DocGia varchar(50)
AS
BEGIN
    DECLARE @NgayMuon datetime, @NgayHetHan datetime, @TienPhat decimal(5,2) = 0;
    
    SELECT @NgayMuon = NgayMuon, @NgayHetHan = NgayHetHan 
    FROM Muon WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia;

    IF @NgayMuon IS NULL
    BEGIN
        PRINT N'Không tìm thấy thông tin mượn!'; 
        RETURN;
    END

    -- Tính phạt nếu trễ (Giả sử 1$/ngày)
    IF GETDATE() > @NgayHetHan
        SET @TienPhat = DATEDIFF(day, @NgayHetHan, GETDATE()) * 1.00;

    BEGIN TRAN
    BEGIN TRY
        INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, NgayMuon, Ma_DocGia, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc)
        VALUES (@ISBN, @Ma_CuonSach, @NgayMuon, @Ma_DocGia, @NgayHetHan, GETDATE(), 5.00, 5.00 + @TienPhat, 50.00);

        DELETE FROM Muon WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia;
        
        COMMIT TRAN
        PRINT N'Trả sách thành công. Tiền phạt: ' + CAST(@TienPhat AS varchar(10));
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
        PRINT N'Lỗi quá trình trả sách!';
    END CATCH
END


/*
4.14. Tạo các trigger:
a. tg_delMuon:
Nội dung: Cập nhật tình trạng của cuôn sách là yes
b. tg_insMuon:
Nội dung: Cập nhật tình trạng của cuốn sách là no
c. tg_updCuonSach:
Nội dung: Khi thuộc tính tình trạng trên bảng cuốn sách được cập nhật thì trạng thái cúa đầu sách cũng được cập nhật theo.
d. Tg_themmoi:
Khi thêm mới hoặc sửa tên tác giả hoặc thêm/sửa một tựa sách thì in ra câu thông báo bằng Tiếng Việt 'Đã thêm mới'.
Gợi ý: Nên kiểm tra trigger đã tạo bằng khối lệnh để di liệu không bị thay đối, ví dụ:
begin tran
--khối lênh thêm,xóa,sứa
rollback/commit
e. Tg_suathongtin:
Khi sửa tên tác giả cho một (hoặc nhiều) tựa sách thì in ra:
Danh sách mã các tựa sách vừa được sửa.
Danh sách mã tựa sách vừa được sửa và tên tác giả mới.
Danh sách mã tưa sách vừra dược sửa và tên tác giả cũ.
Danh sách mã tựa sách vừa được sửa và tên tác giả cũ và tác giả mới.
Gợi ý: Câu lệnh insert into T select... from .. cho phép insert cùng lúc nhiều dòng dùng bảng Inserted hoặc/và Deleted)
Câu thông báo bằng Tiếng Việt: Vừa sửa thông tin của tựa sách có mã số xxx' với xxx là mã tựa sách vừa được sửa.
Gợi ý: Sử dụng cursor để duyệt qua các tựa sách được sửa trong bảng Inserted (hoặc Deleted)
*/

-- a. tg_delMuon: Cập nhật tình trạng cuốn sách là 'yes' khi trả (xóa dòng ở Muon)
CREATE OR ALTER TRIGGER tg_delMuon
ON Muon
AFTER DELETE
AS
BEGIN
    UPDATE CuonSach 
    SET TinhTrang = 'yes'
    FROM CuonSach cs JOIN deleted d ON cs.ISBN = d.ISBN AND cs.Ma_CuonSach = d.Ma_CuonSach;
END

-- b. tg_insMuon: Cập nhật tình trạng cuốn sách là 'no' khi mượn (thêm dòng ở Muon)
CREATE OR ALTER TRIGGER tg_insMuon
ON Muon
AFTER INSERT
AS
BEGIN
    UPDATE CuonSach 
    SET TinhTrang = 'no'
    FROM CuonSach cs JOIN inserted i ON cs.ISBN = i.ISBN AND cs.Ma_CuonSach = i.Ma_CuonSach;
END

-- c. tg_updCuonSach: Cập nhật trạng thái Đầu sách khi Cuốn sách thay đổi
CREATE OR ALTER TRIGGER tg_updCuonSach
ON CuonSach
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TinhTrang)
    BEGIN
        DECLARE @ISBN varchar(25);
        SELECT DISTINCT @ISBN = ISBN FROM inserted;
        EXEC sp_CapnhatTrangthaiDausach @ISBN;
    END
END

-- d. Tg_themmoi: Thông báo khi thêm/sửa Tựa sách hoặc Tác giả
CREATE OR ALTER TRIGGER Tg_themmoi
ON TuaSach
AFTER INSERT, UPDATE
AS
BEGIN
    PRINT N'Đã thêm mới';
END

-- e. Tg_suathongtin: In chi tiết khi sửa tên tác giả
CREATE OR ALTER TRIGGER Tg_suathongtin
ON TuaSach
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TacGia)
    BEGIN
        SELECT 
            N'Mã TS vừa sửa: ' + Ma_TuaSach AS ThongBao,
            N'Tác giả cũ: ' + d.TacGia AS Cu,
            N'Tác giả mới: ' + i.TacGia AS Moi
        FROM inserted i JOIN deleted d ON i.Ma_TuaSach = d.Ma_TuaSach;
        
        PRINT N'Vừa sửa...';
    END
END

/*
4.15. Tg_themtuasach
Khi thêm mới một tựa sách thì kiểm tra xem đã có tựa sách trùng tên với tựa sách vừa được thêm hay không:
Đưa ra thông báo vẫn cho insert.
Thông báo và không cho insert.
*/

CREATE OR ALTER TRIGGER Tg_themtuasach
ON TuaSach
INSTEAD OF INSERT
AS
BEGIN
    -- Kiểm tra xem tên Tựa sách định thêm đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM TuaSach t JOIN inserted i ON t.TuaSach = i.TuaSach)
    BEGIN
        PRINT N'Lỗi: Tựa sách này đã tồn tại trong hệ thống. Không thể thêm!';
    END
    ELSE
    BEGIN
        -- Nếu không trùng thì mới thực hiện Insert thực tế
        INSERT INTO TuaSach (Ma_TuaSach, TuaSach, TacGia, TomTat)
        SELECT Ma_TuaSach, TuaSach, TacGia, TomTat FROM inserted;
        PRINT N'Thêm tựa sách thành công!';
    END
END