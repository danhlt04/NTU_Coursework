using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace WebQLBH.Models
{
    public class DonViTinh
    {
        [Key]
        [DisplayName("Mã đơn vị tính")]
        public byte MaDVT { get; set; }
        [DisplayName("Tên đơn vị tính")]
        public string? TenDVT { get; set; }
    }
}
