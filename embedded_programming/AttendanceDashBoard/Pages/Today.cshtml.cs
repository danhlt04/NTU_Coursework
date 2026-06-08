using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace AttendanceDashboard.Pages;

public class TodayModel : PageModel
{
    private readonly IHttpClientFactory _http;
    public List<AttendanceRecord> Records { get; set; } = new();

    public TodayModel(IHttpClientFactory http) => _http = http;

    public async Task OnGetAsync()
    {
        var client = _http.CreateClient("API");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        try
        {
            var res = await client.GetStringAsync("/api/attendance/today");
            var doc = JsonSerializer.Deserialize<JsonElement>(res, options);
            Records = doc.GetProperty("records")
                .Deserialize<List<AttendanceRecord>>(options) ?? new();
        }
        catch { }
    }
}