using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebQLBH.Models;
using WebQLBH.Data;

public class AccountController : Controller
{
    private readonly AppDbContext _context;
    public AccountController(AppDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult Login(string returnUrl = null)
    {
        ViewData["ReturnUrl"] = returnUrl;
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Login(string TenDN, string MatKhau, string returnUrl = null)
    {
        var MaNV = _context.NhanVien_DangNhap(TenDN, MatKhau);
        if (MaNV == 0)
        {
            ModelState.AddModelError(string.Empty, "Sai tên đăng nhập hoặc mật khẩu.");
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        // Đọc thông tin chi tiết nhân viên và lưu vào session
        var nv = _context.NhanVien_CT(MaNV);
        HttpContext.Session.SetString("Username", nv.TenDN);
        HttpContext.Session.SetString("DisplayName", nv.HoNV+" "+nv.TenNV);

        // Redirect về returnUrl nếu an toàn
        if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
            return Redirect(returnUrl);

        return RedirectToAction("Index", "NhanVien");
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("Username");
        HttpContext.Session.Remove("DisplayName");
        HttpContext.Session.Clear();
        return RedirectToAction("Login");
    }

    public IActionResult AccessDenied()
    {
        return View();
    }
}
