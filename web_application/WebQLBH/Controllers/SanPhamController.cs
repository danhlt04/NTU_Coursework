using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Data;
using WebQLBH.Models;
using static System.Net.Mime.MediaTypeNames;

public class SanPhamController : Controller
{
    private readonly AppDbContext _context;
    private readonly IWebHostEnvironment _env;

    public SanPhamController(AppDbContext context, IWebHostEnvironment env)
    {
        _context = context;
        _env = env;
    }

    // GET: SANPHAMS
    public async Task<IActionResult> Index()    
    {
        return View(_context.SanPham_DS());
    }

    // GET: SANPHAMS/Details/5
    public async Task<IActionResult> Details(string masp)
    {
        return View(_context.SanPham_CT(masp));
    }

    // GET: SANPHAMS/Create
    public IActionResult Create()
    {
        ViewBag.LoaiSanPhams = new SelectList(_context.LoaiSanPham_DS(), "MaLSP", "TenLSP");
        ViewBag.DonViTinhs = new SelectList(_context.DonViTinh_DS(), "MaDVT", "TenDVT");

        return View();
    }

    // POST: SANPHAMS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(SanPham sanpham, IFormFile? image)
    {
       if (!ModelState.IsValid)
       {
            ViewBag.LoaiSanPhams = new SelectList(_context.LoaiSanPham_DS(), "MaLSP", "TenLSP");
            ViewBag.DonViTinhs = new SelectList(_context.DonViTinh_DS(), "MaDVT", "TenDVT");
            return View(sanpham);
       }

        //Kiểm tra nếu có chọn ảnh thì upload ảnh lên server
        if (image != null && image.Length > 0)//Nếu có chọn ảnh để upload
        {
            var ext = Path.GetExtension(image.FileName).ToLower();
            var allowed = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

            if (!allowed.Contains(ext) || image.Length > 2 * 1024 * 1024) // tối đa 2 MB
            {
                ModelState.AddModelError("", "Chỉ nhận ảnh jpg/png/gif/webp, tối đa 2 MB.");
                ViewBag.LoaiSanPhams = new SelectList(_context.LoaiSanPham_DS(), "MaLSP", "TenLSP");
                ViewBag.DonViTinhs = new SelectList(_context.DonViTinh_DS(), "MaDVT", "TenDVT");
                return View(sanpham);
            }
            var uploads = Path.Combine(_env.WebRootPath, "images", "uploads");//Nhớ khai báo biến môi trường phía trên và gán giá trị trong hàm khởi tạo lớp
            Directory.CreateDirectory(uploads);//Tạo thư mục nếu nó chưa tồn tại
            var fileName = Guid.NewGuid().ToString("N") + Path.GetExtension(image.FileName);//tạo mới tên file định danh quốc tế duy nhất, không trùng lắp
            var path = Path.Combine(uploads, fileName);
            using var fs = new FileStream(path, FileMode.Create);
            await image.CopyToAsync(fs);
            sanpham.AnhSP = fileName;//Lưu tên ảnh vào cột AnhSP
        }
        _context.SanPham_Them(sanpham);//Thực hiện lệnh thêm
        return RedirectToAction(nameof(Index));//Trở về trang danh sách
    }

    // GET: SANPHAMS/Edit/5
    public async Task<IActionResult> Edit(string masp)
    {
        ViewBag.LoaiSanPhams = new SelectList(_context.LoaiSanPham_DS(), "MaLSP", "TenLSP");
        ViewBag.DonViTinhs = new SelectList(_context.DonViTinh_DS(), "MaDVT", "TenDVT");

        return View(_context.SanPham_CT(masp));
    }

    // POST: SANPHAMS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(SanPham sanpham, IFormFile? image, string? existingAnh)
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
                ViewBag.LoaiSanPhams = new SelectList(_context.LoaiSanPham_DS(), "MaLSP", "TenLSP");
                ViewBag.DonViTinhs = new SelectList(_context.DonViTinh_DS(), "MaDVT", "TenDVT");

                return View(sanpham);
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
            sanpham.AnhSP = fileName;
        }
        else
        {
            // giữ ảnh cũ
            sanpham.AnhSP = existingAnh;
        }

        _context.SanPham_Sua(sanpham);//Thực hiện lệnh sửa
        return RedirectToAction(nameof(Index));//Trở về trang danh sách
    }

    // GET: SANPHAMS/Delete/5
    public async Task<IActionResult> Delete(string masp)
    {
        return View(_context.SanPham_CT(masp));
    }

    // POST: SANPHAMS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string masp)
    {
        _context.SanPham_Xoa(masp);
        return RedirectToAction(nameof(Index));
    }

    private bool SanPhamExists(string masp)
    {
        return _context.SanPhams.Any(e => e.MaSP == masp);
    }
}
