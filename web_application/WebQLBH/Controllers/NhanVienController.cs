using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebQLBH.Data;
using WebQLBH.Models;

namespace WebQLBH.Controllers
{
    [SessionAuthorize]
    public class NhanVienController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env; // Khai báo biến môi trường để upload ảnh lên web server

        public NhanVienController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        // GET: NhanViens
        public async Task<IActionResult> Index()
        {
            return View(_context.NhanVien_DS());
        }

        // GET: NhanViens/Details/5
        public async Task<IActionResult> Details(byte MaNV)
        {
            return View(_context.NhanVien_CT(MaNV));
        }

        // GET: NhanViens/Create
        public IActionResult Create()
        {
            ViewBag.PhongBans = new SelectList(_context.PhongBan_DS(), "MaPB", "TenPB");
            return View();
        }

        // POST: NhanViens/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(NhanVien nhanVien, IFormFile? image)
        {
            if(!ModelState.IsValid)
            {
                ViewBag.PhongBans = new SelectList(_context.PhongBan_DS(), "MaPB", "TenPB");
                return View(nhanVien);
            }

            //Kiểm tra nếu có chọn ảnh thì upload ảnh lên server
            if (image != null && image.Length > 0)//Nếu có chọn ảnh để upload
            {
                var ext = Path.GetExtension(image.FileName).ToLower();
                var allowed = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

                if (!allowed.Contains(ext) || image.Length > 2 * 1024 * 1024) // tối đa 2 MB
                {
                    ModelState.AddModelError("", "Chỉ nhận ảnh jpg/png/gif/webp, tối đa 2 MB.");
                    ViewBag.PhongBans = new SelectList(_context.PhongBan_DS(), "MaPB", "TenPB");
                    return View(nhanVien);
                }
                var uploads = Path.Combine(_env.WebRootPath, "images", "uploads");//Nhớ khai báo biến môi trường phía trên và gán giá trị trong hàm khởi tạo lớp
                Directory.CreateDirectory(uploads);//Tạo thư mục nếu nó chưa tồn tại
                var fileName = Guid.NewGuid().ToString("N") + Path.GetExtension(image.FileName);//tạo mới tên file định danh quốc tế duy nhất, không trùng lắp
                var path = Path.Combine(uploads, fileName);
                using var fs = new FileStream(path, FileMode.Create);
                await image.CopyToAsync(fs);
                nhanVien.AnhNV = fileName;//Lưu tên ảnh vào cột AnhNV
            }
            _context.NhanVien_Them(nhanVien);//Thực hiện lệnh thêm
            return RedirectToAction(nameof(Index));//Trở về trang danh sách
        }

        // GET: NhanViens/Edit/5
        public async Task<IActionResult> Edit(byte MaNV)
        {
            ViewBag.PhongBans = new SelectList(_context.PhongBan_DS(), "MaPB", "TenPB");
            return View(_context.NhanVien_CT(MaNV));
        }

        // POST: NhanViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(NhanVien nhanVien, IFormFile? image, string? existingAnh)
        {
            var uploads = Path.Combine(_env.WebRootPath, "images", "uploads");
            Directory.CreateDirectory(uploads);

            if (image != null && image.Length > 0)
            {
                var ext = Path.GetExtension(image.FileName).ToLower();
                var allowed = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

                if (!allowed.Contains(ext) || image.Length > 2 * 1024 * 1024) // tối đa 2 MB
                {
                    ModelState.AddModelError("", "Chỉ nhận ảnh jpg/png/gif/webp, tối đa 2 MB.");
                    ViewBag.PhongBans = new SelectList(_context.PhongBan_DS(), "MaPB", "TenPB");
                    return View(nhanVien);
                }
                var fileName = Guid.NewGuid().ToString("N") + Path.GetExtension(image.FileName);
                var path = Path.Combine(uploads, fileName);
                using var fs = new FileStream(path, FileMode.Create);
                await image.CopyToAsync(fs);

                // xóa file cũ nếu có
                if (!string.IsNullOrEmpty(existingAnh))
                {
                    var old = Path.Combine(uploads, existingAnh);
                    if (System.IO.File.Exists(old)) System.IO.File.Delete(old);
                }
                nhanVien.AnhNV = fileName;
            }
            else
            {
                // giữ ảnh cũ
                nhanVien.AnhNV = existingAnh;
            }

            _context.NhanVien_Sua(nhanVien);//Thực hiện lệnh sửa
            return RedirectToAction(nameof(Index));//Trở về trang danh sách
        }

        // GET: NhanViens/Delete/5
        public async Task<IActionResult> Delete(byte MaNV)
        {
            return View(_context.NhanVien_CT(MaNV));
        }

        // POST: NhanViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(byte MaNV)
        {
            _context.NhanVien_Xoa(MaNV);//Thực hiện lệnh xóa
            return RedirectToAction(nameof(Index));//Trở về trang danh sách
        }

    }
}
