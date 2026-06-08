using AttendanceAPI.Data;
using AttendanceAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AttendanceAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class StudentsController : ControllerBase
{
    private readonly AppDbContext _db;
    public StudentsController(AppDbContext db) => _db = db;

    // GET api/students
    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        var students = await _db.Students
            .OrderBy(s => s.FullName)
            .ToListAsync();
        return Ok(students);
    }

    // GET api/students/A001
    [HttpGet("{uid}")]
    public async Task<IActionResult> GetByUID(string uid)
    {
        var student = await _db.Students
            .FirstOrDefaultAsync(s => s.UID == uid);

        if (student == null)
            return NotFound(new { message = "Không tìm thấy sinh viên" });

        return Ok(student);
    }

    // POST api/students
    [HttpPost]
    public async Task<IActionResult> Create([FromBody] Student student)
    {
        // Kiểm tra UID đã tồn tại chưa
        bool exists = await _db.Students.AnyAsync(s => s.UID == student.UID);
        if (exists)
            return Conflict(new { message = "UID đã tồn tại" });

        _db.Students.Add(student);
        await _db.SaveChangesAsync();
        return Ok(student);
    }

    // PUT api/students/A001
    [HttpPut("{uid}")]
    public async Task<IActionResult> Update(string uid, [FromBody] Student updated)
    {
        var student = await _db.Students
            .FirstOrDefaultAsync(s => s.UID == uid);

        if (student == null)
            return NotFound(new { message = "Không tìm thấy sinh viên" });

        student.FullName = updated.FullName;
        student.ClassName = updated.ClassName;

        await _db.SaveChangesAsync();
        return Ok(student);
    }

    // DELETE api/students/A001
    [HttpDelete("{uid}")]
    public async Task<IActionResult> Delete(string uid)
    {
        var student = await _db.Students
            .FirstOrDefaultAsync(s => s.UID == uid);

        if (student == null)
            return NotFound(new { message = "Không tìm thấy sinh viên" });

        _db.Students.Remove(student);
        await _db.SaveChangesAsync();
        return Ok(new { message = "Đã xoá sinh viên" });
    }
}