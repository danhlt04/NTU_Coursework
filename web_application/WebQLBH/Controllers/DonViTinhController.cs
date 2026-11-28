
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class DonViTinhController : Controller
{
    private readonly AppDbContext _context;

    public DonViTinhController(AppDbContext context)
    {
        _context = context;
    }

    // GET: DONVITINHS 
    public IActionResult Index()
    {
        return View(_context.DonViTinh_DS());
    }

    // GET: DONVITINHS/Details/5
    public async Task<IActionResult> Details(byte madvt)
    {
        return View(_context.DonViTinh_CT(madvt));
    }

    // GET: DONVITINHS/Create
    public IActionResult Create()
    {
        return View();
    }

    // POST: DONVITINHS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Create([Bind("MaDVT,TenDVT")] DonViTinh dvt)
    {
        _context.DonViTinh_Them(dvt);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONVITINHS/Edit/5
    public async Task<IActionResult> Edit(DonViTinh dvt)
    {
        return View(_context.DonViTinh_CT(dvt.MaDVT));
    }

    // POST: DONVITINHS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(byte madvt, [Bind("MaDVT,TenDVT")] DonViTinh dvt)
    {
        _context.DonViTinh_Sua(dvt);
        return RedirectToAction(nameof(Index));
    }

    // GET: DONVITINHS/Delete/5
    public async Task<IActionResult> Delete(DonViTinh dvt)
    {
        return View(_context.DonViTinh_CT(dvt.MaDVT));
    }

    // POST: DONVITINHS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(DonViTinh dvt)
    {
        _context.DonViTinh_Xoa(dvt.MaDVT);
        return RedirectToAction(nameof(Index));
    }

    private bool DonViTinhExists(byte madvt)
    {
        return _context.DonViTinhs.Any(e => e.MaDVT == madvt);
    }
}
