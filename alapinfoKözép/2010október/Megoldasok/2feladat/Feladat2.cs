using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2
{
    class Kitalalos
    {
        const int n = 100;
        private int a, b, t;

        public void bekerIntervallum()
        {
            Console.WriteLine("=> Intervallum megadása");
            Console.Write    ("   Adja meg az intervallum alsó határát (egész szám) : ");
            a = int.Parse(Console.ReadLine());
            do
            {
                Console.Write("   Adja meg az intervallum felső határát (egész szám): ");
                b = int.Parse(Console.ReadLine());
            }
            while (a >= b);
        }

        public void  kitalalSzam()
        {

            Console.WriteLine("\n=> Gondoljon egy számra, amely az intervallumba esik!");
            Console.WriteLine("   (Nyomjon meg egy gombot, ha megvan!)");

            Console.ReadLine();

            Console.WriteLine("\n=> A program kitalálja a számot!");
            bool l = false;
            int tippDb = 0;
            ConsoleKeyInfo info;

            do
            {
                t = (a + b) / 2;
                Console.WriteLine("\n  "+(++tippDb)+". tipp: "+t+"\n");
                Console.WriteLine("  Válasszon az alábbiak közül:");
                Console.WriteLine("    1. Erre gondoltam");
                Console.WriteLine("    2. A gondolt szám kisebb, mint a tipp");
                Console.WriteLine("    3. A gondolt szám nagyobb, mint a tipp\n");
                Console.Write("  A válasz sorszáma: ");
                int v = int.Parse(Console.ReadLine());
                switch (v)
                {
                    case 1: l = true; break;
                    case 2: b = t - 1; break;
                    case 3: a = t + 1;break;
                }
            }
            while ((!l) && (a<=b));
            if (l)
                Console.WriteLine("\n  =>A tippek száma: " + tippDb);
            else
                Console.WriteLine("\n  =>Helytelen válasz!");
            Console.ReadLine();
        }

        public Kitalalos()
        {
            bekerIntervallum();
            kitalalSzam();
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Kitalalos k = new Kitalalos();
        }
    }
}
