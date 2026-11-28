
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

public class CTMuaHangController : Controller
{
    private readonly AppDbContext _context;

    public CTMuaHangController(AppDbContext context)
    {
        _context = context;
    }

    // GET: CTMUAHANGS
    public async Task<IActionResult> Index()    
    {
        return View(await _context.CTMuaHang_DS());
    }

    // GET: CTMUAHANGS/Details/5
    public async Task<IActionResult> Details(string madmh, string masp)
    {
        return View(_context.CTMuaHang_CT(madmh, masp));
    }

    // GET: CTMUAHANGS/Create
    public IActionResult Create()
    {
        ViewBag.DonMuaHangs = new SelectList(_context.DonMuaHang_DS(), "MaDMH", "MaDMH");
        ViewBag.SanPhams = new SelectList(_context.SanPham_DS(), "MaSP", "TenSP");
        return View();
    }

    // POST: CTMUAHANGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaDMH,MaSP,SLM,DGM,DonMuaHang,SanPham")] CTMuaHang ctmuahang)
    {
        _context.CTMuaHang_Them(ctmuahang);
        return RedirectToAction(nameof(Index));
    }

    // GET: CTMUAHANGS/Edit/5
    public async Task<IActionResult> Edit(string madmh, string masp)
    {
        ViewBag.DonMuaHangs = new SelectList(_context.DonMuaHang_DS(), "MaDMH", "MaDMH");
        ViewBag.SanPhams = new SelectList(_context.SanPham_DS(), "MaSP", "TenSP");
        return View(_context.CTMuaHang_CT(madmh, masp));
    }

    // POST: CTMUAHANGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string madmh, string masp, [Bind("MaDMH,MaSP,SLM,DGM,DonMuaHang,SanPham")] CTMuaHang ctmuahang)
    {
        _context.CTMuaHang_Sua(madmh, masp, ctmuahang);
        return RedirectToAction(nameof(Index));
    }

    // GET: CTMUAHANGS/Delete/5
    public async Task<IActionResult> Delete(string madmh, string masp)
    {
        return View(_context.CTMuaHang_CT(madmh, masp));
    }

    // POST: CTMUAHANGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string madmh, string masp)
    {
        _context.CTMuaHang_Xoa(madmh, masp);
        return RedirectToAction(nameof(Index));
    }

    private bool CTMuaHangExists(string madmh, string masp)
    {
        return _context.CTMuaHangs.Any(e => e.MaDMH == madmh && e.MaSP == masp);
    }
}
