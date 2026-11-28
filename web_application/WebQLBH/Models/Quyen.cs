using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace WebQLBH.Models
{
    public class Quyen
    {
        [Key]
        [DisplayName("Mã quyền")]
        public byte MaQuyen { get; set; }
        [DisplayName("Tên quyền")]
        public string? TenQuyen { get; set; }
        [DisplayName("Mô tả")]
        public string? MoTa { get; set; }
    }
}
