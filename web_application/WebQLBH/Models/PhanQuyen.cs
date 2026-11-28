using Microsoft.EntityFrameworkCore;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebQLBH.Models
{
    [PrimaryKey(nameof(MaQuyen), nameof(MaNV))]
    public class PhanQuyen
    {
        [DisplayName("Mã Quyền")]
        public byte MaQuyen { get; set; }
        [DisplayName("Mã nhân viên")]
        public byte MaNV { get; set; }

        [ForeignKey("MaQuyen")]
        public virtual Quyen? Quyen { get; set; }

        [ForeignKey("MaNV")]
        public virtual NhanVien? NhanVien { get; set; }
    }
}
