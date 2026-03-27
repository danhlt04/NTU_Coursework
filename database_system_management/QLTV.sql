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

INSERT INTO DocGia VALUES
('DG01', N'Nguyen', N'Van', N'An', '1985-05-10'),
('DG02', N'Tran', N'Thi', N'Binh', '1990-03-15'),
('DG03', N'Le', N'Hoang', N'Nam', '1982-07-20'),
('DG04', N'Pham', N'Thi', N'Huong', '1978-09-01'),
('DG05', N'Vo', N'Minh', N'Tuan', '1988-12-12'),
('DG06', N'Dang', N'Ngoc', N'Mai', '1995-11-11'),
('DG07', N'Bui', N'Thanh', N'Long', '1983-02-02'),
('DG08', N'Do', N'Thi', N'Lan', '1992-06-06'),
('DG09', N'Ho', N'Van', N'Khanh', '1980-04-04'),
('DG10', N'Phan', N'Quoc', N'Hai', '1987-08-08'),
('DG11', N'Nguyen', N'Gia', N'Bao', '2012-03-03'),
('DG12', N'Tran', N'Ngoc', N'Anh', '2013-05-05'),
('DG13', N'Le', N'Minh', N'Khoa', '2014-07-07'),
('DG14', N'Pham', N'Hoang', N'Yen', '2015-09-09'),
('DG15', N'Vo', N'Thien', N'Phuc', '2016-10-10'),
('DG16', N'Dang', N'Bao', N'Chau', '2011-01-01'),
('DG17', N'Bui', N'Quoc', N'Bao', '2012-12-12'),
('DG18', N'Do', N'Gia', N'Han', '2013-11-11'),
('DG19', N'Ho', N'Minh', N'Tri', '2014-02-02'),
('DG20', N'Phan', N'Gia', N'Huy', '2015-04-04')

INSERT INTO NguoiLon VALUES
('DG01', '12A', N'Le Loi', 1, '0901000001', '2026-12-31'),
('DG02', '45B', N'Nguyen Trai', 3, '0901000002', '2026-12-31'),
('DG03', '78C', N'Tran Hung Dao', 5, '0901000003', '2026-12-31'),
('DG04', '90D', N'Hai Ba Trung', 2, '0901000004', '2026-12-31'),
('DG05', '11E', N'Pham Van Dong', 7, '0901000005', '2026-12-31'),
('DG06', '22F', N'Cach Mang Thang 8', 10, '0901000006', '2026-12-31'),
('DG07', '33G', N'Vo Van Tan', 4, '0901000007', '2026-12-31'),
('DG08', '44H', N'Dien Bien Phu', 8, '0901000008', '2026-12-31'),
('DG09', '55I', N'Ly Thuong Kiet', 6, '0901000009', '2026-12-31'),
('DG10', '66K', N'Nguyen Hue', 9, '0901000010', '2026-12-31')

INSERT INTO TreEm VALUES
('DG11', 'DG01'),
('DG12', 'DG01'),
('DG13', 'DG02'),
('DG14', 'DG03'),
('DG15', 'DG04'),
('DG16', 'DG05'),
('DG17', 'DG06'),
('DG18', 'DG07'),
('DG19', 'DG08'),
('DG20', 'DG09')

INSERT INTO TuaSach VALUES
('TS01', N'Lập trình C', N'Nguyen Van A', N'Cơ bản về lập trình C'),
('TS02', N'Cơ sở dữ liệu', N'Tran Thi B', N'Thiết kế và quản trị CSDL'),
('TS03', N'Mạng máy tính', N'Le Hoang C', N'Kiến thức networking'),
('TS04', N'Toán cao cấp', N'Pham Van D', N'Giải tích và đại số'),
('TS05', N'Vật lý đại cương', N'Vo Minh E', N'Vật lý nền tảng'),
('TS06', N'Hóa học cơ bản', N'Nguyen Thi F', N'Kiến thức hóa học'),
('TS07', N'Sinh học đại cương', N'Tran Van G', N'Giới thiệu sinh học'),
('TS08', N'Lập trình Java', N'Le Minh H', N'Java từ cơ bản đến nâng cao'),
('TS09', N'Python ứng dụng', N'Pham Thi I', N'Lập trình Python thực tế'),
('TS10', N'Kỹ năng mềm', N'Vo Thanh J', N'Phát triển kỹ năng cá nhân')

INSERT INTO DauSach VALUES
('ISBN01','TS01','Tiếng Việt',N'Mềm',N'Còn'),
('ISBN02','TS02','Tiếng Việt',N'Cứng',N'Còn'),
('ISBN03','TS03','Tiếng Anh',N'Mềm',N'Còn'),
('ISBN04','TS04','Tiếng Việt',N'Cứng',N'Còn'),
('ISBN05','TS05','Tiếng Việt',N'Mềm',N'Còn'),
('ISBN06','TS06','Tiếng Việt',N'Mềm',N'Còn'),
('ISBN07','TS07','Tiếng Việt',N'Cứng',N'Còn'),
('ISBN08','TS08','Tiếng Anh',N'Mềm',N'Còn'),
('ISBN09','TS09','Tiếng Anh',N'Cứng',N'Còn'),
('ISBN10','TS10','Tiếng Việt',N'Mềm',N'Còn'),
('ISBN11','TS01','Tiếng Anh',N'Cứng',N'Còn'),
('ISBN12','TS02','Tiếng Anh',N'Mềm',N'Còn'),
('ISBN13','TS03','Tiếng Việt',N'Cứng',N'Còn'),
('ISBN14','TS04','Tiếng Việt',N'Mềm',N'Còn'),
('ISBN15','TS05','Tiếng Anh',N'Cứng',N'Còn')

INSERT INTO CuonSach VALUES
('ISBN01','CS01',N'Tốt'),
('ISBN01','CS02',N'Tốt'),
('ISBN01','CS03',N'Hơi cũ'),
('ISBN02','CS01',N'Tốt'),
('ISBN02','CS02',N'Tốt'),
('ISBN02','CS03',N'Hơi cũ'),
('ISBN03','CS01',N'Tốt'),
('ISBN03','CS02',N'Tốt'),
('ISBN04','CS01',N'Tốt'),
('ISBN04','CS02',N'Hơi cũ'),
('ISBN05','CS01',N'Tốt'),
('ISBN05','CS02',N'Tốt'),
('ISBN06','CS01',N'Tốt'),
('ISBN06','CS02',N'Tốt'),
('ISBN07','CS01',N'Hơi cũ'),
('ISBN07','CS02',N'Tốt'),
('ISBN08','CS01',N'Tốt'),
('ISBN08','CS02',N'Tốt'),
('ISBN09','CS01',N'Tốt'),
('ISBN09','CS02',N'Hơi cũ'),
('ISBN10','CS01',N'Tốt'),
('ISBN10','CS02',N'Tốt'),
('ISBN11','CS01',N'Tốt'),
('ISBN11','CS02',N'Hơi cũ'),
('ISBN12','CS01',N'Tốt'),
('ISBN12','CS02',N'Tốt'),
('ISBN13','CS01',N'Tốt'),
('ISBN13','CS02',N'Hơi cũ'),
('ISBN14','CS01',N'Tốt'),
('ISBN14','CS02',N'Tốt'),
('ISBN15','CS01',N'Tốt'),
('ISBN15','CS02',N'Hơi cũ'),
('ISBN05','CS03',N'Tốt'),
('ISBN06','CS03',N'Hơi cũ'),
('ISBN07','CS03',N'Tốt'),
('ISBN08','CS03',N'Tốt'),
('ISBN09','CS03',N'Tốt'),
('ISBN10','CS03',N'Hơi cũ'),
('ISBN11','CS03',N'Tốt'),
('ISBN12','CS03',N'Tốt')

INSERT INTO DangKy VALUES
('ISBN01','DG01',GETDATE(),N'Đăng ký mượn'),
('ISBN02','DG02',GETDATE(),N'Đăng ký mượn'),
('ISBN03','DG03',GETDATE(),N'Đăng ký mượn'),
('ISBN04','DG04',GETDATE(),N'Đăng ký mượn'),
('ISBN05','DG05',GETDATE(),N'Đăng ký mượn'),
('ISBN06','DG06',GETDATE(),N'Đăng ký mượn'),
('ISBN07','DG07',GETDATE(),N'Đăng ký mượn'),
('ISBN08','DG08',GETDATE(),N'Đăng ký mượn'),
('ISBN09','DG09',GETDATE(),N'Đăng ký mượn'),
('ISBN10','DG10',GETDATE(),N'Đăng ký mượn'),
('ISBN11','DG11',GETDATE(),N'Đăng ký mượn'),
('ISBN12','DG12',GETDATE(),N'Đăng ký mượn'),
('ISBN13','DG13',GETDATE(),N'Đăng ký mượn'),
('ISBN14','DG14',GETDATE(),N'Đăng ký mượn'),
('ISBN15','DG15',GETDATE(),N'Đăng ký mượn'),
('ISBN01','DG16',GETDATE(),N'Đăng ký mượn'),
('ISBN02','DG17',GETDATE(),N'Đăng ký mượn'),
('ISBN03','DG18',GETDATE(),N'Đăng ký mượn'),
('ISBN04','DG19',GETDATE(),N'Đăng ký mượn'),
('ISBN05','DG20',GETDATE(),N'Đăng ký mượn')