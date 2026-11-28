
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class TinhController : Controller
{
    private readonly AppDbContext _context;

    public TinhController(AppDbContext context)
    {
        _context = context;
    }

    // GET: TINHS
    public async Task<IActionResult> Index()    
    {
        return View(_context.Tinh_DS());
    }

    // GET: TINHS/Details/5
    public async Task<IActionResult> Details(string matinh)
    {
        return View(_context.Tinh_CT(matinh));
    }

    // GET: TINHS/Create
    public IActionResult Create()
    {
        return View();
    }

    // POST: TINHS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaTinh,TenTinh")] Tinh tinh)
    {
        _context.Tinh_Them(tinh.MaTinh, tinh.TenTinh);
        return RedirectToAction(nameof(Index));
    }

    // GET: TINHS/Edit/5
    public async Task<IActionResult> Edit(Tinh tinh)
    {
        return View(_context.Tinh_CT(tinh.MaTinh));
    }

    // POST: TINHS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string? matinh, [Bind("MaTinh,TenTinh")] Tinh tinh)
    {
        _context.Tinh_Sua(tinh.MaTinh, tinh.TenTinh);
        return RedirectToAction(nameof(Index));
    }

    // GET: TINHS/Delete/5
    public async Task<IActionResult> Delete(Tinh tinh)
    {
        return View(_context.Tinh_CT(tinh.MaTinh));
    }

    // POST: TINHS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(string? matinh)
    {
        _context.Tinh_Xoa(matinh);
        return RedirectToAction(nameof(Index));
    }

    private bool TinhExists(string? matinh)
    {
        return _context.Tinhs.Any(e => e.MaTinh == matinh);
    }
}
