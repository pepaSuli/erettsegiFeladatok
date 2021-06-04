using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3
{
    class vizallas
    {
        private const int max = 10;
        private int n;
        private int[] vizallasok = new int[max * 2];

        public void feltolt()
        {
            Console.WriteLine("=> Vízállás értékek beolvasása:");
            Console.Write("   Hány nap adatait kívánja beírni? ");
            n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine();
                Console.WriteLine("   "+(i + 1) + ". nap mérései:");
                Console.Write("     Első mérés: ");
                vizallasok[2 * i] = int.Parse(Console.ReadLine());
                Console.Write("     Második mérés: ");
                vizallasok[2 * i + 1] = int.Parse(Console.ReadLine());
                if (vizallasok[2 * i] > vizallasok[2 * i + 1])
                {
                    int s = vizallasok[2 * i];
                    vizallasok[2 * i] = vizallasok[2 * i + 1];
                    vizallasok[2 * i + 1] = s;
                }
            }
        }

        public void kiir()
        {
            Console.WriteLine();
            Console.WriteLine("=> Táblázat:");
            Console.WriteLine();
            Console.WriteLine(String.Format("{0,15}{1,15}{2,15}", "Sorszám", "Minimum (cm)", "Maximum (cm)"));
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine(String.Format("{0,13}{1,14}{2,15}", (i + 1) + ".", vizallasok[2 * i], vizallasok[2 * i + 1]));
            }
            Console.WriteLine();
            Console.ReadLine();
        }

        public int atlagingadozas()
        {
            int s = 0;
            for (int i = 0; i < n; i++)
            {
                s += vizallasok[2 * i + 1] - vizallasok[2 * i];
            }
            return (int) Math.Round(s / (double)n);
        }

        public void vizsgal()
        {
            bool l = false;
            int i = 0;
            int ad = atlagingadozas();
            Console.WriteLine("=> Számítások");
            Console.WriteLine("   Az átlagos napi ingadozás: " + ad);
            while ((i < n) && !(l))
            {
                if (vizallasok[2 * i + 1] - vizallasok[2 * i] > ad)
                {
                    l = true;
                }
                i++;
            }
            if (l)
              Console.WriteLine("   Az első nap sorszáma, amelyen az átlagosnál nagyobb volt az ingadozás: " + i+".");
            else
              Console.WriteLine("   Egyik napon sem tért el az ingadozás az átlagostól!");
            Console.ReadLine();
        }


        class Program
        {
            static void Main(string[] args)
            {
                vizallas v = new vizallas();
                v.feltolt();
                v.kiir();
                v.vizsgal();
            }
        }
    }
}