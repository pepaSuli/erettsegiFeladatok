using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3A
{
    class Shell
    {
        private const int n = 20;
        private int[] a = new int[n];
        private Random r = new Random();

        public void Generalas()
        {
            for (int i = 0; i < n; i++)
            {
                a[i] = r.Next(-100, 101);
            }
        }

        public void Kiiras()
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write((a[i]) + " ");
            }
            Console.ReadLine();
        }

        public void ShellRendezes()
        {
            int d = 1;
            while (d * 2 <= n)
            {
                d *= 2;
            }
            d -= 1;
            do
            {
                int i = 0;
                while ((i <= d) && (i + d < n))
                {
                    for (int j = i + d; j < n; j += d)
                    {
                        int x = a[j];
                        int y = j - d;
                        while ((y > -1) && (x < a[y]))
                        {
                            a[y + d] = a[y];
                            y -= d;
                        }
                        a[y + d] = x;
                    }
                    i++;
                }
                d /= 2;
            }
            while (d > 0);
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Shell s=new Shell();
            s.Generalas();
            s.Kiiras();
            s.ShellRendezes();
            s.Kiiras();
        }
    }
}
