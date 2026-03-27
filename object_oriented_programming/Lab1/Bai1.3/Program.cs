/*
Một loại vi trùng cứ sau mỗi giờ lại nhân đôi. Hỏi ban đầu có n con vi trùng thì sau h giờ số lượng là bao nhiêu?

Input:
- Số lượng vi trùng ban đầu (con)
- Khoảng thời gian (giờ).

Output: Số lượng vi trùng sau khoảng thời gian đã cho.
*/

using System;

namespace Vitrung
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.Write("So vi trung ban dau: ");
            long n = long.Parse(Console.ReadLine());
            Console.Write("So gio vi trung tang: ");
            int h = int.Parse(Console.ReadLine());
            Console.WriteLine("So vi khuan sau {0} gio la: {1}", h, n * Math.Pow(2, h));
            for (int i = 0; i < h; i++) n *= 2;
            Console.WriteLine("So vi khuan sau {0} gio la: {1}", h, n);
            Console.ReadKey();

        }
    }
}
