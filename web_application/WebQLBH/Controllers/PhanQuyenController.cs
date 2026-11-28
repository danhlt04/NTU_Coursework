using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Data;
using WebQLBH.Models;

public class PhanQuyenController : Controller
{
    private readonly AppDbContext _context;

    public PhanQuyenController(AppDbContext context)
    {
        _context = context;
    }

    // GET: PHANQUYENS
    public async Task<IActionResult> Index()    
    {
        return View(await _context.PhanQuyen_DS());
    }

    // GET: PHANQUYENS/Details/5
    public IActionResult Details(byte maquyen, byte manv)
    {
        return View(_context.PhanQuyen_CT(maquyen, manv));
    }

    // GET: PHANQUYENS/Create
    public IActionResult Create()
    {
        ViewBag.Quyens = new SelectList(_context.Quyen_DS(), "MaQuyen", "TenQuyen");
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV");
        return View();
    }

    // POST: PHANQUYENS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("MaQuyen,MaNV,Quyen,NhanVien")] PhanQuyen phanquyen)
    {
        _context.PhanQuyen_Them(phanquyen);
        return RedirectToAction(nameof(Index));
    }

    // GET: PHANQUYENS/Edit/5
    public IActionResult Edit(byte maquyen, byte manv)
    {
        var pq = _context.PhanQuyen_CT(maquyen, manv);
        ViewBag.Quyens = new SelectList(_context.Quyen_DS(), "MaQuyen", "TenQuyen", pq.MaQuyen);
        ViewBag.NhanViens = new SelectList(_context.NhanVien_DS(), "MaNV", "TenNV", pq.MaNV);
        return View(pq);
    }

    // POST: PHANQUYENS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(byte MaQuyenCu, byte MaNVCu, [Bind("MaQuyen,MaNV,Quyen,NhanVien")] PhanQuyen pq)
    {
        _context.PhanQuyen_Sua(MaQuyenCu, MaNVCu, pq);
        return RedirectToAction(nameof(Index));
    }

    // GET: PHANQUYENS/Delete/5
    public IActionResult Delete(byte maquyen, byte manv)
    {
        return View(_context.PhanQuyen_CT(maquyen, manv));
    }

    // POST: PHANQUYENS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(byte maquyen, byte manv)
    {
        _context.PhanQuyen_Xoa(maquyen, manv);
        return RedirectToAction(nameof(Index));
    }

    private bool PhanQuyenExists(byte? maquyen, byte? manv)
    {
        return _context.PhanQuyens.Any(e => e.MaQuyen == maquyen && e.MaNV == manv);
    }
}
