using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Pontok
{
    class Pont
    {
        public int SSz { get; set; } //Pont sorszáma
        public int Px { get; set; } 
        public int Py { get; set; }
        public bool Törlendő { get; set; }

        public Pont(string ssz, string x, string y)
        {
            SSz = int.Parse(ssz);
            Px = int.Parse(x);
            Py = int.Parse(y);
            Törlendő = false;
        }

        public string XY //csoportok kialakításához
        {
            get { return Px.ToString() + Py.ToString(); }
        }

        public override string ToString()
        {
            return String.Format("P({0,3})={1,3},{2,3}", SSz, Px, Py);
        }
    }

    class Szakasz
    {
        public Pont P1 { get; set; }
        public Pont P2 { get; set; }

        public Szakasz(Pont p1, Pont p2)
        {
            P1 = p1;
            P2 = p2;
        }

        public double Hossz
        {
            get { return Math.Sqrt(Math.Pow(P1.Px - P2.Px, 2) + Math.Pow(P1.Py - P2.Py, 2)); }
        }
    }


    class Pontok
    {
        static void Main()
        {
            List<Pont> pontok = new List<Pont>();
            string[] forrás = File.ReadAllLines("pontok.txt");
            foreach (var i in forrás)
            {
                pontok.Add(new Pont(i.Substring(2, 3), i.Substring(7, 3), i.Substring(11, 3)));
            }

            Console.WriteLine("1. feladat: Pontok száma a pontok.txt állományban: {0} db", pontok.Count());
            Console.WriteLine("2. feladat: Pontok száma az x vagy y tengelyen: {0} db", pontok.Count(x => x.Px == 0 || x.Py == 0));

            Console.WriteLine("3. feladat: Azonos koordinátájú pontok:");

            var azonos = pontok.GroupBy(g => g.XY).Where(g => g.Count() > 1);

            foreach (var i in azonos)
            {
                Console.Write("\tAz x={0,3} y={1,3} koordinátán: ", i.First().Px, i.First().Py);
                for (int j = 0; j < i.Count(); j++)
                {
                    Console.Write("{0}. ", i.ToList()[j].SSz);
                    if (j != 0) i.ToList()[j].Törlendő = true;  //4. feladathoz
                }
                Console.WriteLine();
            }


            //4. feladat:
            Szakasz maxSzakasz = new Szakasz(new Pont("0", "0", "0"), new Pont("0", "0", "0"));
            for (int i = 0; i < pontok.Count - 1; i++)
            {
                for (int j = i + 1; j < pontok.Count; j++)
                {
                    Szakasz aktSzakasz = new Szakasz(pontok[i], pontok[j]);
                    if (aktSzakasz.Hossz > maxSzakasz.Hossz) maxSzakasz = aktSzakasz;
                }
            }

            Console.WriteLine("4. feladat: Leghosszabb szakasz hossza: {0}", maxSzakasz.Hossz);

            Console.WriteLine("5. feladat: max_hossz.txt");
            List<string> ki = new List<string>();
            ki.Add(maxSzakasz.P1.ToString());
            ki.Add(maxSzakasz.P2.ToString());
            File.WriteAllLines("max_hossz.txt", ki);
            Console.ReadKey();
        }
    }
}
