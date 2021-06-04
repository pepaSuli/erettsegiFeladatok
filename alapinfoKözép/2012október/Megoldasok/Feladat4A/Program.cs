using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Szavazas
{
    struct osszesito
    {
        public int jeloltsorszam;
        public int kapottszavazat;
    }
    class Szavazo
    {
        private const int maxjeloltszam = 10;
        private const int maxszavazoszam=20;
        private int[] szavazatok = new int[maxszavazoszam];
        private osszesito[] osszesites=new osszesito[maxjeloltszam];
        private int jeloltszam,szavazhat,szavazatdb,ervenyesdb;

        private int Egeszbeker(string uzenet, string hibauzenet)  // Csak típusellenőrzés
        {
            int be;
            Console.Write(uzenet);
            while (!(int.TryParse(Console.ReadLine(), out be)))
            {
                Console.Write(hibauzenet + "\n" + uzenet);
            };
            return be;
        }
        
        private int Egeszbeker(string uzenet, string hibauzenet,int a,int b)  // Típus- és tartományellenőrzés
        {
            int be;
            Console.Write(uzenet);
            while (!(int.TryParse(Console.ReadLine(), out be) && (be>=a) && (be<=b)))
            {
                Console.Write(hibauzenet + "\n" + uzenet);
            };
            return be;
        }

        private double szazalek(int ertek, int alap)
        { 
           return Math.Round((double)ertek/alap*100);
        }
        
        public void Adatbevitel()
        {
            Console.WriteLine("  SZAVAZÁS");
            Console.WriteLine("\n=> Adja meg az alapvető adatokat!");
            
            jeloltszam = Egeszbeker("\n    Jelöltek száma (max. "+maxjeloltszam+") : ", "       Hibás adatbevitel, adja meg újra!",1,maxjeloltszam);
            szavazhat = Egeszbeker("    Szavazásra jogosultak száma (max. " + maxszavazoszam + ") : ", "       Hibás adatbevitel, adja meg újra!", 1, maxszavazoszam);            
            for (int j = 0; j < jeloltszam; j++)
            {
                osszesites[j].jeloltsorszam = j + 1;
                osszesites[j].kapottszavazat = 0;
            }
            Console.WriteLine("\n=> Írja be a leadott szavazatokat!\n");
            szavazatdb=0;
            ervenyesdb = 0;
            int be;
            do 
            {
                be = Egeszbeker("  " + String.Format("{0,3}", (szavazatdb + 1)) + ". szavazat: ", "       Hibás adatbevitel, adja meg újra!");
                if ((be >= 1) && (be <= jeloltszam))
                {
                    szavazatok[ervenyesdb++] = be;
                    osszesites[be-1].kapottszavazat++;
                    szavazatdb++;
                }
                else
                if ((be>0))
                {
                    Console.WriteLine("      Érvénytelen szavazat!");
                    szavazatdb++;
                }  
            }
            while (!(be<=0) && (szavazatdb<szavazhat));
        }

        public void Rendezes()
        {
            for (int i = 0; i < jeloltszam-1; i++)
            {
                for (int j = i+1; j < jeloltszam; j++)
                {
                    if ((osszesites[i].kapottszavazat < osszesites[j].kapottszavazat)||
                       ((osszesites[i].kapottszavazat == osszesites[j].kapottszavazat)&&
                       (osszesites[i].jeloltsorszam > osszesites[j].jeloltsorszam)))
                    {
                        osszesito s = osszesites[i];
                        osszesites[i] = osszesites[j];
                        osszesites[j] = s;
                    }
                }
            }            
        }

        public void Eredmenyek()
        {
            Console.WriteLine("\n=> Összesítés\n");   
            Console.WriteLine(String.Format("{0,-42}{1,4}","    A szavazásra jogosultak száma  :",szavazhat));
            Console.WriteLine(String.Format("{0,-42}{1,4}","    Leadott szavazatok száma:", szavazatdb));
            Console.WriteLine(String.Format("{0,-42}{1,4}","    Érvényes szavazatok száma      :", ervenyesdb));
            Console.WriteLine(String.Format("{0,-42}{1,4}","    Érvénytelen szavazatok száma   :", szavazatdb-ervenyesdb));
            double szavazoszazalek = szazalek(ervenyesdb, szavazhat);
            bool ervenyes=szavazoszazalek>50; 
            Console.WriteLine("\n    Érvényesen szavazott a  jogosultak " + szavazoszazalek + " %-a, a szavazás " + (ervenyes? "érvényes!" : "érvénytelen!"));

            if (ervenyes)
            {   Console.WriteLine("\n=> A jelöltek eredményei\n");
                Console.WriteLine(String.Format("{0,10}{1,20}{2,15}{3,20}", "Helyezés", "Jelölt sorszáma", "Szavazatszám", "Szavazat arány"));
                for (int i = 0; i < jeloltszam; i++)
                {
                    Console.WriteLine(String.Format("{0,6}{1,15}{2,18}{3,15}{4,5}{5,3}", (i+1)+ ".", osszesites[i].jeloltsorszam, osszesites[i].kapottszavazat,"",szazalek(osszesites[i].kapottszavazat, ervenyesdb)," %"));
                }
            }
            Console.ReadLine();
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Szavazo sz = new Szavazo();
            sz.Adatbevitel();
            sz.Rendezes();
            sz.Eredmenyek();
        }
    }
}
