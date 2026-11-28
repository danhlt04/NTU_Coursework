
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class PhongBanController : Controller
{
    private readonly AppDbContext _context;

    public PhongBanController(AppDbContext context)
    {
        _context = context;
    }

    // GET: PHONGBANS
    public async Task<IActionResult> Index()    
    {
        return View(_context.PhongBan_DS());
    }

    // GET: PHONGBANS/Details/5
    public async Task<IActionResult> Details(byte mapb)
    {
        return View(_context.PhongBan_CT(mapb));
    }

    // GET: PHONGBANS/Create
    public IActionResult Create()
    {
        return View();
    }

    // POST: PHONGBANS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaPB,TenPB")] PhongBan phongban)
    {
        _context.PhongBan_Them(phongban);
        return RedirectToAction(nameof(Index));
    }

    // GET: PHONGBANS/Edit/5
    public async Task<IActionResult> Edit(byte mapb)
    {
        return View(_context.PhongBan_CT(mapb));
    }

    // POST: PHONGBANS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(byte? mapb, [Bind("MaPB,TenPB")] PhongBan phongban)
    {
        _context.PhongBan_Sua(phongban);
        return RedirectToAction(nameof(Index));
    }

    // GET: PHONGBANS/Delete/5
    public async Task<IActionResult> Delete(byte mapb)
    {
        return View(_context.PhongBan_CT(mapb));
    }

    // POST: PHONGBANS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(byte mapb)
    {
        _context.PhongBan_Xoa(mapb);
        return RedirectToAction(nameof(Index));
    }

    private bool PhongBanExists(byte? mapb)
    {
        return _context.PhongBans.Any(e => e.MaPB == mapb);
    }
}
