using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class KhachHang
    {
        [Key]
        [DisplayName("Mã khách hàng")]
        public short MaKH { get; set; }
        [DisplayName("Họ khách hàng")]
        public string? HoKH { get; set; }
        [DisplayName("Tên khách hàng")]
        public string? TenKH { get; set; }
        [DisplayName("Số điện thoại")]
        public string? DienThoai { get; set; }
        [DisplayName("Email")]
        public string? Email { get; set; }
        [DisplayName("Địa chỉ")]
        public string? DiaChi { get; set; }
        [DisplayName("Mã xã phường")]
        public string? MaXP { get; set; }
        [DisplayName("Tên đăng nhập")]
        public string? TenDN { get; set; }
        [DisplayName("Mật khẩu")]
        public byte[]? MatKhau { get; set; }


        [ForeignKey("MaXP")]
        public virtual XaPhuong? XaPhuong { get; set; }
    }
}
