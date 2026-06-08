using AttendanceAPI.Data;
using AttendanceAPI.Hubs;
using AttendanceAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace AttendanceAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AttendanceController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly IHubContext<AttendanceHub> _hub;

    public AttendanceController(AppDbContext db, IHubContext<AttendanceHub> hub)
    {
        _db = db;
        _hub = hub;
    }

    [HttpPost("checkin")]
    public async Task<IActionResult> CheckIn([FromBody] CheckInRequest request)
    {
        var student = await _db.Students
            .FirstOrDefaultAsync(s => s.UID == request.UID);

        if (student == null)
            return NotFound(new
            {
                status = "NOT_FOUND",
                message = "UID chưa đăng ký"
            });

        bool alreadyCheckedIn = await _db.Attendances
            .AnyAsync(a =>
                a.StudentId == student.Id &&
                a.CheckInTime.Date == DateTime.Today);

        if (alreadyCheckedIn)
            return Conflict(new
            {
                status = "DUPLICATE",
                message = "Đã điểm danh hôm nay",
                studentName = student.FullName
            });

        var attendance = new Attendance
        {
            StudentId = student.Id,
            CheckInTime = DateTime.Now
        };

        _db.Attendances.Add(attendance);
        await _db.SaveChangesAsync();

        // Push real-time lên Dashboard
        await _hub.Clients.All.SendAsync("NewCheckIn", new
        {
            uid = student.UID,
            studentCode = student.StudentCode,
            fullName = student.FullName,
            className = student.ClassName,
            checkInTime = attendance.CheckInTime
        });

        return Ok(new
        {
            status = "SUCCESS",
            studentCode = student.StudentCode,
            studentName = student.FullName,
            className = student.ClassName,
            checkInTime = attendance.CheckInTime
        });
    }

    [HttpGet("today")]
    public async Task<IActionResult> GetToday()
    {
        var records = await _db.Attendances
            .Include(a => a.Student)
            .Where(a => a.CheckInTime.Date == DateTime.Today)
            .OrderBy(a => a.CheckInTime)
            .Select(a => new
            {
                a.Student.UID,
                a.Student.StudentCode,
                a.Student.FullName,
                a.Student.ClassName,
                a.CheckInTime
            })
            .ToListAsync();

        return Ok(new
        {
            date = DateTime.Today,
            total = records.Count,
            records
        });
    }

    [HttpGet("history")]
    public async Task<IActionResult> GetHistory(
        [FromQuery] string? uid,
        [FromQuery] DateTime? from,
        [FromQuery] DateTime? to)
    {
        var query = _db.Attendances
            .Include(a => a.Student)
            .AsQueryable();

        if (!string.IsNullOrEmpty(uid))
            query = query.Where(a => a.Student.UID == uid);

        if (from.HasValue)
            query = query.Where(a => a.CheckInTime.Date >= from.Value.Date);

        if (to.HasValue)
            query = query.Where(a => a.CheckInTime.Date <= to.Value.Date);

        var records = await query
            .OrderByDescending(a => a.CheckInTime)
            .Select(a => new
            {
                a.Student.UID,
                a.Student.StudentCode,
                a.Student.FullName,
                a.Student.ClassName,
                a.CheckInTime
            })
            .ToListAsync();

        return Ok(new { total = records.Count, records });
    }
}

public record CheckInRequest(string UID);