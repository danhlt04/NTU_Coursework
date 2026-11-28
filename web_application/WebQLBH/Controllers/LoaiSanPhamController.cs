
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.AspNetCore.Mvc.Rendering;

public class LoaiSanPhamController : Controller
{
    private readonly AppDbContext _context;

    public LoaiSanPhamController(AppDbContext context)
    {
        _context = context;
    }

    // GET: LOAISANPHAMS
    public async Task<IActionResult> Index()    
    {
        return View(_context.LoaiSanPham_DS());
    }

    // GET: LOAISANPHAMS/Details/5
    public async Task<IActionResult> Details(short malsp)
    {
        return View(_context.LoaiSP_CT(malsp));
    }

    // GET: LOAISANPHAMS/Create
    public IActionResult Create()
    {
        ViewBag.NhomSPs = new SelectList(_context.NhomSanPham_DS(), "MaNSP", "TenNSP");
        // Lấy danh sách nhóm sản phẩm, lưu vào NhomSPs, trong ViewBag để khi thêm mới 1 loại sản phẩm, hiển thị danh sách xổ xuống tên nhóm sản phẩm trong trang LoaiSPs/Create.cshtml, khi người dùng chọn tên 1 nhóm sản phẩm, sẽ trả về mã nhóm sản phẩm là khóa ngoại của bảng LoaiSP cần thêm mới
        return View(); 
    }

    // POST: LOAISANPHAMS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(LoaiSanPham loaisanpham)
    {
        _context.LoaiSP_Them(loaisanpham); // Thực hiện lệnh thêm 
        return RedirectToAction(nameof(Index)); // Trở về trang danh sách 
    }

    // GET: LOAISANPHAMS/Edit/5
    public async Task<IActionResult> Edit(short malsp)
    {
        ViewBag.NhomSPs = new SelectList(_context.NhomSanPham_DS(), "MaNSP", "TenNSP");
        // Lấy danh sách nhóm sản phẩm, lưu vào NhomSPs trong ViewBag để khi sửa 1 sản phẩm, hiển thị danh sách xổ xuống tên nhóm sản phẩm trong trang LoaiSPs/Create.cshtml để người dùng chọn sửa nhóm sản phẩm khi cần thiết, và trả về mã nhóm sản phẩm là khóa ngoại của LoaiSP cần sửa 
        return View(_context.LoaiSP_CT(malsp));
    }

    // POST: LOAISANPHAMS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(LoaiSanPham loaisanpham)
    {
        _context.LoaiSP_Sua(loaisanpham); // Thực hiện lệnh sửa
        return RedirectToAction(nameof(Index)); // Trở về trang danh sách 
    }

    // GET: LOAISANPHAMS/Delete/5
    public async Task<IActionResult> Delete(short malsp)
    {
        return View(_context.LoaiSP_CT(malsp));
    }

    // POST: LOAISANPHAMS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(short malsp)
    {
        _context.LoaiSP_Xoa(malsp);
        return RedirectToAction(nameof(Index));
    }

    private bool LoaiSanPhamExists(short? malsp)
    {
        return _context.LoaiSanPhams.Any(e => e.MaLSP == malsp);
    }
}