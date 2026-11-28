using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    public class XaPhuong
    {
        [Key]
        [DisplayName("Mã xã phường")]
        public string? MaXP { get; set; }
        [DisplayName("Tên xã phường")]
        public string? TenXP { get; set; }
        [DisplayName("Mã tỉnh")]
        public string? MaTinh { get; set; }

        [ForeignKey("MaTinh")]
        public virtual Tinh? tinh { get; set; }

    }
}
