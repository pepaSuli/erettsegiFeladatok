using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace erettsegi15_Anagramma
{
    class Szó
    {
        public string Pszó { get; private set; }

        public string Rszó { get { return new String(Pszó.OrderBy(x => x).ToArray());}}

        public int KülönbözőKarakterekSzáma { get { return Pszó.GroupBy(x => x).Count();}}

        public string KülönbözőKarakterek { get { return Pszó.GroupBy(x => x).Aggregate("", (c, n) => c + " " + n.Key); } }

        public Szó(string sor){ Pszó = sor; }

        public bool AnagrammaE(Szó másikSzó) { return Rszó == másikSzó.Rszó; }
    }

    class Anagramma
    {
        static void Main()
        {
            Console.WriteLine("1. Feladat: Statisztika - Kérek egy szöveget:");
            var stat = new Szó(Console.ReadLine());
            Console.Write("Különböző karakterek száma: {0} db Katakterek: ", stat.KülönbözőKarakterekSzáma);
            Console.WriteLine(stat.KülönbözőKarakterek);

            Console.WriteLine("2. Feladat: Szotar.txt beolvasása");
            List<Szó> szavak = new List<Szó>();
            foreach (var i in File.ReadAllLines("szotar.txt")) szavak.Add(new Szó(i));

            Console.WriteLine("3. Feladat: Rendezés, abc.txt");
            File.WriteAllLines("abc.txt", szavak.Select(x => x.Rszó));

            Console.WriteLine("4. Feladat: Anagramma-e ?");
            Console.Write("Kérem a két szót szóközzel elválasztva: ");
            string[] sz = Console.ReadLine().Split();
            Console.WriteLine("A két szó: {0}", new Szó(sz[0]).AnagrammaE(new Szó(sz[1])) ? "Anagramma" : "Nem anagramma");

            Console.WriteLine("\n5. Feladat: Anagramma keresés");
            Console.Write("Kérem a keresendő szót:");
            Szó kszó= new Szó(Console.ReadLine());
            var anagrammák = szavak.Where(x => x.AnagrammaE(kszó));
            if (anagrammák.Count()!=0) foreach (var i in anagrammák) Console.WriteLine(i.Pszó);
            else Console.WriteLine("Nincs a szótárban anagramma");

            Console.WriteLine("\n6. Feladat: Leghosszabb keresés");
            foreach (var i in szavak.Where(x => x.Pszó.Length == szavak.Max(y => y.Pszó.Length)).GroupBy(g => g.Rszó)) foreach (var j in i) Console.WriteLine(j.Pszó);

            Console.WriteLine("\n7. Feladat: Rendezve.txt");
            List<string> ki = new List<string>();
            foreach (var i in szavak.GroupBy(g => g.Pszó.Length).Select(x =>new { hossz=x.Key, anag=x.GroupBy(y=>y.Rszó)}).OrderBy(x=>x.hossz))
            {
                foreach (var j in i.anag) ki.Add(j.Aggregate("", (c, n) => c + " " + n.Pszó));
                ki.Add("");
            }
            File.WriteAllLines("Rendezve.txt", ki);

            Console.ReadKey();
        }
    }
}
