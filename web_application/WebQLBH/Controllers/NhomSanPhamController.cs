
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class NhomSanPhamController : Controller
{
    private readonly AppDbContext _context;

    public NhomSanPhamController(AppDbContext context)
    {
        _context = context;
    }

    // GET: NHOMSANPHAMS
    public async Task<IActionResult> Index()    
    {
        return View(_context.NhomSanPham_DS());
    }

    // GET: NHOMSANPHAMS/Details/5
    public async Task<IActionResult> Details(byte mansp)
    {
        return View(_context.NhomSP_CT(mansp));
    }

    // GET: NHOMSANPHAMS/Create
    public IActionResult Create()
    {
        return View();
    }

    // POST: NHOMSANPHAMS/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Create(NhomSanPham nhomsanpham)
    {
        _context.NhomSP_Them(nhomsanpham);
        return RedirectToAction(nameof(Index));
    }

    // GET: NHOMSANPHAMS/Edit/5
    public async Task<IActionResult> Edit(byte mansp)
    {
        return View(_context.NhomSP_CT(mansp));
    }

    // POST: NHOMSANPHAMS/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(NhomSanPham nhomsanpham)
    {
        _context.NhomSP_Sua(nhomsanpham);
        return RedirectToAction(nameof(Index));
    }

    // GET: NHOMSANPHAMS/Delete/5
    public async Task<IActionResult> Delete(byte mansp)
    {
        return View(_context.NhomSP_CT(mansp));
    }

    // POST: NHOMSANPHAMS/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(byte mansp)
    {
        _context.NhomSP_Xoa(mansp);
        return RedirectToAction(nameof(Index));
    }

    private bool NhomSanPhamExists(byte? mansp)
    {
        return _context.NhomSanPhams.Any(e => e.MaNSP == mansp);
    }
}
