using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace WebQLBH.Models
{
    public class PhongBan
    {
        [Key]
        [DisplayName("Mã phòng ban")]
        public byte MaPB { get; set; }
        [DisplayName("Tên phòng ban")]
        public string? TenPB { get; set; }
    }
}
