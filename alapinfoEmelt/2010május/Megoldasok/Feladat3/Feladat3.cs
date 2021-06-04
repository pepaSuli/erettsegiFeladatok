using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3
{
    class Karacsonyfa
    {
        private const int maxTermeloSzam = 50;  // Termelők max. száma
        private const int maxFadb = 10;  // Fák max. száma 
        private int termelodb; 

        private struct faadat      // Egy fa adatai
        {
            public double faMagassag;
            public int faAtmero;
        } 

        private struct termeloadat  // Egy termelő fáinak a száma, a fák adatai, és az összes térfogat
        {
            public int faDb;
            public faadat[] faAdatok;
            public double terfogat;
        }

        private termeloadat[] termeloAdatok;  // Az összes termelő adatai

        public void adatgeneralas()
        {
            Random randNum = new Random();
            termelodb = randNum.Next(maxTermeloSzam)+1; // A termelők száma
            termeloAdatok=new termeloadat[termelodb];

            Console.WriteLine(" => Adatgenerálás");
            Console.WriteLine();
            Console.WriteLine("  A termelők száma: "+termelodb);

            for (int i = 0; i < termelodb; i++)
            {
                termeloAdatok[i] = new termeloadat();
                termeloAdatok[i].faDb = randNum.Next(maxFadb) + 1;  // Az i. termelő fáinak a száma
                termeloAdatok[i].faAdatok = new faadat[termeloAdatok[i].faDb];
                termeloAdatok[i].terfogat = 0;
                Console.WriteLine();
                Console.WriteLine("  "+(i + 1) + ". termelő: (" + termeloAdatok[i].faDb+" db fa)" );
                Console.WriteLine(String.Format("{0,15}{1,15}{2,15}", "Sorszám", "Magasság (m)", "Átmérő (cm)"));
                for (int j = 0; j < termeloAdatok[i].faDb; j++)
                {
                    termeloAdatok[i].faAdatok[j] = new faadat()
                    {
                        faMagassag = (double)(randNum.Next(2001) + 2000)/100, // Magasság 20 és 40 m között
                        faAtmero = randNum.Next(31) + 30  // Átmérő 30 és 60 cm között
                    };  
                    Console.WriteLine(String.Format("{0,13}{1,14:0.00}{2,15}", (j + 1).ToString() + ".", termeloAdatok[i].faAdatok[j].faMagassag, termeloAdatok[i].faAdatok[j].faAtmero));
                    termeloAdatok[i].terfogat += Math.Pow(termeloAdatok[i].faAdatok[j].faAtmero*0.005, 2) * Math.PI * termeloAdatok[i].faAdatok[j].faMagassag;
                }
                Console.WriteLine();
                Console.WriteLine("     Össztérfogat: "+String.Format("{0,8:0.00}",termeloAdatok[i].terfogat)+" m^3");
                Console.ReadKey();
            }         
        }
        
        private int gyoztes() 
        {
            int ind = 0;
            for (int i = 1; i < termelodb; i++)
            { 
               if (termeloAdatok[i].terfogat>termeloAdatok[ind].terfogat)  
               {
                   ind = i; 
               }
            }
                return ind;
        }

        private int gyoztesfa(int termelo)
        {
            int ind = 0;
            for (int i = 1; i < termeloAdatok[termelo].faDb; i++)
            {
                if (termeloAdatok[termelo].faAdatok[i].faMagassag > termeloAdatok[termelo].faAdatok[ind].faMagassag)
                {
                    ind = i;
                }
            }
            return ind;
        }

        public void kiiras() 
        {   
            int gy=gyoztes();
            Console.WriteLine();
            Console.WriteLine(" => Eredményhirdetés:");
            Console.WriteLine("      Győztes termelő sorszáma: "+ (gy+1)+".");
            Console.WriteLine("      Győztes fájának sorszáma: "+ (gyoztesfa(gy) + 1)+".");
            Console.ReadKey(); 
        } 
    }

    class Program
    {
        static void Main(string[] args)
        {
            Karacsonyfa k = new Karacsonyfa();
            k.adatgeneralas();
            k.kiiras();          
        }
    }
}
