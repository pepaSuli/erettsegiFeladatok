using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;

namespace szamok
{
    class Program
    {
        struct Egyfeladat
        {
            public string kerdes;
            public int valasz;
            public int pont;
            public string temakor;
        }

        static Egyfeladat[] fel = new Egyfeladat[100];  //a beolvasott feladatokat tartalmazó tömb
        static int n=0;                                 //a feladatok száma az adatfájlban
        static string[] tklista = new string[100];      //a témakörök listája
        static int tksz = 0;                            //a témakörök száma
        
        static void Main(string[] args)
        {
            Feladat1();
            Feladat2();
            Feladat3();
            Feladat4();
            Feladat5();
            Feladat6();
            Feladat7();

            Console.ReadKey();
        }

        static void Feladat1()
        {
            StreamReader olvaso = new StreamReader("../../felszam.txt");
            string[] egysor = new string[3];

            Console.WriteLine("1. feladat. Az adatfájl beolvasása...");
            Console.WriteLine();
            while (olvaso.Peek()>-1)
            {
                fel[n].kerdes=olvaso.ReadLine();
                egysor = olvaso.ReadLine().Split(' ');
                fel[n].valasz = int.Parse(egysor[0]);
                fel[n].pont = int.Parse(egysor[1]);
                fel[n].temakor = egysor[2];
                n++;
            }
            olvaso.Close();
        }

        static void Feladat2()
        {
            Console.WriteLine("2. feladat. Az adatfájlban {0} feladat van.", n);
            Console.WriteLine();
        }

        static void Feladat3()
        {
            //Megszámlálás
            int db = 0;
            int[] dbpont = new int[4];

            for (int i = 0; i < n; i++)
                if (fel[i].temakor == "matematika")
                {
                    db++;
                    dbpont[fel[i].pont]++;
                }

            Console.Write("3. feladat. Az adatfájlban {0} matematika feladat van", db);
            for (int i = 1; i < 4; i++)
                Console.Write(", {0} pontot ér {1} feladat", i, dbpont[i]);
            Console.WriteLine(".");
            Console.WriteLine();
        }

        static void Feladat4()
        {
            //Minimum- és maximumkiválasztás
            int min, max;

            min = fel[0].valasz;
            max = fel[0].valasz;
            for (int i = 1; i < n; i++)
            {
                if (fel[i].valasz < min) 
                    min = fel[i].valasz;
                if (fel[i].valasz > max) 
                    max = fel[i].valasz;
            }
            Console.WriteLine("4. feladat. A válaszok értéke {0} és {1} közé esik.", min, max);
            Console.WriteLine();
        }

        static void Feladat5()
        {

            for (int i = 0; i < n; i++)
            {
                //Szerepel-e már az i-edik feladat témaköre a listában? Ha nem, felvesszük.
                bool van = false;
                for (int j = 0; j < tksz; j++)
                    if (fel[i].temakor == tklista[j]) 
                        van = true;
                if (!van)
                {
                    tklista[tksz] = fel[i].temakor;
                    tksz++;
                }
            }

            Console.WriteLine("5. feladat. Az adatfájlban szereplő témakörök:");
            for (int i = 0; i < tksz; i++)
                Console.WriteLine(tklista[i]);
            Console.WriteLine();
        }

        static void Feladat6()
        {
            Egyfeladat x;                   //a felhasználó feladata és megoldása
            Random rnd = new Random();      //véletlenszám-sorozat
            int y;                          //véletlenszám
                        
            Console.Write("6. feladat. Milyen témakörből szeretne kérdést kapni?");
            x.temakor = Console.ReadLine();
            
            //Addig generálunk véletlen feladatszámokat, míg az adott témakörbe nem esik
            y=rnd.Next(0, n-1);
            while (fel[y].temakor!=x.temakor) 
                y=rnd.Next(0, n-1);
            Console.Write(fel[y].kerdes);

            x.valasz = int.Parse(Console.ReadLine());
            x.pont = 0;
            if (x.valasz == fel[y].valasz) 
                x.pont = fel[y].pont;
            Console.WriteLine("A válasz {0} pontot ér.", x.pont);
            if (x.valasz != fel[y].valasz) 
                Console.WriteLine("A helyes válasz: {0}", fel[y].valasz);
            Console.WriteLine();
        }

        static void Feladat7()
        {
            bool[] kivalasztott = new bool[n];  //igaz, ha az adott feladat ki lett választva
            Random rnd = new Random();          //véletlenszám-sorozat
            int y;                              //véletlenszám
         
            Console.WriteLine("7. feladat. A 10 feladatot tartalmazó feladatlap előállítása...");

            //Kiválasztás. Ha már kiválasztottuk, másikat választunk
            for (int i = 0; i < 10; i++)
            {
                y = rnd.Next(0, n - 1);
                while (kivalasztott[y]) 
                    y = rnd.Next(0, n - 1);
                kivalasztott[y] = true;
              }

            //Az adatok kiírása
            StreamWriter iro = new StreamWriter("../../tesztfel.txt");
            int s = 0;
            for (int i = 0; i < n; i++)
            {
                if (kivalasztott[i])
                {
                    iro.WriteLine("{0} {1} {2}", fel[i].pont, fel[i].valasz, fel[i].kerdes);
                    s = s + fel[i].pont;
                }
            }
            iro.WriteLine("A feladatsorra összesen {0} pont adható.", s);
            iro.Close();
        }
    }
}

