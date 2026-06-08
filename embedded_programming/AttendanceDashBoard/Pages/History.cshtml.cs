using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace AttendanceDashboard.Pages;

public class HistoryModel : PageModel
{
    private readonly IHttpClientFactory _http;

    public List<AttendanceRecord> Records { get; set; } = new();
    public string FilterUID { get; set; } = "";
    public string FilterFrom { get; set; } = "";
    public string FilterTo { get; set; } = "";

    public HistoryModel(IHttpClientFactory http) => _http = http;

    public async Task OnGetAsync(string? uid, string? from, string? to)
    {
        FilterUID = uid ?? "";
        FilterFrom = from ?? "";
        FilterTo = to ?? "";

        var client = _http.CreateClient("API");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

        var query = "/api/attendance/history?";
        if (!string.IsNullOrEmpty(uid)) query += $"uid={uid}&";
        if (!string.IsNullOrEmpty(from)) query += $"from={from}&";
        if (!string.IsNullOrEmpty(to)) query += $"to={to}&";

        try
        {
            var res = await client.GetStringAsync(query);
            var doc = JsonSerializer.Deserialize<JsonElement>(res, options);
            Records = doc.GetProperty("records")
                .Deserialize<List<AttendanceRecord>>(options) ?? new();
        }
        catch { }
    }
}