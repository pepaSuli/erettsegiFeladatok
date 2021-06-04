using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3
{
    enum uzenet
    {
        vegjel = -1,
        hiba = -2
    }

    class Meteor
    {
        private const int max = 20;
        private int n;

        private int[] idok = new int[max];

        public int idomp(string s)
        {
            if (s.Length == 0)
                return (int)uzenet.vegjel;
            else if ((s.Length == 5) && (s[2] == ':'))
            {
                int perc = int.Parse(s.Substring(0, 2));
                int mperc = int.Parse(s.Substring(3, 2));
                if ((perc >= 0) && (perc <= 59) && (mperc >= 0) && (mperc <= 59))
                {
                    return perc * 60 + mperc;
                }
                else return (int)uzenet.hiba; ;
            }
            else
                return (int)uzenet.hiba; ;
        }

        public void feltolt()
        {
            Console.WriteLine("=> Észlelési idők beolvasása:");

            int i = 0;
            Console.WriteLine();
            Console.WriteLine("Következő észlelési idő:");
            int ido;
            do{ Console.Write("> ");
                ido = idomp(Console.ReadLine());}
            while (ido == (int)uzenet.hiba);
            while (!(ido == (int)uzenet.vegjel) && (i < max))
            {
                idok[i++] = ido;
                Console.WriteLine();
                if (i < max)
                {
                    Console.WriteLine("Következő észlelési idő:");
                    do
                    {
                        Console.Write("> ");
                        ido = idomp(Console.ReadLine());
                    }
                    while (ido == (int)uzenet.hiba);
                }
            }
            n = i;
        }

        public void rendez()
        {
            for (int i = 0; i < n - 1; i++)
            {
                for (int j = i + 1; j < n; j++)
                {
                    if (idok[j] < idok[i])
                    {
                        int s = idok[i];
                        idok[i] = idok[j];
                        idok[j] = s;
                    }
                }
            }
        }

        public void kiir()
        {
            Console.WriteLine();
            Console.WriteLine("=> Táblázat:");
            Console.WriteLine();
            Console.WriteLine(String.Format("{0,15}{1,13}{2,18}", "Sorszám", "Perc", "Másodperc"));
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine(String.Format("{0,13}{1,14}{2,15}", (i + 1).ToString() + ".", idok[i] / 60, idok[i] % 60));
            }
            Console.WriteLine();
        }

        public void keres()
        {
            Console.WriteLine();
            Console.WriteLine("=> Az első olyan észlelés, amelyet 3 mp-en belül két másik követ\n");
            int i = -1;
            bool l = false;
            while ((i < n - 3) && !(l))
            {
                i++;
                l = (idok[i + 1] - idok[i] <= 3) && (idok[i + 2] - idok[i] <= 3);
            }
            if (l)
                Console.WriteLine(" Sorszám: "+(i+1) );
            else
                Console.WriteLine(" Nincs ilyen észlelés!");
            Console.ReadLine();
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Meteor m = new Meteor();
            m.feltolt();
            m.rendez();
            m.kiir();
            m.keres();
        }
    }
}