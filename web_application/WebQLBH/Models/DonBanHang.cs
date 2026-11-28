using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class DonBanHang
    {
        [Key]
        [DisplayName("Mã đơn bán hàng")]
        public string? MaDBH { get; set; }
        [DisplayName("Ngày đặt hàng")]
        public DateTime NgayDat { get; set; }
        [DisplayName("Ngày giao hàng")]
        public DateTime? NgayGiao { get; set; }
        [DisplayName("Địa chỉ giao hàng")]
        public string? DCGH { get; set; }
        [DisplayName("Mã xã phường")]
        public string? MaXP { get; set; }
        [DisplayName("Mã nhân viên")]
        public byte MaNV { get; set; }
        [DisplayName("Mã khách hàng")]
        public short MaKH { get; set; }

        [ForeignKey("MaXP")]
        public virtual XaPhuong? XaPhuong { get; set; }

        [ForeignKey("MaNV")]
        public virtual NhanVien? NhanVien { get; set; }

        [ForeignKey("MaKH")]
        public virtual KhachHang? KhachHang { get; set; }
    }
}
