using System;
using System.IO;
using System.Collections.Generic;

namespace KorStat
{

    class Kor
    {
        public int ssz { get; set; }
        public int x {get;set;}
        public int y {get;set;}
        public int r {get;set;}

        public Kor(string sor, int ssz)
        {
            this.ssz = ssz;
            string[] adatok = sor.Split(';');
            x = int.Parse(adatok[0]);
            y = int.Parse(adatok[1]);
            r = int.Parse(adatok[2]);
        }
        public double T { get { return r * r * Math.PI; } }
        public bool n1 { get { return x >= r && y >= r; } }
        public bool n2 { get { return x <= -r && y >= r; } }
        public bool n3 { get { return x <= -r && y <= -r; } }
        public bool n4 { get { return x >= r && y <= -r; } }
        public bool n12 { get { return y >= r && !n1 && !n2; } }
        public bool n1234 { get { return Math.Abs(x) < r && Math.Abs(y) < r; } }
    }


    class KorStat
    {
        static double KorvonalTav(Kor k1, Kor k2)
        {
            return Math.Sqrt(Math.Pow(k1.x - k2.x, 2) + Math.Pow(k1.y - k2.y, 2)) - k1.r - k2.r;
        }

        static bool Metszi(Kor k1, Kor k2)
        {
            double tavolsag = Math.Sqrt(Math.Pow(k1.x - k2.x, 2) + Math.Pow(k1.y - k2.y, 2));
            return tavolsag<k1.r+k2.r && tavolsag+Math.Min(k1.r,k2.r)>Math.Max(k1.r,k2.r);
        }


        static void Main()
        {
            //"1. feladat: Beolvasás, sorszámozás, adatszerkezet feltöltése");
            string[] forras = File.ReadAllLines("Korok.txt");
            List<Kor> korok = new List<Kor>();
            int ssz = 0;
            foreach (var i in forras) korok.Add(new Kor(i,++ssz));

            Console.WriteLine("2. feladat: Síknegyed statisztika:");
            int[] nstat = new int[4];
            foreach (var i in korok)
            {
                if (i.n1) nstat[0]++;
                if (i.n2) nstat[1]++;
                if (i.n3) nstat[2]++;
                if (i.n4) nstat[3]++;
            }
            for (int i = 0; i < 4; i++)  Console.WriteLine("\t{0}.negyed: {1} db",i+1,nstat[i]);

            
            Console.WriteLine("3. feladat: Körök területének összege:");
            double szumTer = 0;
            foreach (var i in korok) if (i.n1234) szumTer = szumTer + i.T;
            Console.WriteLine("\tT összes={0:0.00}", szumTer);

            Console.WriteLine("4. feladat: Legtávolabbi körök:");
            int maxk1 = 1;
            int maxk2 = 2;
            double maxTav = 0;
            for (int i = 0; i < korok.Count; i++)
            {
                for (int j = i + 1; j < korok.Count; j++)
                {
                    if (KorvonalTav(korok[i], korok[j]) > maxTav)
                    {
                        maxTav = KorvonalTav(korok[i], korok[j]);
                        maxk1 = korok[i].ssz;
                        maxk2 = korok[j].ssz;
                    }
                }
            }
            Console.WriteLine("\tA(z) {0}. és a(z) {1}. kör körvonala van a legtávolabb!", maxk1, maxk2);
            Console.WriteLine("\tTávolságuk: {0:0.00}",maxTav);

            Console.WriteLine("5. feladat: Egymást metsző körök:");
            List<Kor> korok2 = new List<Kor>();
            foreach (var i in korok) if (i.n12 || i.n1 || i.n2) korok2.Add(i);
            for (int i = 0; i < korok2.Count; i++)
            {
                for (int j = i + 1; j < korok2.Count; j++)
                {
                    if (Metszi(korok2[i], korok2[j]))
                    {
                        Console.WriteLine("\t{0}. metszi {1}.", korok2[i].ssz, korok2[j].ssz);
                    }
                }
            }

            Console.ReadKey();

        }
    }
}
