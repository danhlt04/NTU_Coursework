
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

public class CTBanHangController : Controller
{
    private readonly AppDbContext _context;

    public CTBanHangController(AppDbContext context)
    {
        _context = context;
    }

    // GET: CTBANHANGS
    public async Task<IActionResult> Index()    
    {
        return View(await _context.CTBanHang_DS());
    }

    // GET: CTBANHANGS/Details/5
    public async Task<IActionResult> Details(string madbh, string masp)
    {
        return View(_context.CTBanHang_CT(madbh, masp));
    }

    // GET: CTBANHANGS/Create
    public IActionResult Create()
    {
        ViewBag.DonBanHangs = new SelectList(_context.DonBanHang_DS(), "MaDBH", "MaDBH");
        ViewBag.SanPhams = new SelectList(_context.SanPham_DS(), "MaSP", "TenSP");
        return View();
    }

    // POST: CTBANHANGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaDBH,MaSP,SLB,DGB,DonBanHang,SanPham")] CTBanHang ctbanhang)
    {
        _context.CTBanHang_Them(ctbanhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: CTBANHANGS/Edit/5
    public async Task<IActionResult> Edit(string madbh, string masp)
    {
        ViewBag.DonBanHangs = new SelectList(_context.DonBanHang_DS(), "MaDBH", "MaDBH");
        ViewBag.SanPhams = new SelectList(_context.SanPham_DS(), "MaSP", "TenSP");
        return View(_context.CTBanHang_CT(madbh, masp));
    }

    // POST: CTBANHANGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string madbh, string masp, [Bind("MaDBH,MaSP,SLB,DGB,DonBanHang,SanPham")] CTBanHang ctbanhang)
    {
        _context.CTBanHang_Sua(madbh, masp, ctbanhang);
        return RedirectToAction(nameof(Index));
    }

    // GET: CTBANHANGS/Delete/5
    public async Task<IActionResult> Delete(string madbh, string masp)
    {
        return View(_context.CTBanHang_CT(madbh, masp));
    }

    // POST: CTBANHANGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string madbh, string masp)
    {
        _context.CTBanHang_Xoa(madbh, masp);
        return RedirectToAction(nameof(Index));
    }

    private bool CTBanHangExists(string madbh, string masp)
    {
        return _context.CTBanHangs.Any(e => e.MaDBH == madbh && e.MaSP == masp);
    }
}
