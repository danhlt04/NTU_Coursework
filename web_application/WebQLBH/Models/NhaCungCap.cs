using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class NhaCungCap
    {
        [Key]
        [DisplayName("Mã nhà cung cấp")]
        public short MaNCC { get; set; }
        [DisplayName("Tên nhà cung cấp")]
        public string? TenNCC { get; set; }
        [DisplayName("Điện thoại")]
        public string? DienThoai { get; set; }
        [DisplayName("Email")]
        public string? Email { get; set; }
        [DisplayName("Địa chỉ")]
        public string? DiaChi { get; set; }
        [DisplayName("Mã xã phường")]
        public string? MaXP { get; set; }

        [ForeignKey("MaXP")]
        public virtual XaPhuong? XaPhuong { get; set; }
    }
}
