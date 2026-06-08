using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text;
using System.Text.Json;

namespace AttendanceDashboard.Pages;

public class StudentItem
{
    public string UID { get; set; } = "";
    public string FullName { get; set; } = "";
    public string ClassName { get; set; } = "";
}

public class StudentsModel : PageModel
{
    private readonly IHttpClientFactory _http;
    private readonly JsonSerializerOptions _options = new() { PropertyNameCaseInsensitive = true };

    public List<StudentItem> Students { get; set; } = new();
    public string Message { get; set; } = "";
    public string MessageType { get; set; } = "success";

    public StudentsModel(IHttpClientFactory http) => _http = http;

    public async Task OnGetAsync()
    {
        var client = _http.CreateClient("API");
        try
        {
            var res = await client.GetStringAsync("/api/students");
            Students = JsonSerializer.Deserialize<List<StudentItem>>(res, _options) ?? new();
        }
        catch { }
    }

    public async Task<IActionResult> OnPostAddAsync(string uid, string fullName, string className)
    {
        var client = _http.CreateClient("API");
        var body = JsonSerializer.Serialize(new { uid, fullName, className });
        var content = new StringContent(body, Encoding.UTF8, "application/json");

        var res = await client.PostAsync("/api/students", content);

        Message = res.IsSuccessStatusCode
            ? "Thêm sinh viên thành công!"
            : "Lỗi: UID đã tồn tại hoặc dữ liệu không hợp lệ.";
        MessageType = res.IsSuccessStatusCode ? "success" : "danger";

        await OnGetAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(string uid)
    {
        var client = _http.CreateClient("API");
        var res = await client.DeleteAsync($"/api/students/{uid}");

        Message = res.IsSuccessStatusCode
            ? "Đã xoá sinh viên."
            : "Lỗi khi xoá sinh viên.";
        MessageType = res.IsSuccessStatusCode ? "success" : "danger";

        await OnGetAsync();
        return Page();
    }
}