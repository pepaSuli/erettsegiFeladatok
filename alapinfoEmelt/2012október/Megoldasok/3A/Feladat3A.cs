using System;
using System.Collections.Generic;
using System.IO;

namespace SzakaszStat
{
    class szakaszok
    {
        public int ssz { get; private set; }
        public double a { get { return _a; } private set { _a=value;} }
        double _a;
        public double b { get {return _b;} private set { _b=value;} }
        double _b;
        public double c { get { return _c; } private set { _c = value; } }
        double _c;
        public string szin { get; private set; }
        public szakaszok(string sor)
        {
            string[] temp = sor.Split('#');
            ssz = int.Parse(temp[0]);
            _a = double.Parse(temp[1]);
            _b = double.Parse(temp[2]);
            _c = double.Parse(temp[3]);
            if (_a > _c) csere(ref _a, ref _c);
            if (_b > _c) csere(ref _b, ref _c);
            szin = temp[4];
        }

        public bool szerkeszthetoHaromszog
        {
            get { return a + b > c && b + c > a && a + c > b; }
        }

        public double kerulet
        {
            get { return szerkeszthetoHaromszog ? a + b + c : double.NaN; }
        }

        public double terulet //Hérón
        {
            get 
            {
                double s = kerulet / 2;
                return szerkeszthetoHaromszog ? Math.Sqrt(s * (s - a) * (s - b) * (s - c)) : double.NaN; 
            }
        }

        public double terulet2 //Derékszögű háromszög területe
        {
            get
            {
                return szerkeszthetoHaromszog && derekszogu ? a * b / 2 : double.NaN;
            }
        }

        public bool derekszogu
        {
            get
            {
                return Math.Pow(c, 2) == Math.Pow(a, 2) + Math.Pow(b, 2);
            }
        }

        private void csere(ref double sz1, ref double sz2)
        {
            double temp = sz1;
            sz1 = sz2;
            sz2 = temp;
        }
    }


    class Feladat3A
    {
        static void Main()
        {
            //"1. feladat: Beolvasás, adatszerkezet feltöltése");
            string[] forras = File.ReadAllLines("szakaszok.txt");
            List<szakaszok> sz = new List<szakaszok>(); 
            foreach (var i in forras) sz.Add(new szakaszok(i));

            Console.WriteLine("2. feladat:"); //(3)
            int db = 0;
            foreach (var i in sz)
            {
                if (i.szerkeszthetoHaromszog) db++;
            }
            Console.WriteLine("\tMegszerkeszthető háromszögek darabszáma: {0} db", db);

            Console.WriteLine("3. feladat: Legnagyobb területű háromszög sorszáma és területe: "); //(4)
            int maxTerIndex = 0;
            for (int i = 1; i < sz.Count; i++)
            {
                if (sz[i].terulet > sz[maxTerIndex].terulet) maxTerIndex = i;
            }
            Console.WriteLine("\tSsz.: {0}. T={1:0.00}", sz[maxTerIndex].ssz, sz[maxTerIndex].terulet);

            Console.WriteLine("4. feladat: Piros szakaszokból szerkeszthető háromszögek összes területe:"); //(4)
            double szumTer = 0;
            foreach (var i in sz)
            {
                if (i.szin.ToLower() == "piros") szumTer += i.terulet;
            }
            Console.WriteLine("\tT={0:0.00}", szumTer);

            Console.WriteLine("5. feladat: A derékszögű háromszögek adatai"); //(6)

            for (int i = 1; i < sz.Count; i++)
            {
                for (int j = 0; j < sz.Count - i; j++)
                {
                    if (sz[j].ssz > sz[j + 1].ssz)
                    {
                        szakaszok temp = sz[j];
                        sz[j] = sz[j + 1];
                        sz[j + 1] = temp;
                    }
                }
            }

            foreach (var i in sz)
            {
                string ellenorzes;
                if (i.derekszogu)
                {
                    ellenorzes = i.terulet == i.terulet2 ? "Egyenlő!" : "Eltérő!";
                    Console.WriteLine("\tSsz.: {0}. a={1} b={2} c={3} T={4} Ell.:{5} K={6}", i.ssz, i.a, i.b, i.c, i.terulet, ellenorzes, i.kerulet);
                }
            }

            Console.ReadKey();
        }
    }
}

