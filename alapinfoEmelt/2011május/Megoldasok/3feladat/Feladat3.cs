using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat3
{
    enum jelleg
    { osztalypenz = 0, kozos = 1, egyeni = 2 }

    class Osztalykassza
    {   private const int maxTranzakciodb = 23;
        private int tanulodb;
        private struct tranzakcio  // Egy tranzakcio adatai
        {   public DateTime datum;
            public jelleg jelleg;
            public int osszeg; }
        private struct tanulo // Egy tanuló adatai
        {   public int nyitoegyenleg;
            public int zaroegyenleg;
            public int tranzakciodb;
            public tranzakcio[] tranzakciok; }
        private tanulo[] tanulok;

        public void general()
        {
            Random r = new Random();
            tanulodb = r.Next(25,36); // A tanulók száma
            tanulok = new tanulo[tanulodb];
            for (int i = 0; i < tanulodb; i++)
            {
                tanulok[i].nyitoegyenleg = r.Next(1000, 3501);
                tanulok[i].tranzakciok=new tranzakcio[maxTranzakciodb];
                for (int j = 0; j < 10; j++)
                {   //Osztálypénz
                    int honap=(j < 4 ? j + 9 : j - 3);
                    tanulok[i].tranzakciok[j].datum = new DateTime((j<4?2009:2010),honap, r.Next(1, DateTime.DaysInMonth(2009, honap)+1));
                    tanulok[i].tranzakciok[j].jelleg = jelleg.osztalypenz;
                    tanulok[i].tranzakciok[j].osszeg = (r.NextDouble() > 0.2 ? 1000: 1000* r.Next(2, 5));
                    // Közös költség
                    if (i == 0)
                    {
                        tanulok[i].tranzakciok[j + 10].datum = new DateTime((j < 4 ? 2009 : 2010), honap, r.Next(1, DateTime.DaysInMonth(2009, honap) + 1));
                        tanulok[i].tranzakciok[j + 10].osszeg = -r.Next(2000, 5001) / tanulodb;
                    }
                    else
                    {
                        tanulok[i].tranzakciok[j + 10].datum = tanulok[i - 1].tranzakciok[j + 10].datum;
                        tanulok[i].tranzakciok[j + 10].osszeg = tanulok[i - 1].tranzakciok[j + 10].osszeg;
                    }
                    tanulok[i].tranzakciok[j + 10].jelleg = jelleg.kozos;
                }
                int egyedidb = r.Next(1, 4);
                for (int j = 0; j < egyedidb; j++)
                {   int ev=(r.NextDouble() < 0.4 ? 2009: 2010); int honap=(ev==2009?r.Next(9,13):r.Next(1,7));  
                    tanulok[i].tranzakciok[j + 20].datum = new DateTime(ev,honap,r.Next(1,28));
                    tanulok[i].tranzakciok[j + 20].jelleg = jelleg.egyeni;
                    tanulok[i].tranzakciok[j + 20].osszeg = -r.Next(1000, 1500);
                }
                tanulok[i].tranzakciodb = 20 + egyedidb;    
                tanulok[i].zaroegyenleg = tanulok[i].nyitoegyenleg; 
                for (int j = 0; j < tanulok[i].tranzakciodb; j++)
                {  tanulok[i].zaroegyenleg += tanulok[i].tranzakciok[j].osszeg; }
            }
        }

        public void rendez() 
        {   for (int k = 0; k < tanulodb; k++)
            {   for (int i = 0; i < tanulok[k].tranzakciodb-1; i++)
                {   for (int j = i + 1; j < tanulok[k].tranzakciodb; j++)
                    {   if (tanulok[k].tranzakciok[i].datum > tanulok[k].tranzakciok[j].datum)
                        {   tranzakcio s = tanulok[k].tranzakciok[i];
                            tanulok[k].tranzakciok[i] = tanulok[k].tranzakciok[j];
                            tanulok[k].tranzakciok[j] = s; 
                        }
                    }
                }
            }
        }

        public void kiirat() 
        {
            for (int i = 0; i < tanulodb; i++)
            {
                Console.WriteLine("\nTanuló sorszáma: "+(i + 1) + "/" + tanulodb);
                Console.WriteLine("    Nyitóegyenleg: "+tanulok[i].nyitoegyenleg+" Ft");
                Console.WriteLine("    Befizetések/költségek:");
                for (int j = 0; j < tanulok[i].tranzakciodb; j++)
                { Console.WriteLine(String.Format("{0,10}{1:d}{2,5}{3,-20}{4,15}{5,3}",
                        "", tanulok[i].tranzakciok[j].datum,"",
                        (tanulok[i].tranzakciok[j].jelleg == jelleg.osztalypenz ? "Osztálypénz" : 
                        (tanulok[i].tranzakciok[j].jelleg == jelleg.kozos ? "Közös költség" : "Egyéni költség"))
                        ,tanulok[i].tranzakciok[j].osszeg,"Ft")); }
                Console.WriteLine("    Záróegyenleg: " + tanulok[i].zaroegyenleg + " Ft");
                Console.ReadLine();
            }
        }
    }
    class Program
    {   static void Main(string[] args)
        {   Osztalykassza o = new Osztalykassza();
            o.general();
            o.rendez();
            o.kiirat();
        }
    }
}
