using Microsoft.EntityFrameworkCore;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlTypes;

namespace WebQLBH.Models
{
    [PrimaryKey(nameof(MaDBH), nameof(MaSP))]
    public class CTBanHang
    {
        [DisplayName("Mã đơn bán hàng")]
        public string? MaDBH { get; set; }
        [DisplayName("Mã sản phẩm")]
        public string? MaSP { get; set; }
        [DisplayName("Số lượng bán")]
        public byte SLB { get; set; }
        [DisplayName("Đơn giá bán")]
        public decimal DGB { get; set; }

        [ForeignKey("MaDBH")]
        public virtual DonBanHang? DonBanHang { get; set; }

        [ForeignKey("MaSP")]
        public virtual SanPham? SanPham { get; set; }
    }
}
