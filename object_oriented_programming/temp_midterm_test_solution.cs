using System;
using System.Collections.Generic;

class XeMay
{
    protected string BienSo;
    protected int NamSanXuat;
    protected long Gia;

    public string bienso
    {
        get { return BienSo; }
        set
        { BienSo = value; }
    }
    public int namsanxuat
    {
        get { return NamSanXuat; }
        set
        {
            if (value >= 1500 || value <= DateTime.Now.Year) NamSanXuat = value;
            else Console.WriteLine("Nam vua nhap khong hop le!");
        }
    }
    public long gia
    {
        get { return Gia; }
        set
        {
            if (value >= 0) Gia = value;
            else Console.WriteLine("Gia vua nhap khong hop le!");
        }
    }

    public XeMay(string bien = "", int nam = 0, long gia = 0)
    {
        BienSo = bien;
        NamSanXuat = nam;
        Gia = gia;
    }

    public void Nhap()
    {
        Console.Write("Bien so xe: ");
        BienSo = Console.ReadLine();
        Console.Write("Nam san xuat: ");
        NamSanXuat = int.Parse(Console.ReadLine());
        Console.Write("Gia ban: ");
        Gia = long.Parse(Console.ReadLine());
    }

    public void Xuat()
    {
        Console.WriteLine($"Bien so xe: {BienSo}");
        Console.WriteLine($"Nam san xuat: {NamSanXuat}");
        Console.WriteLine($"Gia ban: {Gia}");
    }

    public virtual int ThoiHanSuDung()
    {
        return 0;
    }
}

class XeDien : XeMay
{
    private double CongSuat;
    private const int THOIHAN = 10;

    public XeDien(string bien = "", int nam = 0, long gia = 0, double congsuat = 0.0) : base(bien, nam, gia)
    {
        CongSuat = congsuat;
    }

    public void Nhap()
    {
        base.Nhap();
        Console.Write("Cong suat cua xe: ");
        CongSuat = double.Parse(Console.ReadLine());
    }

    public void Xuat()
    {
        base.Xuat();
        Console.WriteLine($"Cong suat cua xe: {CongSuat}");
    }

    public override int ThoiHanSuDung()
    {
        return THOIHAN - (DateTime.Now.Year - NamSanXuat);
    }
}

public static class Program
{
    public static void Main()
    {
        int n;
        do
        {
            Console.Write("Nhap so luong xe dien: ");
            int.TryParse(Console.ReadLine(), out n);
        } while (n <= 0);

        List<XeDien> xediens = new List<XeDien>();

        for (int i = 0; i < n; i++)
        {
            XeDien xedien = new XeDien();
            xedien.Nhap();
            xediens.Add(xedien);
        }

        Console.WriteLine("------------------------");
        Console.WriteLine("Danh sach xe da nhap");
        foreach (var xedien in xediens) xedien.Xuat();
        Console.WriteLine("------------------------");

        Console.WriteLine("------------------------");
        xediens.Sort((a, b) => b.ThoiHanSuDung().CompareTo(a.ThoiHanSuDung()));
        Console.WriteLine("Danh sach xe theo thoi han su dung giam dan");
        foreach (var xedien in xediens) xedien.Xuat();
        Console.WriteLine("------------------------");


        Console.WriteLine("------------------------");
        Console.WriteLine("Danh sach cac xe qua thoi han su dung");
        foreach (var xedien in xediens)
        {
            if (xedien.ThoiHanSuDung() < 0) xedien.Xuat();
        }
        Console.WriteLine("------------------------");

    }
}