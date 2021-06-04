using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2A
{
    class PrimPakolo
    {
        private const int n = 20;
        private int[] a = new int[n];
        private Random r = new Random();

        public void feltolt()
        {
            for (int i = 0; i < n; i++)
            {
                a[i] = r.Next(2, 1000);
            }
        }

        public void kiir()
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write(a[i] + (i < n - 1 ? ", " : "."));
            }
            Console.ReadLine();
        }

        private bool prim(int a)
        {
            int i = 2;
            while ((i <= Math.Sqrt(a)) && (a % i != 0))
            {
                i++;
            }
            return !(i <= Math.Sqrt(a));
        }

        public void primpakol()
        {
            int e = 0;
            int v = n - 1;
            int s = a[0];
            while (e < v)
            {
                while ((e < v) && !(prim(a[v])))
                {
                    v--;
                }
                if (e < v)
                {
                    a[e] = a[v];
                    e++;
                    while ((e < v) && prim(a[e]))
                    {
                        e++;
                    }
                    if (e < v)
                    {
                        a[v] = a[e];
                        v--;
                    }
                }
            }
            a[e] = s;
        }

    class Program
    {
            static void Main(string[] args)
            {
                PrimPakolo p = new PrimPakolo();
                p.feltolt();
                p.kiir();
                p.primpakol();
                p.kiir();
            }
        }
    }
}

