namespace AttendanceAPI.Models;

public class Student
{
    public int Id { get; set; }
    public string UID { get; set; } = "";
    public string StudentCode { get; set; } = "";
    public string FullName { get; set; } = "";
    public string ClassName { get; set; } = "";

    public ICollection<Attendance> Attendances { get; set; } = new List<Attendance>();
}