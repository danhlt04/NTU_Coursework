using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data;
using WebQLBH.Models;

namespace WebQLBH.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> opts) : base(opts) { }

        // Dùng cho các bảng cho nhiều khóa (Primary Key)
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PhanQuyen>()
                .HasKey(c => new { c.MaQuyen, c.MaNV });

            modelBuilder.Entity<CTMuaHang>()
                .HasKey(c => new { c.MaDMH, c.MaSP });

            modelBuilder.Entity<CTBanHang>()
                .HasKey(c => new { c.MaDBH, c.MaSP });
        }

        //1. Lập trình các hàm thao tác trên bảng DONVITINH 
        public DbSet<DonViTinh> DonViTinhs { get; set; }

        public int DonViTinh_Them(DonViTinh dvt)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL DVT_Them
            //bắt buộc phải trùng tên các thuộc tính trong lớp DonViTinh.cs 
            //tương ứng ở thư mục Models 
          
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DVT_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDVT", dvt.TenDVT));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int DonViTinh_Sua(DonViTinh dvt) 
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL DVT_Sua
            //bắt buộc phải trùng tên các thuộc tính trong lớp DonViTinh.cs 
            //tương ứng ở thư mục Models 
       
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DVT_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDVT", dvt.MaDVT));
            cmd.Parameters.Add(new SqlParameter("@TenDVT", dvt.TenDVT));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int DonViTinh_Xoa(byte MaDVT) 
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL DVT_Xoa
            //bắt buộc phải trùng tên các thuộc tính trong lớp DonViTinh.cs 
            //tương ứng ở thư mục Models 

            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DVT_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDVT", MaDVT));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<DonViTinh> DonViTinh_DS()
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL DVT_DS
            //bắt buộc phải trùng tên các thuộc tính trong lớp DonViTinh.cs 
            //tương ứng ở thư mục Models 
            return DonViTinhs.FromSqlRaw("EXEC DVT_DS").ToList();
        }

        public DonViTinh? DonViTinh_CT(byte MaDVT)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL DVT_CT
            //bắt buộc phải trùng tên các thuộc tính trong lớp DonViTinh.cs 
            //tương ứng ở thư mục Models 
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaDVT", MaDVT)
            };

            return DonViTinhs.FromSqlRaw("EXEC DVT_CT @MaDVT", p).ToList().FirstOrDefault();
        }



        //2. Lập trình các hàm thao tác trên bảng NHOMSANPHAM
        public DbSet<NhomSanPham> NhomSanPhams { get; set; }

        public int NhomSP_Them(NhomSanPham nsp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL NSP_Them
            //bắt buộc phải trùng tên các thuộc tính trong lớp NhomSanPham.cs 
            //tương ứng ở thư mục Models 
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NSP_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenNSP", nsp.TenNSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int NhomSP_Sua(NhomSanPham nsp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL NSP_Sua
            //bắt buộc phải trùng tên các thuộc tính trong lớp NhomSanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NSP_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNSP", nsp.MaNSP));
            cmd.Parameters.Add(new SqlParameter("@TenNSP", nsp.TenNSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int NhomSP_Xoa(byte MaNSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL NSP_Xoa
            //bắt buộc phải trùng tên các thuộc tính trong lớp NhomSanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NSP_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNSP", MaNSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<NhomSanPham> NhomSanPham_DS()
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL NSP_DS
            //bắt buộc phải trùng tên các thuộc tính trong lớp NhomSanPham.cs 
            //tương ứng ở thư mục Models
            return NhomSanPhams.FromSqlRaw("EXEC NSP_DS").ToList();
        }

        public NhomSanPham? NhomSP_CT(byte MaNSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL NSP_CT
            //bắt buộc phải trùng tên các thuộc tính trong lớp NhomSanPham.cs 
            //tương ứng ở thư mục Models
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaNSP", MaNSP)
            };
            return NhomSanPhams.FromSqlRaw("EXEC NSP_CT @MaNSP", p).ToList().FirstOrDefault();
        }


        //3. Lập trình các hàm thao tác trên bảng LOAISANPHAM
        public DbSet<LoaiSanPham> LoaiSanPhams { get; set; }

        public int LoaiSP_Them(LoaiSanPham lsp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL LSP_Them
            //bắt buộc phải trùng tên các thuộc tính trong lớp LoaiSanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "LSP_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenLSP", lsp.TenLSP));
            cmd.Parameters.Add(new SqlParameter("@MaNSP", lsp.MaNSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int LoaiSP_Sua(LoaiSanPham lsp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL LSP_Sua
            //bắt buộc phải trùng tên các thuộc tính trong lớp LoaiSanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "LSP_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaLSP", lsp.MaLSP));
            cmd.Parameters.Add(new SqlParameter("@TenLSP", lsp.TenLSP));
            cmd.Parameters.Add(new SqlParameter("@MaNSP", lsp.MaNSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public int LoaiSP_Xoa(short MaLSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL LSP_Xoa
            //bắt buộc phải trùng tên các thuộc tính trong lớp LoaiSanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "LSP_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaLSP", MaLSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<LoaiSanPham> LoaiSanPham_DS()
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL LSP_DS
            //bắt buộc phải trùng tên các thuộc tính trong lớp LoaiSanPham.cs 
            //tương ứng ở thư mục Models
            // return LoaiSanPhams.FromSqlRaw("EXEC LSP_DS").ToList();

            var dsLoaiSP = LoaiSanPhams.FromSqlRaw("EXEC LSP_DS").ToList();
            
            foreach(var item in dsLoaiSP)
            {
                item.NhomSP = NhomSP_CT(item.MaNSP);
            }

            return dsLoaiSP;
        }

        public LoaiSanPham? LoaiSP_CT(short MaLSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL LSP_CT
            //bắt buộc phải trùng tên các thuộc tính trong lớp LoaiSanPham.cs 
            //tương ứng ở thư mục Models
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaLSP", MaLSP)
            };

            var loaiSP = LoaiSanPhams.FromSqlRaw("EXEC LSP_CT @MaLSP", p).ToList().FirstOrDefault();

            loaiSP.NhomSP = NhomSP_CT(loaiSP.MaNSP);

            return loaiSP;
        }


        //4. Lập trình các hàm thao tác trên bảng CTSANPHAM
        public DbSet<SanPham> SanPhams { get; set; }

        public int SanPham_Them(SanPham sp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL CTSP_Them
            //bắt buộc phải trùng tên các thuộc tính trong lớp SanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTSP_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenSP", sp.TenSP));
            cmd.Parameters.Add(new SqlParameter("@DonGia", sp.DonGia));
            cmd.Parameters.Add(new SqlParameter("@AnhSP", sp.AnhSP ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MoTaTT", sp.MoTaTT ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@ThongTinCT", sp.ThongTinCT ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MaLSP", sp.MaLSP));
            cmd.Parameters.Add(new SqlParameter("@MaDVT", sp.MaDVT));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int SanPham_Sua(SanPham sp)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL CTSP_Sua
            //bắt buộc phải trùng tên các thuộc tính trong lớp SanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTSP_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaSP", sp.MaSP));
            cmd.Parameters.Add(new SqlParameter("@TenSP", sp.TenSP));
            cmd.Parameters.Add(new SqlParameter("@DonGia", sp.DonGia));
            cmd.Parameters.Add(new SqlParameter("@AnhSP", sp.AnhSP ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MoTaTT", sp.MoTaTT ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@ThongTinCT", sp.ThongTinCT ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MaLSP", sp.MaLSP));
            cmd.Parameters.Add(new SqlParameter("@MaDVT", sp.MaDVT));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int SanPham_Xoa(string MaSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL CTSP_Xoa
            //bắt buộc phải trùng tên các thuộc tính trong lớp SanPham.cs 
            //tương ứng ở thư mục Models
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTSP_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public List<SanPham> SanPham_DS()
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL CTSP_DS
            //bắt buộc phải trùng tên các thuộc tính trong lớp SanPham.cs 
            //tương ứng ở thư mục Models
            var dsSP = SanPhams.FromSqlRaw("EXEC CTSP_DS").ToList();

            foreach(var item in dsSP)
            {
                item.LSP = LoaiSP_CT(item.MaLSP);
            }

            foreach(var item in dsSP)
            {
                item.DVT = DonViTinh_CT(item.MaDVT);
            }

            return dsSP;
        }

        public SanPham? SanPham_CT(string MaSP)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL CTSP_CT
            //bắt buộc phải trùng tên các thuộc tính trong lớp SanPham.cs 
            //tương ứng ở thư mục Models
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaSP", MaSP)
            };

            var sanPham = SanPhams.FromSqlRaw("EXEC CTSP_CT @MaSP", p).ToList().FirstOrDefault();
            sanPham.LSP = LoaiSP_CT(sanPham.MaLSP);
            sanPham.DVT = DonViTinh_CT(sanPham.MaDVT);

            return sanPham;
        }


        //5. Thao tác trên bảng PHONGBAN
        public DbSet<PhongBan> PhongBans { get; set; }
        
        public List<PhongBan> PhongBan_DS()
        {
            return PhongBans.FromSqlRaw("EXEC PB_DS").ToList();
        }
        
        public PhongBan PhongBan_CT(byte MaPB)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaPB", MaPB)
            };
            return PhongBans.FromSqlRaw("EXEC PB_CT @MaPB", p).ToList().FirstOrDefault();
        }
        
        public int PhongBan_Them(PhongBan pb)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PB_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenPB", pb.TenPB ?? (object)DBNull.Value));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }
        
        public int PhongBan_Sua(PhongBan pb)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PB_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaPB", pb.MaPB));
            cmd.Parameters.Add(new SqlParameter("@TenPB", pb.TenPB ?? (object)DBNull.Value));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
        public int PhongBan_Xoa(byte MaPB)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PB_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaPB", MaPB));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
        
        //6. Thao tác trên bảng NHANVIEN
        public DbSet<NhanVien> NhanViens { get; set; }
        
        public List<NhanVien> NhanVien_DS()
        {
            var dsNhanVien = NhanViens.FromSqlRaw("EXEC NV_DS").ToList();
            var dsPB = PhongBan_DS().ToDictionary(p => p.MaPB);

            foreach (var item in dsNhanVien)
            {
                item.PB = PhongBan_CT(item.MaPB);
            }
            return dsNhanVien;
        }

        public NhanVien? NhanVien_CT(byte MaNV)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaNV", MaNV)
            };
            var nhanVien = NhanViens.FromSqlRaw("EXEC NV_CT @MaNV", p).ToList().FirstOrDefault();
            nhanVien.PB = PhongBan_CT(nhanVien.MaPB);
            return nhanVien;
        }
        
        public int NhanVien_Them(NhanVien nv)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@HoNV", nv.HoNV));
            cmd.Parameters.Add(new SqlParameter("@TenNV", nv.TenNV));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", nv.DienThoai));
            cmd.Parameters.Add(new SqlParameter("@Email", nv.Email));
            cmd.Parameters.Add(new SqlParameter("@TenDN", nv.TenDN));
            cmd.Parameters.Add(new SqlParameter("@AnhNV", nv.AnhNV ?? (object)DBNull.Value)); 
            cmd.Parameters.Add(new SqlParameter("@MaPB", nv.MaPB));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
        
        public int NhanVien_Sua(NhanVien nv)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNV", nv.MaNV));
            cmd.Parameters.Add(new SqlParameter("@HoNV", nv.HoNV));
            cmd.Parameters.Add(new SqlParameter("@TenNV", nv.TenNV));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", nv.DienThoai));
            cmd.Parameters.Add(new SqlParameter("@Email", nv.Email));
            cmd.Parameters.Add(new SqlParameter("@TenDN", nv.TenDN));
            cmd.Parameters.Add(new SqlParameter("@AnhNV", nv.AnhNV ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MaPB", nv.MaPB));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
       
        public int NhanVien_Xoa(byte MaNV)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNV", MaNV));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
        
        public byte NhanVien_DangNhap(string TenDN, string MatKhau) //Trả về Mã nhân viên nếu đăng nhập thành công
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_DN";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            cmd.Parameters.Add(new SqlParameter("@MatKhau", MatKhau));
            Database.OpenConnection();
            var reader = cmd.ExecuteReader();
            byte maNV = 0;
            if (reader.Read())//Nếu có dữ liệu để đọc
            {
                maNV = byte.Parse(reader["MaNV"].ToString());
            }
            Database.CloseConnection();
            return maNV;
        }
        
        public int NhanVien_DoiMatKhau(string TenDN, string MatKhauCu, string MatKhauMoi)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_DMK";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            cmd.Parameters.Add(new SqlParameter("@MatKhauCu", MatKhauCu));
            cmd.Parameters.Add(new SqlParameter("@MatKhauMoi", MatKhauMoi));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }
        
        public int NhanVien_ResetMatKhau(string TenDN)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NV_ReMK";  
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }


        //7. Lập trình các hàm thao tác trên bảng TINH
        public DbSet<Tinh> Tinhs { get; set; }

        public int Tinh_Them(string MaTinh, string TenTinh)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL Tinh_Them
            //bắt buộc phải trùng tên các thuộc tính trong lớp Tinh.cs 
            //tương ứng ở thư mục Models

            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Tinh_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaTinh", MaTinh));
            cmd.Parameters.Add(new SqlParameter("@TenTinh", TenTinh));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int Tinh_Sua(string MaTinh, string TenTinh)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL Tinh_Sua
            //bắt buộc phải trùng tên các thuộc tính trong lớp Tinh.cs 
            //tương ứng ở thư mục Models

            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Tinh_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaTinh", MaTinh));
            cmd.Parameters.Add(new SqlParameter("@TenTinh", TenTinh));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int Tinh_Xoa(string MaTinh)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL Tinh_Xoa
            //bắt buộc phải trùng tên các thuộc tính trong lớp Tinh.cs 
            //tương ứng ở thư mục Models

            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Tinh_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaTinh", MaTinh));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;

        }

        public List<Tinh> Tinh_DS()
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL Tinh_DS
            //bắt buộc phải trùng tên các thuộc tính trong lớp Tinh.cs 
            //tương ứng ở thư mục Models
            // return LoaiSanPhams.FromSqlRaw("EXEC Tinh_DS").ToList();

            return Tinhs.FromSqlRaw("EXEC Tinh_DS").ToList();
        }

        public Tinh? Tinh_CT(string MaTinh)
        {
            //Tên mỗi cột trong thủ tục lưu trữ SQL Tinh_CT
            //bắt buộc phải trùng tên các thuộc tính trong lớp Tinh.cs 
            //tương ứng ở thư mục Models
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaTinh", MaTinh)
            };

            return Tinhs.FromSqlRaw("EXEC Tinh_CT @MaTinh", p).ToList().FirstOrDefault();
        }


        //8. Lập trình các hàm thao tác trên bảng XAPHUONG
        public DbSet<XaPhuong> XaPhuongs { get; set; }

        public int XaPhuong_Them(string MaXP, string TenXP, string MaTinh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "XP_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaXP", MaXP));
            cmd.Parameters.Add(new SqlParameter("@TenXP", TenXP));
            cmd.Parameters.Add(new SqlParameter("@MaTinh", MaTinh));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int XaPhuong_Sua(string MaXP, string TenXP, string MaTinh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "XP_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaXP", MaXP));
            cmd.Parameters.Add(new SqlParameter("@TenXP", TenXP));
            cmd.Parameters.Add(new SqlParameter("@MaTinh", MaTinh));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int XaPhuong_Xoa(string MaXP)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "XP_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaXP", MaXP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;

        }

        public List<XaPhuong> XaPhuong_DS()
        {
            var dsXP = XaPhuongs.FromSqlRaw("EXEC XP_DS").ToList();

            foreach(var item in dsXP)
            {
                item.tinh = Tinh_CT(item.MaTinh);
            }

            return dsXP;
        }

        public XaPhuong? XaPhuong_CT(string MaXP)
        {
           
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaXP", MaXP)
            };
            var xaPhuong = XaPhuongs.FromSqlRaw("EXEC XP_CT @MaXP", p).ToList().FirstOrDefault();
            xaPhuong.tinh = Tinh_CT(xaPhuong.MaTinh);

            return xaPhuong;
        }


        //9. Lập trình các hàm thao tác trên bảng QUYEN
        public DbSet<Quyen> Quyens { get; set; }

        public int Quyen_Them(Quyen quyen)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Quyen_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenQuyen", quyen.TenQuyen));
            cmd.Parameters.Add(new SqlParameter("@MoTa", quyen.MoTa ?? (object)DBNull.Value));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int Quyen_Sua(Quyen quyen)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Quyen_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaQuyen", quyen.MaQuyen));
            cmd.Parameters.Add(new SqlParameter("@TenQuyen", quyen.TenQuyen));
            cmd.Parameters.Add(new SqlParameter("@MoTa", quyen.MoTa ?? (object)DBNull.Value));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int Quyen_Xoa(byte MaQuyen)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "Quyen_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaQuyen", MaQuyen));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;

        }

        public List<Quyen> Quyen_DS()
        {
            return Quyens.FromSqlRaw("EXEC Quyen_DS").ToList();
        }

        public Quyen? Quyen_CT(byte MaQuyen)
        {

            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaQuyen", MaQuyen)
            };
            return Quyens.FromSqlRaw("EXEC Quyen_CT @MaQuyen", p).ToList().FirstOrDefault();
        }


        //10. Lập trình các hàm thao tác trên bảng PHANQUYEN
        public DbSet<PhanQuyen> PhanQuyens { get; set; }

        public int PhanQuyen_Them(PhanQuyen pq)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PQ_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaQuyen", pq.MaQuyen));
            cmd.Parameters.Add(new SqlParameter("@MaNV", pq.MaNV));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int PhanQuyen_Sua(byte MaQuyenCu, byte MaNVCu, PhanQuyen pq)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PQ_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaQuyenCu", MaQuyenCu));
            cmd.Parameters.Add(new SqlParameter("@MaNVCu", MaNVCu));
            cmd.Parameters.Add(new SqlParameter("@MaQuyenMoi", pq.MaQuyen));
            cmd.Parameters.Add(new SqlParameter("@MaNVMoi", pq.MaNV));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int PhanQuyen_Xoa(byte MaQuyen, byte MaNV)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "PQ_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaQuyen", MaQuyen));
            cmd.Parameters.Add(new SqlParameter("@MaNV", MaNV));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public async Task<List<PhanQuyen>> PhanQuyen_DS()
        {
            var dsPQ = await PhanQuyens.FromSqlRaw("EXEC PQ_DS").ToListAsync();

            foreach (var item in dsPQ)
            {
                item.Quyen = Quyen_CT(item.MaQuyen);
            }

            foreach (var item in dsPQ)
            {
                item.NhanVien = NhanVien_CT(item.MaNV);
            }

            dsPQ = dsPQ
                .OrderBy(pq => pq.MaQuyen)
                .ThenBy(pq => pq.NhanVien.TenNV)
                .ToList();

            return dsPQ;
        }

        public PhanQuyen? PhanQuyen_CT(byte MaQuyen, byte MaNV)
        {

            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaQuyen", MaQuyen),
                new Microsoft.Data.SqlClient.SqlParameter("@MaNV", MaNV)
            };
            var phanQuyen = PhanQuyens.FromSqlRaw("EXEC PQ_CT @MaQuyen, @MaNV", p).ToList().FirstOrDefault();
            phanQuyen.Quyen = Quyen_CT(phanQuyen.MaQuyen);
            phanQuyen.NhanVien = NhanVien_CT(phanQuyen.MaNV);
            return phanQuyen;
        }


        //11. Lập trình các hàm thao tác trên bảng NHACUNGCAP
        public DbSet<NhaCungCap> NhaCungCaps { get; set; }

        public int NhaCungCap_Them(NhaCungCap ncc)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NCC_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenNCC", ncc.TenNCC));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", ncc.DienThoai ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@Email", ncc.Email ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DiaChi", ncc.DiaChi));
            cmd.Parameters.Add(new SqlParameter("@MaXP", ncc.MaXP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int NhaCungCap_Sua(NhaCungCap ncc)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NCC_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNCC", ncc.MaNCC));
            cmd.Parameters.Add(new SqlParameter("@TenNCC", ncc.TenNCC));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", ncc.DienThoai ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@Email", ncc.Email ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DiaChi", ncc.DiaChi));
            cmd.Parameters.Add(new SqlParameter("@MaXP", ncc.MaXP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int NhaCungCap_Xoa(short MaNCC)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "NCC_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaNCC", MaNCC));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<NhaCungCap> NhaCungCap_DS()
        {
            var dsNCC = NhaCungCaps.FromSqlRaw("EXEC NCC_DS").ToList();

            foreach (var item in dsNCC)
            {
                item.XaPhuong = XaPhuong_CT(item.MaXP);
            }

            return dsNCC;
        }

        public NhaCungCap? NhaCungCap_CT(short MaNCC)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaNCC", MaNCC)
            };

            var nhaCungCap = NhaCungCaps.FromSqlRaw("EXEC NCC_CT @MaNCC", p).ToList().FirstOrDefault();

            nhaCungCap.XaPhuong = XaPhuong_CT(nhaCungCap.MaXP);

            return nhaCungCap;
        }

        //12. Lập trình các hàm thao tác trên bảng DONMUAHANG
        public DbSet<DonMuaHang> DonMuaHangs { get; set; }

        public int DonMuaHang_Them(DonMuaHang dmh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DMH_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@NgayDat", dmh.NgayDat));
            cmd.Parameters.Add(new SqlParameter("@NgayGiao", dmh.NgayGiao ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MaNV", dmh.MaNV));
            cmd.Parameters.Add(new SqlParameter("@MaNCC", dmh.MaNCC));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int DonMuaHang_Sua(DonMuaHang dmh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DMH_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDMH", dmh.MaDMH));
            cmd.Parameters.Add(new SqlParameter("@NgayDat", dmh.NgayDat));
            cmd.Parameters.Add(new SqlParameter("@NgayGiao", dmh.NgayGiao ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@MaNV", dmh.MaNV));
            cmd.Parameters.Add(new SqlParameter("@MaNCC", dmh.MaNCC));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int DonMuaHang_Xoa(string MaDMH)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DMH_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDMH", MaDMH));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<DonMuaHang> DonMuaHang_DS()
        {
            var dsDMH = DonMuaHangs.FromSqlRaw("EXEC DMH_DS").ToList();

            foreach (var item in dsDMH)
            {
                item.NhanVien = NhanVien_CT(item.MaNV);
            }

            foreach (var item in dsDMH)
            {
                item.NhaCungCap = NhaCungCap_CT(item.MaNCC);
            }

            return dsDMH;
        }

        public DonMuaHang? DonMuaHang_CT(string madmh)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaDMH", madmh)
            };

            var donMuaHang = DonMuaHangs.FromSqlRaw("EXEC DMH_CT @MaDMH", p).ToList().FirstOrDefault();

            donMuaHang.NhanVien = NhanVien_CT(donMuaHang.MaNV);
            donMuaHang.NhaCungCap = NhaCungCap_CT(donMuaHang.MaNCC);

            return donMuaHang;
        }


        //13. Lập trình các hàm thao tác trên bảng CTMUAHANG
        public DbSet<CTMuaHang> CTMuaHangs { get; set; }

        public int CTMuaHang_Them(CTMuaHang ctmh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTMH_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDMH", ctmh.MaDMH));
            cmd.Parameters.Add(new SqlParameter("@MaSP", ctmh.MaSP));
            cmd.Parameters.Add(new SqlParameter("@SLM", ctmh.SLM));
            cmd.Parameters.Add(new SqlParameter("@DGM", ctmh.DGM));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int CTMuaHang_Sua(string MaDMHCu, string MaSPCu, CTMuaHang ctmh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTMH_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDMHCu", MaDMHCu));
            cmd.Parameters.Add(new SqlParameter("@MaSPCu", MaSPCu));
            cmd.Parameters.Add(new SqlParameter("@MaDMHMoi", ctmh.MaDMH));
            cmd.Parameters.Add(new SqlParameter("@MaSPMoi", ctmh.MaSP));
            cmd.Parameters.Add(new SqlParameter("@SLM", ctmh.SLM));
            cmd.Parameters.Add(new SqlParameter("@DGM", ctmh.DGM));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int CTMuaHang_Xoa(string MaDMH, string MaSP)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTMH_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDMH", MaDMH));
            cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public async Task<List<CTMuaHang>> CTMuaHang_DS()
        {
            var dsMH = await CTMuaHangs.FromSqlRaw("EXEC CTMH_DS").ToListAsync();

            foreach (var item in dsMH)
            {
                item.DonMuaHang = DonMuaHang_CT(item.MaDMH);
            }

            foreach (var item in dsMH)
            {
                item.SanPham = SanPham_CT(item.MaSP);
            }

            dsMH = dsMH
                .OrderBy(pq => pq.MaDMH)
                .ThenBy(pq => pq.SanPham.TenSP)
                .ToList();

            return dsMH;
        }

        public CTMuaHang? CTMuaHang_CT(string MaDMH, string MaSP)
        {

            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaDMH", MaDMH),
                new Microsoft.Data.SqlClient.SqlParameter("@MaSP", MaSP)
            };
            var ctMuaHang = CTMuaHangs.FromSqlRaw("EXEC CTMH_CT @MaDMH, @MaSP", p).ToList().FirstOrDefault();
            ctMuaHang.DonMuaHang = DonMuaHang_CT(ctMuaHang.MaDMH);
            ctMuaHang.SanPham = SanPham_CT(ctMuaHang.MaSP);
            return ctMuaHang;
        }


        //14. Thao tác trên bảng KHACHHANG
        public DbSet<KhachHang> KhachHangs { get; set; }

        public List<KhachHang> KhachHang_DS()
        {
            var dsKhachHang = KhachHangs.FromSqlRaw("EXEC KH_DS").ToList();
            var dsXP = XaPhuong_DS().ToDictionary(p => p.MaXP);

            foreach (var item in dsKhachHang)
            {
                item.XaPhuong = XaPhuong_CT(item.MaXP);
            }
            return dsKhachHang;
        }

        public KhachHang? KhachHang_CT(short MaKH)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaKH", MaKH)
            };
            var khachHang = KhachHangs.FromSqlRaw("EXEC KH_CT @MaKH", p).ToList().FirstOrDefault();
            khachHang.XaPhuong = XaPhuong_CT(khachHang.MaXP);
            return khachHang;
        }

        public int KhachHang_Them(KhachHang kh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@HoKH", kh.HoKH));
            cmd.Parameters.Add(new SqlParameter("@TenKH", kh.TenKH));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", kh.DienThoai ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@Email", kh.Email ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DiaChi", kh.DiaChi));
            cmd.Parameters.Add(new SqlParameter("@MaXP", kh.MaXP));
            cmd.Parameters.Add(new SqlParameter("@TenDN", kh.TenDN));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int KhachHang_Sua(KhachHang kh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaKH", kh.MaKH));
            cmd.Parameters.Add(new SqlParameter("@HoKH", kh.HoKH));
            cmd.Parameters.Add(new SqlParameter("@TenKH", kh.TenKH));
            cmd.Parameters.Add(new SqlParameter("@DienThoai", kh.DienThoai ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@Email", kh.Email ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DiaChi", kh.DiaChi));
            cmd.Parameters.Add(new SqlParameter("@MaXP", kh.MaXP));
            cmd.Parameters.Add(new SqlParameter("@TenDN", kh.TenDN));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int KhachHang_Xoa(short MaKH)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaKH", MaKH));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public byte KhachHang_DangNhap(string TenDN, string MatKhau) // Trả về mã khách hàng nếu đăng nhập thành công
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_DN";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            cmd.Parameters.Add(new SqlParameter("@MatKhau", MatKhau));
            Database.OpenConnection();
            var reader = cmd.ExecuteReader();
            byte maKH = 0;
            if (reader.Read()) // Nếu có dữ liệu để đọc
            {
                maKH = byte.Parse(reader["MaKH"].ToString());
            }
            Database.CloseConnection();
            return maKH;
        }

        public int KhachHang_DoiMatKhau(string TenDN, string MatKhauCu, string MatKhauMoi)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_DMK";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            cmd.Parameters.Add(new SqlParameter("@MatKhauCu", MatKhauCu));
            cmd.Parameters.Add(new SqlParameter("@MatKhauMoi", MatKhauMoi));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int KhachHang_ResetMatKhau(string TenDN)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "KH_ReMK";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@TenDN", TenDN));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }


        //15. Lập trình các hàm thao tác trên bảng DONBANHANG
        public DbSet<DonBanHang> DonBanHangs { get; set; }

        public int DonBanHang_Them(DonBanHang dbh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DBH_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@NgayDat", dbh.NgayDat));
            cmd.Parameters.Add(new SqlParameter("@NgayGiao", dbh.NgayGiao ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DCGH", dbh.DCGH));
            cmd.Parameters.Add(new SqlParameter("@MaXP", dbh.MaXP));
            cmd.Parameters.Add(new SqlParameter("@MaNV", dbh.MaNV));
            cmd.Parameters.Add(new SqlParameter("@MaKH", dbh.MaKH));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int DonBanHang_Sua(DonBanHang dbh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DBH_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDBH", dbh.MaDBH));
            cmd.Parameters.Add(new SqlParameter("@NgayDat", dbh.NgayDat));
            cmd.Parameters.Add(new SqlParameter("@NgayGiao", dbh.NgayGiao ?? (object)DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@DCGH", dbh.DCGH));
            cmd.Parameters.Add(new SqlParameter("@MaXP", dbh.MaXP));
            cmd.Parameters.Add(new SqlParameter("@MaNV", dbh.MaNV));
            cmd.Parameters.Add(new SqlParameter("@MaKH", dbh.MaKH));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int DonBanHang_Xoa(string MaDBH)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "DBH_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDBH", MaDBH));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();

            return ans;
        }

        public List<DonBanHang> DonBanHang_DS()
        {
            var dsDBH = DonBanHangs.FromSqlRaw("EXEC DBH_DS").ToList();

            foreach (var item in dsDBH)
            {
                item.XaPhuong = XaPhuong_CT(item.MaXP);
            }

            foreach (var item in dsDBH)
            {
                item.NhanVien = NhanVien_CT(item.MaNV);
            }

            foreach (var item in dsDBH)
            {
                item.KhachHang = KhachHang_CT(item.MaKH);
            }

            return dsDBH;
        }

        public DonBanHang? DonBanHang_CT(string madbh)
        {
            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaDBH", madbh)
            };

            var donBanHang = DonBanHangs.FromSqlRaw("EXEC DBH_CT @MaDBH", p).ToList().FirstOrDefault();
            donBanHang.XaPhuong = XaPhuong_CT(donBanHang.MaXP);
            donBanHang.NhanVien = NhanVien_CT(donBanHang.MaNV);
            donBanHang.KhachHang = KhachHang_CT(donBanHang.MaKH);

            return donBanHang;
        }


        //16. Lập trình các hàm thao tác trên bảng CTBANHANG
        public DbSet<CTBanHang> CTBanHangs { get; set; }

        public int CTBanHang_Them(CTBanHang ctbh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTBH_Them";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDBH", ctbh.MaDBH));
            cmd.Parameters.Add(new SqlParameter("@MaSP", ctbh.MaSP));
            cmd.Parameters.Add(new SqlParameter("@SLB", ctbh.SLB));
            cmd.Parameters.Add(new SqlParameter("@DGB", ctbh.DGB));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int CTBanHang_Sua(string MaDBHCu, string MaSPCu, CTBanHang ctbh)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTBH_Sua";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDBHCu", MaDBHCu));
            cmd.Parameters.Add(new SqlParameter("@MaSPCu", MaSPCu));
            cmd.Parameters.Add(new SqlParameter("@MaDBH", ctbh.MaDBH));
            cmd.Parameters.Add(new SqlParameter("@MaSP", ctbh.MaSP));
            cmd.Parameters.Add(new SqlParameter("@SLB", ctbh.SLB));
            cmd.Parameters.Add(new SqlParameter("@DGB", ctbh.DGB));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public int CTBanHang_Xoa(string MaDBH, string MaSP)
        {
            var cmd = Database.GetDbConnection().CreateCommand();
            cmd.CommandText = "CTBH_Xoa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MaDBH", MaDBH));
            cmd.Parameters.Add(new SqlParameter("@MaSP", MaSP));
            Database.OpenConnection();
            var ans = cmd.ExecuteNonQuery();
            Database.CloseConnection();
            return ans;
        }

        public async Task<List<CTBanHang>> CTBanHang_DS()
        {
            var dsBH = await CTBanHangs.FromSqlRaw("EXEC CTBH_DS").ToListAsync();

            foreach (var item in dsBH)
            {
                item.DonBanHang = DonBanHang_CT(item.MaDBH);
            }

            foreach (var item in dsBH)
            {
                item.SanPham = SanPham_CT(item.MaSP);
            }

            dsBH = dsBH
                .OrderBy(pq => pq.MaDBH)
                .ThenBy(pq => pq.SanPham.TenSP)
                .ToList();

            return dsBH;
        }

        public CTBanHang? CTBanHang_CT(string MaDBH, string MaSP)
        {

            var p = new[]
            {
                new Microsoft.Data.SqlClient.SqlParameter("@MaDBH", MaDBH),
                new Microsoft.Data.SqlClient.SqlParameter("@MaSP", MaSP)
            };
            var ctBanHang = CTBanHangs.FromSqlRaw("EXEC CTBH_CT @MaDBH, @MaSP", p).ToList().FirstOrDefault();
            ctBanHang.DonBanHang = DonBanHang_CT(ctBanHang.MaDBH);
            ctBanHang.SanPham = SanPham_CT(ctBanHang.MaSP);
            return ctBanHang;
        }
    }
}