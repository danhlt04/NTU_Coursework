using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class SanPham
    {
        [Key]
        [DisplayName("Mã sản phẩm")]
        public string? MaSP { get; set; }
        [DisplayName("Tên sản phẩm")]
        public string? TenSP { get; set; }
        [DisplayName("Đơn giá")]
        public decimal DonGia { get; set; }
        [DisplayName("Hình ảnh")]
        public string? AnhSP { get; set; }
        [DisplayName("Mô tả tóm tắt")]
        public string? MoTaTT { get; set; }
        [DisplayName("Thông tin chi tiết")]
        public string? ThongTinCT { get; set; }
        [DisplayName("Mã loại sản phẩm")]
        public short MaLSP { get; set; }
        [DisplayName("Mã nhóm sản phẩm")]
        public byte MaDVT { get; set; }

        [ForeignKey("MaLSP")]
        public virtual LoaiSanPham? LSP { get; set; }
        
        [ForeignKey("MaDVT")]
        public virtual DonViTinh? DVT { get; set; }
    }
}
