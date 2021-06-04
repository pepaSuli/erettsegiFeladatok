using System;

namespace ShellSort
{
    class ShellSort
    {
        static void ShellRendezes(int[] a)
        {
            int gap = 1;
            int n = a.Length; //a vektor elemszáma
            while (gap * 2 <= n)
            {
                gap = gap * 2;
            }
            gap = gap - 1;
            do
            {
                int i = 0;
                while (i <= gap && i + gap < n)
                {
                    int j = i + gap;
                    while (j < n)
                    {
                        int x = a[j];
                        int y = j - gap;
                        while (y > -1 && x < a[y])
                        {
                            a[y + gap] = a[y];
                            y = y - gap;
                        }
                        a[y + gap] = x;
                        j = j + gap;
                    }
                    i = i + 1;
                }
                gap = gap / 2;
            }
            while (gap > 0);
        }


        static void Main()
        {
            int[] t = { 63, 54, 33, 45, 23, 99, 43, 12, 35, 87 };
            ShellRendezes(t);
            for (int i = 0; i <= 9; i++)
            {
                Console.WriteLine(t[i]);
            }
            Console.ReadKey();
        }
    }
}
