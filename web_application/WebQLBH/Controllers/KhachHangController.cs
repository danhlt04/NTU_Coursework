
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

[SessionAuthorize]
public class KhachHangController : Controller
{
    private readonly AppDbContext _context;

    public KhachHangController(AppDbContext context)
    {
        _context = context;
    }

    // GET: KHACHHANGS
    public async Task<IActionResult> Index()    
    {
        return View(_context.KhachHang_DS());
    }

    // GET: KHACHHANGS/Details/5
    public async Task<IActionResult> Details(short makh)
    {
        return View(_context.KhachHang_CT(makh));
    }

    // GET: KHACHHANGS/Create
    public IActionResult Create()
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        return View();
    }

    // POST: KHACHHANGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaKH,HoKH,TenKH,DienThoai,Email,DiaChi,MaXP,TenDN,MatKhau,XaPhuong")] KhachHang khachhang)
    {
        _context.KhachHang_Them(khachhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: KHACHHANGS/Edit/5
    public async Task<IActionResult> Edit(short makh)
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        return View(_context.KhachHang_CT(makh));
    }

    // POST: KHACHHANGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(short? makh, [Bind("MaKH,HoKH,TenKH,DienThoai,Email,DiaChi,MaXP,TenDN,MatKhau,XaPhuong")] KhachHang khachhang)
    {
        _context.KhachHang_Sua(khachhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: KHACHHANGS/Delete/5
    public async Task<IActionResult> Delete(short makh)
    {
        return View(_context.KhachHang_CT(makh));
    }

    // POST: KHACHHANGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(short makh)
    {
        _context.KhachHang_Xoa(makh);
        return RedirectToAction(nameof(Index));
    }

    private bool KhachHangExists(short? makh)
    {
        return _context.KhachHangs.Any(e => e.MaKH == makh);
    }
}
