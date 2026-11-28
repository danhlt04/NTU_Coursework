
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

public class DonBanHangController : Controller
{
    private readonly AppDbContext _context;

    public DonBanHangController(AppDbContext context)
    {
        _context = context;
    }

    // GET: DONBANHANGS
    public async Task<IActionResult> Index()    
    {
        return View(_context.DonBanHang_DS());
    }

    // GET: DONBANHANGS/Details/5
    public async Task<IActionResult> Details(string madbh)
    {
        return View(_context.DonBanHang_CT(madbh));
    }

    // GET: DONBANHANGS/Create
    public IActionResult Create()
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV");
        ViewBag.KhachHangs = new SelectList(_context.KhachHang_DS(), "MaKH", "TenKH");
        return View();
    }

    // POST: DONBANHANGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaDBH,NgayDat,NgayGiao,DCGH,MaXP,MaNV,MaKH,XaPhuong,NhanVien,KhachHang")] DonBanHang donbanhang)
    {
        _context.DonBanHang_Them(donbanhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONBANHANGS/Edit/5
    public async Task<IActionResult> Edit(string madbh)
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV");
        ViewBag.KhachHangs = new SelectList(_context.KhachHang_DS(), "MaKH", "TenKH");
        return View(_context.DonBanHang_CT(madbh));
    }

    // POST: DONBANHANGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string madbh, [Bind("MaDBH,NgayDat,NgayGiao,DCGH,MaXP,MaNV,MaKH,XaPhuong,NhanVien,KhachHang")] DonBanHang donbanhang)
    {
        _context.DonBanHang_Sua(donbanhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONBANHANGS/Delete/5
    public async Task<IActionResult> Delete(string madbh)
    {
        return View(_context.DonBanHang_CT(madbh));
    }

    // POST: DONBANHANGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string madbh)
    {
        _context.DonBanHang_Xoa(madbh);
        return RedirectToAction(nameof(Index));
    }

    private bool DonBanHangExists(string madbh)
    {
        return _context.DonBanHangs.Any(e => e.MaDBH == madbh);
    }
}
