using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace KeszthelySprint
{
    class Versenyző
    {

        public string név { get; private set; }
        public int szül { get; private set; }
        public int rajtszám { get; private set; }
        public char nem { get; private set; }
        public string kat { get; private set; }
        public TimeSpan eredmény { get; private set; }

        public Versenyző(string[] m)
        {
            név = m[0];
            szül = int.Parse(m[1]);
            rajtszám = int.Parse(m[2]);
            nem = char.Parse(m[3]);
            kat = m[4];
            eredmény = TimeSpan.Parse(m[5]) + //úszás
                       TimeSpan.Parse(m[6]) + //depó1
                       TimeSpan.Parse(m[7]) + //kerékpározás
                       TimeSpan.Parse(m[8]) + //depó2
                       TimeSpan.Parse(m[9]); //futás
        }

        public int kor { get { return 2014 - szül; } }
    }



    class KeszthelySprint
    {
        static void Main()
        {
            //1. feladat: Adatszerkezet kialakítása, adatok betöltése
            List<Versenyző> versenyzők = new List<Versenyző>();
            foreach (var i in File.ReadAllLines("Eredmenyek.txt",Encoding.Default)) versenyzők.Add(new Versenyző(i.Split(';')));

            //2. feladt: Hány versenyző fejezte be a versenyt?
            Console.WriteLine("2. feladat: A versenyt {0} versenyző fejezte be.", versenyzők.Count);

            //3. Feladat: Versenyzők száma az "elit junior" kategóriában:

            int elitJunior = 0;
            foreach (var i in versenyzők) if (i.kat=="elit junior") elitJunior++;
            Console.WriteLine("3. feladat: Versenyzők száma az \"elit junior\" kategóriában: {0} fő", elitJunior);

            //Egy másik megoldás:  Console.WriteLine("3. feladat: Versenyzők száma az \"elit junior\" kategóriában: {0} fő",versenyzők.Count(x=>x.kat=="elit junior"));


            //4. feladat: Versenyzők átlagéletkora
            double korok_össege = 0;
            foreach (var i in versenyzők) korok_össege += i.kor;
            Console.WriteLine("4. feladat: Átlagéletkor: {0:F1} év.", korok_össege/versenyzők.Count);

            //Egy másik megoldás: Console.WriteLine("4. feladat: Átlagéletkor: {0:F1} év.",versenyzők.Average(x=>x.kor));

            //5. feladat: Kategória rajtszámai
            Console.Write("5. feladat: Kérek egy kategóriát: ");
            string kat = Console.ReadLine();           
            Console.Write("\tRajtszám(ok): ");
            bool rosszKategória = true;
            foreach (var i in versenyzők) if (i.kat == kat) { Console.Write("{0} ", i.rajtszám); rosszKategória = false; }
            if (rosszKategória) Console.Write("Nincs ilyen kategória!");


            //Egy másik megoldás:
            //var rajtszámok = versenyzők.Where(x => x.kat == kat).Select(x => x.rajtszám);
            //Console.Write("\tRajtszám(ok): ");
            //if (rajtszámok.Count() != 0) foreach (var i in rajtszámok) Console.Write("{0} ", i);
            //else Console.Write("Nincs ilyen kategória!");


            //6. Feladat: Legjobb időt elélérő női versenyző

            string  minNév= "";
            TimeSpan minIdő = TimeSpan.MaxValue;
            foreach (var i in versenyzők)
            {
                if (i.nem == 'n' && i.eredmény < minIdő)
                {
                    minIdő = i.eredmény;
                    minNév = i.név;
                }
            }
            Console.WriteLine("\n6. Feladat: A legjobb időt {0} érte el.", minNév);

            //Egy másik megoldás: Console.WriteLine("\n6. Feladat: A legjobb időt {0} érte el.", versenyzők.Where(x => x.nem == 'n').OrderBy(x => x.eredmény).First().név);

            Console.ReadKey();
        }
    }
}
