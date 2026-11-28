
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

public class NhaCungCapController : Controller
{
    private readonly AppDbContext _context;

    public NhaCungCapController(AppDbContext context)
    {
        _context = context;
    }

    // GET: NHACUNGCAPS
    public async Task<IActionResult> Index()    
    {
        return View(_context.NhaCungCap_DS());
    }

    // GET: NHACUNGCAPS/Details/5
    public async Task<IActionResult> Details(short mancc)
    {
        return View(_context.NhaCungCap_CT(mancc));
    }

    // GET: NHACUNGCAPS/Create
    public IActionResult Create()
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        return View();
    }

    // POST: NHACUNGCAPS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaNCC,TenNCC,DienThoai,Email,DiaChi,MaXP,XaPhuong")] NhaCungCap nhacungcap)
    {
        _context.NhaCungCap_Them(nhacungcap);
        return RedirectToAction(nameof(Index));
    }

    // GET: NHACUNGCAPS/Edit/5
    public async Task<IActionResult> Edit(short mancc)
    {
        ViewBag.XaPhuongs = new SelectList(_context.XaPhuong_DS(), "MaXP", "TenXP");
        return View(_context.NhaCungCap_CT(mancc));
    }

    // POST: NHACUNGCAPS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(short? mancc, [Bind("MaNCC,TenNCC,DienThoai,Email,DiaChi,MaXP,XaPhuong")] NhaCungCap nhacungcap)
    {
        _context.NhaCungCap_Sua(nhacungcap);
        return RedirectToAction(nameof(Index));
    }

    // GET: NHACUNGCAPS/Delete/5
    public async Task<IActionResult> Delete(short mancc)
    {
        return View(_context.NhaCungCap_CT(mancc));
    }

    // POST: NHACUNGCAPS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(short mancc)
    {
        _context.NhaCungCap_Xoa(mancc);
        return RedirectToAction(nameof(Index));
    }

    private bool NhaCungCapExists(short? mancc)
    {
        return _context.NhaCungCaps.Any(e => e.MaNCC == mancc);
    }
}
