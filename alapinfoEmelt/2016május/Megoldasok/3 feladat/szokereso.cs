using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Szójáték
{
    class Szó
    {
        public string szó { get; private set; }
        public byte irány { get; private set; }
        public byte sor { get; private set; }
        public byte oszlop { get; private set; }

        public Szó(string[] f)
        {
            szó = f[0];
            sor = byte.Parse(f[1]);
            oszlop = byte.Parse(f[2]);
            irány = byte.Parse(f[3]);
        }
    }

    class Szokereso
    {
        static void Main()
        {
            //1. feladat:
            string[] forrás = File.ReadAllLines("szavak.txt",Encoding.Default);
            List<Szó> szavak = new List<Szó>();
            foreach (var i in forrás) szavak.Add(new Szó(i.Split('*')));

            Console.WriteLine("2. feladat - Szavak száma: {0} db", szavak.Count);

            Console.WriteLine("3. feladat - Leghosszabb szó hossza: {0} db karakter",szavak.Max(x=>x.szó.Length));

            Console.WriteLine("4. Feladat - Leghosszabb szó/szavak:");
            szavak.Where(x => x.szó.Length == szavak.Max(y => y.szó.Length)).ToList().ForEach( x=> Console.WriteLine("\t{0}", x.szó));

            //5. Feladat - Mátrix deklarációja, feltöltése (szavak elhelyezése)
            char[,] m = new char[16, 16];
            foreach (var i in szavak)
            {
                byte sor = i.sor;
                byte oszlop = i.oszlop;
                foreach (var j in i.szó)
                {
                    m[sor, oszlop] = j;
                    switch (i.irány)
                    {
                        case 1: oszlop++; break;
                        case 2: oszlop++; sor--; break;
                        case 3: sor--; break;
                        case 4: oszlop--; sor--; break;
                        case 5: oszlop--; break;
                        case 6: oszlop--; sor++; break;
                        case 7: sor++; break;
                        case 8: oszlop++; sor++; break;
                    }
                }
            }

            Console.WriteLine("6. Feladat - Szavak kiírása");
            for (int i = 0; i < m.GetLength(0); i++)
            {
                Console.Write("\t");
                for (int j = 0; j < m.GetLength(1); j++)
                {
                    if (m[i,j]!=0) Console.Write(m[i,j]); else Console.Write('#');
                }
                Console.WriteLine();
            }

            //7. Feladat - jatek.txt
            List<string> ki = new List<string>();
            foreach (var i in szavak) ki.Add(i.szó);
            ki.Add("");
            Random r = new Random();
            for (int i = 0; i < m.GetLength(0); i++)
            {
                string s = "";
                for (int j = 0; j < m.GetLength(1); j++)
                {
                    if (m[i, j] != 0) s += m[i, j]; else s += (char)r.Next(97,123);
                }
                ki.Add(s);
            }
            File.WriteAllLines("jatek.txt", ki);
            Console.ReadKey(); //nem a megoldás része
        }
    }
}
