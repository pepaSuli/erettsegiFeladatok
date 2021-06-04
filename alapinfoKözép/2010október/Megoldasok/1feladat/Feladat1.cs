using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat1
{

    class rendezo
    {
        private const int max = 30;
        private int[] a = new int[max];
        private int n;

        public void beolvas()
        {
            int kovetkezo;
            int i = 0;
            Console.Write((i + 1) + ". elem: ");
            kovetkezo = int.Parse(Console.ReadLine());
            while ((kovetkezo > 0) && (i < max))
            {
                int j = (i++) - 1;
                while ((j > -1) && (kovetkezo < a[j]))
                {
                    a[j + 1] = a[j--];
                }
                a[j + 1] = kovetkezo;
                if (i < max)
                {
                    Console.Write((i + 1) + ". elem: ");
                    kovetkezo = int.Parse(Console.ReadLine());
                }
            }
            n = i;
        }

        public void kiir()
        {
            Console.WriteLine();
            for (int i = 0; i < n; i++)
            {
                Console.Write(a[i] + " ");
                if ((a[i] % 2) == 0)
                    Console.WriteLine(" (páros) ");
                else
                    Console.WriteLine(" (páratlan) ");
            }
            Console.WriteLine();
            Console.ReadLine();
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            rendezo r = new rendezo();
            r.beolvas();
            r.kiir();
        }
    }
}
