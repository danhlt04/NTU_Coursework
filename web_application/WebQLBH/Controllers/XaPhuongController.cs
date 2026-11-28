
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using Microsoft.AspNetCore.Mvc.Rendering;

public class XaPhuongController : Controller
{
    private readonly AppDbContext _context;

    public XaPhuongController(AppDbContext context)
    {
        _context = context;
    }

    // GET: XAPHUONGS
    public async Task<IActionResult> Index()    
    {
        return View(_context.XaPhuong_DS());
    }

    // GET: XAPHUONGS/Details/5
    public async Task<IActionResult> Details(string? maxp)
    {
        return View(_context.XaPhuong_CT(maxp));
    }

    // GET: XAPHUONGS/Create
    public IActionResult Create()
    {
        ViewBag.Tinhs = new SelectList(_context.Tinh_DS(), "MaTinh", "TenTinh");
        return View();
    }

    // POST: XAPHUONGS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaXP,TenXP,MaTinh,tinh")] XaPhuong xaphuong)
    {
        _context.XaPhuong_Them(xaphuong.MaXP, xaphuong.TenXP, xaphuong.MaTinh);
        return RedirectToAction(nameof(Index));
    }

    // GET: XAPHUONGS/Edit/5
    public async Task<IActionResult> Edit(string? maxp)
    {
        ViewBag.Tinhs = new SelectList(_context.Tinh_DS(), "MaTinh", "TenTinh");
        return View(_context.XaPhuong_CT(maxp));
    }

    // POST: XAPHUONGS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string? maxp, [Bind("MaXP,TenXP,MaTinh,tinh")] XaPhuong xaphuong)
    {
        _context.XaPhuong_Sua(xaphuong.MaXP, xaphuong.TenXP, xaphuong.MaTinh);
        return RedirectToAction(nameof(Index));
    }

    // GET: XAPHUONGS/Delete/5
    public async Task<IActionResult> Delete(string? maxp)
    {
        return View(_context.XaPhuong_CT(maxp));
    }

    // POST: XAPHUONGS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string? maxp)
    {
        _context.XaPhuong_Xoa(maxp);
        return RedirectToAction(nameof(Index)); 
    }

    private bool XaPhuongExists(string? maxp)
    {
        return _context.XaPhuongs.Any(e => e.MaXP == maxp);
    }
}
