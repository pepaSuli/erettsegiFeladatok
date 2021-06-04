using System;
using System.Collections.Generic;
using System.IO;

namespace titanic
{
    class Kategória
    {
        public string knév { get; set; }
        public int eltűnt { get; set; }
        public int túlélő { get; set; }

        public Kategória(string s)
        {
            knév = s.Split(';')[0]; //Kategória neve
            túlélő = int.Parse(s.Split(';')[1]);
            eltűnt = int.Parse(s.Split(';')[2]);
        }

        public int upk { get { return eltűnt + túlélő; } } //Utasok száma kategóriákként
        public double aldozat_sz { get { return (double)eltűnt / upk * 100; } }
    }

    class Titanic
    {
        static void Main()
        {
            string[] forrás = File.ReadAllLines("titanic.txt");
            List<Kategória> kategoriák = new List<Kategória>();
            foreach (var i in forrás) kategoriák.Add(new Kategória(i));

            Console.WriteLine("2. feladat: {0} db", forrás.Length);

            int utasokSzáma = 0;
            foreach (var i in kategoriák) utasokSzáma += i.upk;
            Console.WriteLine("3. feladat: {0} fő", utasokSzáma);

            Console.Write("4. feladat: Kulcsszó: ");
            string keres = Console.ReadLine();
            bool találat = false;
            foreach (var i in kategoriák) if (i.knév.Contains(keres)) { találat = true; break;}
            Console.WriteLine("\t{0} találat!", találat ? "Van" : "Nincs");

            Console.WriteLine("5. feladat:");
            foreach (var i in kategoriák) if (i.knév.ToLower().Contains(keres.ToLower()) ) Console.WriteLine("\t{0} {1} fő", i.knév, i.upk);

            Console.WriteLine("6. feladat:");
            foreach (var i in kategoriák) if (i.aldozat_sz > 60) Console.WriteLine("\t{0}", i.knév);

            kategoriák.Sort((a, b) => -1 * a.túlélő.CompareTo(b.túlélő));
            Console.WriteLine("7. feladat: {0}", kategoriák[0].knév);
        }
    }
}