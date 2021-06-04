using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace tanciskola
{
    class Program
    {
        private struct EgyPar
        {
            public string tanc, lany, fiu;
        }
        static EgyPar[] tancrend = new EgyPar[140];
        static int n = 0;
        private struct EgyTancos
        {
            public string nev;
            public int db;
        }
        static EgyTancos[] fiuk = new EgyTancos[20];
        static int nfiuk = 0;
        static EgyTancos[] lanyok = new EgyTancos[20];
        static int nlanyok = 0;

        static void Main(string[] args)
        {
            Feladat1();
            Console.WriteLine();
            Feladat2();
            Console.WriteLine();
            Feladat3();
            Console.WriteLine();
            Feladat4();
            Console.WriteLine();
            Feladat5();
            Console.WriteLine();
            Feladat6();
            Console.WriteLine();
            Feladat7();
            Console.ReadKey();
        }

        static void Feladat1()
        {
            Console.WriteLine("1. feladat. Az adatok beolvasása...");
            StreamReader olvaso = new StreamReader("../../tancrend.txt");

            while (olvaso.Peek() > -1)
            {
                tancrend[n].tanc = olvaso.ReadLine();
                tancrend[n].lany = olvaso.ReadLine();
                tancrend[n].fiu = olvaso.ReadLine();
                n++;
            }
            olvaso.Close();
        }

        static void Feladat2()
        {
            Console.WriteLine("2. feladat. Az első tánc a {0}, az utolsó pedig a {1} volt.", tancrend[0].tanc, tancrend[n - 1].tanc);
        }

        static void Feladat3()
        {
            int s = 0;
            for (int i = 0; i < n; i++)
                if (tancrend[i].tanc == "samba") s++;
            Console.WriteLine("3. feladat. A samba-t {0} pár mutatta be.", s);
        }

        static void Feladat4()
        {
            Console.WriteLine("4. feladat. Vilma a következő táncokban szerepelt:");
            for (int i = 0; i < n; i++)
                if (tancrend[i].lany == "Vilma") Console.WriteLine(tancrend[i].tanc);
        }

        static void Feladat5()
        {
            Console.Write("5. feladat. Adja meg egy tánc nevét = ");
            string bemutato = Console.ReadLine();
            bool tancolt = false;
            for (int i = 0; i < n; i++)
                if (tancrend[i].tanc == bemutato && tancrend[i].lany == "Vilma")
                {
                    tancolt = true;
                    Console.WriteLine("A {0} bemutatóján Vilma párja {1} volt.", bemutato, tancrend[i].fiu);
                }
            if (!tancolt) Console.WriteLine("Vilma nem táncolt {0}-t.", bemutato);
        }

        static void Feladat6()
        {
            for (int i = 0; i < n; i++)
            {
                //Fiúk listája
                bool szerepel = false;
                for (int j = 0; j < nfiuk; j++)
                    if (tancrend[i].fiu == fiuk[j].nev)
                        szerepel = true;
                //Ha nem szerepel, felvesszük
                if (!szerepel)
                {
                    fiuk[nfiuk].nev = tancrend[i].fiu;
                    nfiuk++;
                }

                //Lányok listája
                szerepel = false;
                for (int j = 0; j < nlanyok; j++)
                    if (tancrend[i].lany == lanyok[j].nev)
                        szerepel = true;
                //Ha nem szerepel, felvesszük
                if (!szerepel)
                {
                    lanyok[nlanyok].nev = tancrend[i].lany;
                    nlanyok++;
                }
            }
            Console.WriteLine("6. feladat. A szereplők listájának kiírása...");
            StreamWriter iro = new StreamWriter("../../szereplok.txt");
            iro.Write("Lányok: ");
            for (int j = 0; j < nlanyok - 1; j++)
                iro.Write(lanyok[j].nev + ", ");
            iro.WriteLine(lanyok[nlanyok - 1].nev);
            iro.Write("Fiúk: ");
            for (int j = 0; j < nfiuk - 1; j++)
                iro.Write(fiuk[j].nev + ", ");
            iro.WriteLine(fiuk[nfiuk - 1].nev);
            iro.Close();
        }

        static void Feladat7()
        {
            int maxdb;
            Console.WriteLine("7. feladat.");

            //Megszámoljuk, hogy ki hányszor lépett fel
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < nfiuk; j++)
                    if (tancrend[i].fiu == fiuk[j].nev) fiuk[j].db++;
                for (int j = 0; j < nlanyok; j++)
                    if (tancrend[i].lany == lanyok[j].nev) lanyok[j].db++;
            }

            //A maximumok meghatározása
            maxdb = fiuk[0].db;
            for (int j = 1; j < nfiuk; j++)
                if (maxdb < fiuk[j].db) maxdb = fiuk[j].db;
            Console.Write("A legtöbbször szerepelt fiú(k): ");
            for (int j = 0; j < nfiuk; j++)
                if (fiuk[j].db == maxdb) Console.Write(fiuk[j].nev + " ");
            Console.WriteLine();

            maxdb = lanyok[0].db;
            for (int j = 1; j < nlanyok; j++)
                if (maxdb < lanyok[j].db) maxdb = lanyok[j].db;
            Console.Write("A legtöbbször szerepelt lány(ok): ");
            for (int j = 0; j < nlanyok; j++)
                if (lanyok[j].db == maxdb) Console.Write(lanyok[j].nev + " ");
            Console.WriteLine();
        }
    }
}
