using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Robot
{
    class Prog
    {
        public string Név { get; private set; }
        public string Program { get; private set; }
        public Prog(string sor)
        {
            Név = sor.Split()[0];
            Program = sor.Split()[1];
        }

        public int IrányváltásokSzáma
        {
            get
            {
                int isz = 0;
                for (int i = 1; i < Program.Length; i++)
                {
                    if (Program[i] != Program[i - 1]) isz++;
                }
                return isz;

            }
        }

        public bool HelyesKódsorozat
        {
            get
            {
                bool helyes = true;
                foreach (var i in Program)
                {
                    if (!"EHJB".Contains(i))
                    {
                        helyes = false;
                        break;
                    }
                }
                return helyes;
            }
        }

        public double Távolság
        {
            get
            {
                if (!HelyesKódsorozat) return -1;
                int x = 0;
                int y = 0;
                foreach (var i in Program)
                {
                    switch (i)
                    {
                        case 'E': x++; break;
                        case 'H': x--; break;
                        case 'J': y--; break;
                        case 'B': y++; break;
                    }
                }
                return (Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2)));
            }
        }
    }
    class Robot
    {
        static void Main(string[] args)
        {
            // 1. Feladat: Adatok beolvasása
            List<Prog> Progs = new List<Prog>();
            foreach (var i in File.ReadAllLines("Progs.txt")) Progs.Add(new Prog(i));

            Console.WriteLine("2. Feladat: Tanulók száma: {0} fő", Progs.Count);

            Console.Write("3. Feladat: Helytelen kódsorozatok száma: ");
            int helytelen = 0;
            foreach (var i in Progs)
            {
                if (!i.HelyesKódsorozat) helytelen++;
            }
            Console.WriteLine(helytelen);

            // 4. Feladat: ivsz.txt
            List<string> ki = new List<string>();
            foreach (var i in Progs)
            {
                if (i.HelyesKódsorozat)  ki.Add(String.Format("{0} {1}", i.Név, i.IrányváltásokSzáma));
            }
            File.WriteAllLines("ivsz.txt", ki);

            Console.Write("5. Feladat: Legtávolabbra jutó robot vezérlését készítette: ");
            int maxi = 0;
            for (int i = 1; i < Progs.Count; i++)
            {
                if (Progs[i].Távolság > Progs[maxi].Távolság) maxi = i;
            }
            Console.WriteLine(Progs[maxi].Név);
        }
    }
}
