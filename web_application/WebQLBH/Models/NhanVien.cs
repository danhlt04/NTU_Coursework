using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class NhanVien
    {
        [Key]
        [DisplayName("Mã nhân viên")]
        public byte MaNV { get; set; }
        [DisplayName("Họ nhân viên")]
        public string? HoNV { get; set; }
        [DisplayName("Tên nhân viên")]
        public string? TenNV { get; set; }
        [DisplayName("Điện thoại")]
        public string? DienThoai { get; set; }
        [DisplayName("Email")]
        public string? Email { get; set; }
        [DisplayName("Tên đăng nhập")]
        public string? TenDN { get; set; }
        [DisplayName("Mật khẩu")]
        public byte[]? MatKhau { get; set; }
        [DisplayName("Ảnh nhân viên")]
        public string? AnhNV { get; set; }
        [DisplayName("Mã phòng ban")]
        public byte MaPB { get; set; }

        //Khai báo các bảng tham chiếu liên quan khóa ngoại
        [ForeignKey("MaPB")]//Khai báo thuộc tính khóa ngoại
        public virtual PhongBan? PB { get; set; }
    }
}
