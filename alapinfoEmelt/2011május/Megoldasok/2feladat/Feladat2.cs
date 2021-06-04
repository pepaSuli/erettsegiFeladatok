using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2
{
    
    class Tenisz
    {
        private double v;
        private int alfa;
        private double sSzamitott, sMert;
        private int n;

        public Tenisz()
        {
            beolvas_feldolgoz();
        }

        public void beolvas_feldolgoz()
        {
            bool kilep = false;
            n = 0;
            int ind = -1;
            int maxelteres = 0;
            Console.WriteLine("=> Adatok beolvasása:");
            Console.WriteLine();
            do
            {
                Console.WriteLine((n + 1) + ". lövés: ");
                Console.WriteLine("  Kezdősebesség (m/s) ");
                do
                {
                    Console.Write("    >");
                    v = Double.Parse(Console.ReadLine());
                }
                while (!((v >= 0) && (v <= 40)));
                kilep = (v == 0);
                if (!kilep)
                {
                    Console.WriteLine("  Szög (fok) ");
                    do
                    {
                        Console.Write("    >");
                        alfa = int.Parse(Console.ReadLine());
                    }
                    while (!((alfa > 0) && (alfa < 90)));
                    Console.WriteLine("  Mért távolság (m) ");
                    do
                    {
                        Console.Write("    >");
                        sMert = Double.Parse(Console.ReadLine());
                    }
                    while (!(sMert > 0));

                    sSzamitott = v * v * Math.Sin(Math.PI * 2 * alfa / 180) / 9.81;
                    int elteres = (int)Math.Round(((Math.Abs(sMert / sSzamitott - 1)) * 100));

                    Console.WriteLine("\n  Számított távolság: "+sSzamitott+" m");
                    Console.WriteLine("  Eltérés           : " + elteres + " %\n");


                    if (elteres > maxelteres)
                    {
                        maxelteres = elteres;
                        ind = n;
                    }
                    n++;

                }
            }
            while (!kilep);

            if (n > 0)
            {
                Console.WriteLine("=> Eredmény:");
                Console.WriteLine();
                Console.WriteLine("  A mért és a számított érték között a legnagyobb eltérés a(z) " + (ind + 1) +
                                    ". lövésnél volt.");
            }
            Console.ReadLine();
        }


    }
    class Program
    {
        static void Main(string[] args)
        {
            Tenisz t = new Tenisz();
        }
    }
}
