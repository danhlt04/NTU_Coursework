
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

public class DonMuaHangController : Controller
{
    private readonly AppDbContext _context;

    public DonMuaHangController(AppDbContext context)
    {
        _context = context;
    }

    // GET: DONMUAHANGS
    public async Task<IActionResult> Index()    
    {
        return View(_context.DonMuaHang_DS());
    }

    // GET: DONMUAHANGS/Details/5
    public async Task<IActionResult> Details(string madmh)
    {
        return View(_context.DonMuaHang_CT(madmh));
    }

    // GET: DONMUAHANGS/Create
    public IActionResult Create()
    {
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV");
        ViewBag.NhaCungCaps = new SelectList(_context.NhaCungCap_DS(), "MaNCC", "TenNCC"); 
        return View();
    }

    // POST: DONMUAHANGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaDMH,NgayDat,NgayGiao,MaNV,MaNCC,NhanVien,NhaCungCap")] DonMuaHang donmuahang)
    {
        _context.DonMuaHang_Them(donmuahang);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONMUAHANGS/Edit/5
    public async Task<IActionResult> Edit(string madmh)
    {
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV");
        ViewBag.NhaCungCaps = new SelectList(_context.NhaCungCap_DS(), "MaNCC", "TenNCC");
        return View(_context.DonMuaHang_CT(madmh));
    }

    // POST: DONMUAHANGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string madmh, [Bind("MaDMH,NgayDat,NgayGiao,MaNV,MaNCC,NhanVien,NhaCungCap")] DonMuaHang donmuahang)
    {
        _context.DonMuaHang_Sua(donmuahang);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONMUAHANGS/Delete/5
    public async Task<IActionResult> Delete(string madmh)
    {
        return View(_context.DonMuaHang_CT(madmh));
    }

    // POST: DONMUAHANGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string madmh)
    {
        _context.DonMuaHang_Xoa(madmh);
        return RedirectToAction(nameof(Index));
    }

    private bool DonMuaHangExists(string madmh)
    {
        return _context.DonMuaHangs.Any(e => e.MaDMH == madmh);
    }
}
