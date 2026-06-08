namespace AttendanceAPI.Models;

public class Attendance
{
    public int Id { get; set; }
    public int StudentId { get; set; }
    public DateTime CheckInTime { get; set; }

    public Student Student { get; set; } = null!;
}