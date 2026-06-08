var builder = WebApplication.CreateBuilder(args);

builder.Services.AddRazorPages();

// HttpClient để gọi API
builder.Services.AddHttpClient("API", client =>
{
    client.BaseAddress = new Uri(
        builder.Configuration["ApiBaseUrl"] ?? "http://localhost:5000"
    );
});

var app = builder.Build();

app.UseStaticFiles();
app.UseRouting();
app.MapRazorPages();
app.Run();