using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class LoaiSanPham
    {
        [Key]
        [DisplayName("Mã loại sản phẩm")]
        public short MaLSP { get; set; }
        [DisplayName("Tên loại sản phẩm")]
        public string? TenLSP { get; set; }
        [DisplayName("Mã nhóm sản phẩm")]
        public byte MaNSP { get; set; }

        // Khai báo các bảng tham chiếu liên quan khóa ngoại 
        [ForeignKey("MaNSP")] // Khai báo thuộc tính khóa ngoại
        public virtual NhomSanPham? NhomSP { get; set; } // Để biết loại sản phẩm thuộc nhóm sản phẩm nào, tra cứu trong bảng NHOMSANPHAM (nên phải khai báo dòng lệnh này)   
    }
}
