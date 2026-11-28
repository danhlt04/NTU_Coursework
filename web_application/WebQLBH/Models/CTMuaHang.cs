using Microsoft.EntityFrameworkCore;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    [PrimaryKey(nameof(MaDMH), nameof(MaSP))]
    public class CTMuaHang
    {
        [DisplayName("Mã đơn mua hàng")]
        public string? MaDMH { get; set; }
        [DisplayName("Mã sản phẩm")]
        public string? MaSP { get; set; }
        [DisplayName("Số lượng mua")]
        public short SLM { get; set; }
        [DisplayName("Đơn giá mua")]
        public decimal DGM { get; set; }

        [ForeignKey("MaDMH")]
        public virtual DonMuaHang? DonMuaHang { get; set; }

        [ForeignKey("MaSP")]
        public virtual SanPham? SanPham { get; set; }
    }
}
