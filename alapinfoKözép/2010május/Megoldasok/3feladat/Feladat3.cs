using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3
{
    class Felmeres
    {
        private const int n = 10;
        private struct adat
        {
            public double min, max, kul;
        }
        private adat[] ido = new adat[n];

        public void feltolt()
        {
            System.Console.WriteLine("=> Időeredmények beolvasása:");
            for (int i = 0; i < n; i++)
            {
                System.Console.WriteLine();
                System.Console.WriteLine((i + 1) + ". alkalmazott eredményei:");
                System.Console.Write("  Minimális idő (s): ");
                ido[i].min = Math.Round(double.Parse(System.Console.ReadLine()) * 10) / 10;
                do
                {
                    System.Console.Write("  Maximális idő (s): ");
                    ido[i].max = Math.Round(double.Parse(System.Console.ReadLine())*10)/10;
                    if (ido[i].max < ido[i].min)
                    {
                        System.Console.WriteLine("  A maximális idő nem lehet kisebb a minimálisnál!");
                    }
                    else
                        ido[i].kul = ido[i].max - ido[i].min;
                }
                while (ido[i].max < ido[i].min);
            }
        }

        public void kiir()
        {
            System.Console.WriteLine();
            System.Console.WriteLine("=> Táblázat:");
            System.Console.WriteLine();
            System.Console.WriteLine(String.Format("{0,15}{1,15}{2,15}{3,15}", "Sorszám", "Minimum (s)", "Maximum (s)", "Különbség (s)"));
            for (int i = 0; i < n; i++)
            {
                System.Console.WriteLine(String.Format("{0,13}{1,14:0.0}{2,15:0.0}{3,15:0.0}", (i + 1).ToString() + ".",ido[i].min, ido[i].max, ido[i].kul));
            }
            System.Console.WriteLine();         
        }

        public void vizsgal()
        {
            int maxind = 0;
            for (int i = 1; i < n; i++)
            {
                if (ido[i].kul>ido[maxind].kul)
                {
                    maxind = i;
                }
            }
            System.Console.WriteLine("=> Eredmény: a legnagyobb különbség a(z) " + (maxind + 1) + ". alkalmazott esetében volt.");
            System.Console.ReadLine();
        }
    }


    class Program
    {
        static void Main(string[] args)
        {
            Felmeres m = new Felmeres();
            m.feltolt();
            m.kiir();
            m.vizsgal();
        }
    }
}