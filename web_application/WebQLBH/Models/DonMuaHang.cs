using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class DonMuaHang
    {
        [Key]
        [DisplayName("Mã đơn mua hàng")]
        public string? MaDMH { get; set; }
        [DisplayName("Ngày đặt hàng")]
        public DateTime NgayDat { get; set; }
        [DisplayName("Ngày giao hàng")]
        public DateTime? NgayGiao { get; set; }
        [DisplayName("Mã nhân viên")]
        public byte MaNV { get; set; }
        [DisplayName("Mã nhà cung cấp")]
        public short MaNCC { get; set; }

        [ForeignKey("MaNV")]
        public virtual NhanVien? NhanVien { get; set; }

        [ForeignKey("MaNCC")]
        public virtual NhaCungCap? NhaCungCap { get; set; }
    }
}
