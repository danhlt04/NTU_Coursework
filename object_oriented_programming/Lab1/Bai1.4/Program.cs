using System;

namespace Array
{
    internal class Program
    {
        static void Main(string[] args)
        {

            int[] a = NhapMang();
            Console.Write("Mang da nhap la: "); InMang(a);
            Console.WriteLine("Phan tu lon nhat trong mang la: " + PhanTuLonNhat(a));
            Console.WriteLine("Kiem tra mang co tang dan: " + KiemTraMangTangDan(a));
            BubbleSort(a);
            Console.Write("Mang sau khi sap xep la: "); InMang(a);
            TachMang(a);
            Console.ReadKey();

        }

        static int[] NhapMang()
        {
            int n;
            do
            {
                Console.Write("Nhap so luong phan tu mang: ");
                int.TryParse(Console.ReadLine(), out n);
            } while (n <= 0);
            int[] a = new int[n];
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Nhap phan tu thu {i}: ");
                int.TryParse(Console.ReadLine(), out a[i]);
            }
            return a;
        }

        static void InMang(int[] a)
        {
            foreach (int x in a) Console.Write(x + " ");
            Console.WriteLine();
        }

        static int PhanTuLonNhat(int[] a)
        {
            int ans = a[0];
            foreach (int x in a) ans = Math.Max(ans, x);
            return ans;
        }

        static bool KiemTraMangTangDan(int[] a)
        {
            for (int i = 1; i < a.Length; i++)
            {
                if (a[i] <= a[i - 1]) return false;
            }
            return true;
        }

        static void Swap(ref int a, ref int b)
        {
            int x = a;
            a = b;
            b = x;
        }

        static void BubbleSort(int[] a)
        {
            for (int i = 0; i < a.Length - 1; i++)
            {
                for (int j = 0; j < a.Length - i - 1; j++)
                {
                    if (a[j] > a[j + 1]) Swap(ref a[j], ref a[j + 1]); 
                }
            }
        }

        static void TachMang(int[] a)
        {
            int[] Chan = new int[a.Length], Le = new int[a.Length];
            int i = 0, j = 0;
            foreach (int x in a)
            {
                if ((x & 1) == 1) Le[j++] = x;
                else Chan[i++] = x;
            }
            Console.WriteLine("Mang sau khi tach thanh: ");
            for (int k = 0; k < i; k++) Console.Write(Chan[k] + " ");
            Console.WriteLine();
            for (int k = 0; k < j; k++) Console.Write(Le[k] + " ");
            Console.WriteLine();
        }
    }
}
