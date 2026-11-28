
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class QuyenController : Controller
{
    private readonly AppDbContext _context;

    public QuyenController(AppDbContext context)
    {
        _context = context;
    }

    // GET: QUYENS
    public IActionResult Index()    
    {
        return View(_context.Quyen_DS());
    }

    // GET: QUYENS/Details/5
    public async Task<IActionResult> Details(byte maquyen)
    {
        return View(_context.Quyen_CT(maquyen));
    }

    // GET: QUYENS/Create
    public IActionResult Create()
    {
        return View();
    }

    // POST: QUYENS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Create([Bind("MaQuyen,TenQuyen,MoTa")] Quyen quyen)
    {
        _context.Quyen_Them(quyen);
        return RedirectToAction(nameof(Index));
    }

    // GET: QUYENS/Edit/5
    public async Task<IActionResult> Edit(Quyen quyen)
    {
        return View(_context.Quyen_CT(quyen.MaQuyen));
    }

    // POST: QUYENS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(byte maquyen, [Bind("MaQuyen,TenQuyen,MoTa")] Quyen quyen)
    {
        _context.Quyen_Sua(quyen);
        return RedirectToAction(nameof(Index));
    }

    // GET: QUYENS/Delete/5
    public async Task<IActionResult> Delete(Quyen quyen)
    {
        return View(_context.Quyen_CT(quyen.MaQuyen));
    }

    // POST: QUYENS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(Quyen quyen)
    {
        _context.Quyen_Xoa(quyen.MaQuyen);
        return RedirectToAction(nameof(Index));
    }

    private bool QuyenExists(byte? maquyen)
    {
        return _context.Quyens.Any(e => e.MaQuyen == maquyen);
    }
}
