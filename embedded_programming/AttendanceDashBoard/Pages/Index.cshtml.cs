using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace AttendanceDashboard.Pages;

public class AttendanceRecord
{
    public string UID { get; set; } = "";
    public string StudentCode { get; set; } = "";
    public string FullName { get; set; } = "";
    public string ClassName { get; set; } = "";
    public DateTime CheckInTime { get; set; }
}

public class IndexModel : PageModel
{
    private readonly IHttpClientFactory _http;

    public int TotalStudents { get; set; }
    public int TodayCount { get; set; }
    public int AbsentCount { get; set; }
    public int AttendanceRate { get; set; }
    public List<AttendanceRecord> TodayRecords { get; set; } = new();

    public IndexModel(IHttpClientFactory http) => _http = http;

    public async Task OnGetAsync()
    {
        var client = _http.CreateClient("API");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

        try
        {
            var res = await client.GetStringAsync("/api/students");
            var students = JsonSerializer.Deserialize<List<object>>(res, options);
            TotalStudents = students?.Count ?? 0;
        }
        catch { }

        try
        {
            var res = await client.GetStringAsync("/api/attendance/today");
            var doc = JsonSerializer.Deserialize<JsonElement>(res, options);
            TodayCount = doc.GetProperty("total").GetInt32();
            TodayRecords = doc.GetProperty("records")
                .Deserialize<List<AttendanceRecord>>(options) ?? new();
        }
        catch { }

        AbsentCount = TotalStudents - TodayCount;
        AttendanceRate = TotalStudents > 0
            ? (int)Math.Round((double)TodayCount / TotalStudents * 100)
            : 0;
    }
}