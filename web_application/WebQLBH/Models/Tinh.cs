using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace WebQLBH.Models
{
    public class Tinh
    {
        [Key]
        [DisplayName("Mã tỉnh")]
        public string? MaTinh { get; set; }
        [DisplayName("Tên tỉnh")]
        public string? TenTinh { get; set; }
    }
}
