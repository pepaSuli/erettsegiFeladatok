using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Szamsorozat
{
    class Szamsorozat
    {
        //4. feladat:
        static void Kiír(string állományNeve, List<int> sorozat, int startIndex, int hossz)
        {
            using (StreamWriter sw = new StreamWriter(állományNeve))
            {
                for (int i = startIndex; i< startIndex+hossz; i++)
                {
                    sw.WriteLine(sorozat[i]);
                }
            }
        }

        static void Main()
        {
            //1. feladat: Számsorozat beolvasása
            List<int> t = new List<int>();
            using (StreamReader sr = new StreamReader("sorozat.txt"))
            {
                while (!sr.EndOfStream)
                {
                    t.Add(int.Parse(sr.ReadLine()));
                }
            }

            Console.WriteLine("2. feladat: Elemek száma a sorozatban: {0}db",t.Count);

            //3. feladat:
            int páratlanDb = 0;
            int páratlanÖsszeg = 0;
            foreach (var i in t)
            {
                if (i%2==1)
                {
                    páratlanDb++;
                    páratlanÖsszeg += i;
                }
            }
            Console.WriteLine("3. feladat: Páratlan számok:\n\tÖsszege: {0}\n\tDarabszáma: {1}\n\tÁtlaga: {2}", páratlanÖsszeg,páratlanDb,(double)páratlanÖsszeg/páratlanDb);

            //5. feladat:
            Console.WriteLine("5. feladat:");
            Console.Write("\tKérem az állomány nevét: ");
            string név = Console.ReadLine();
            Console.Write("\tKérem a kezdőindexet: ");
            int startIndex = int.Parse(Console.ReadLine());
            Console.Write("\tKérem a részsorozat hosszát: ");
            int hossz = int.Parse(Console.ReadLine());
            Kiír(név, t, startIndex, hossz);


            //6. feladat:
            t.Add(0); //Így az állomány végén lévő szigorúan monoton növekvő leghosszab sorozatot is megtalálja
            int aktHossz = 1;
            int maxHossz = 1;
            int maxHosszStartIndex = 0;
            for (int i = 0; i < t.Count-1; i++)
            {
                if (t[i] < t[i + 1]) aktHossz++;
                else
                {
                    if (aktHossz > maxHossz)
                    {
                        maxHossz = aktHossz;
                        maxHosszStartIndex = i - aktHossz + 1;
                    }
                    aktHossz = 1;
                }
            }
            Console.WriteLine("6. feladat: Első leghosszabb szigorúan monoton növekvő sorozat:\n\tHossza: {0}\n\tKezdő indexe: {1} ", maxHossz,maxHosszStartIndex);
           
            //7. feladat:
            Kiír("leghosszabb.txt", t, maxHosszStartIndex, maxHossz);


            Console.ReadKey();

        }
    }
}
