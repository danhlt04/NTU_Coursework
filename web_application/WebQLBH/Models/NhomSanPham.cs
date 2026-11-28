using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class NhomSanPham
    {
        [Key]
        [DisplayName("Mã nhóm sản phẩm")]
        public byte MaNSP { get; set; }
        [DisplayName("Tên nhóm sản phẩm")]
        public string? TenNSP { get; set; }
    }
}
