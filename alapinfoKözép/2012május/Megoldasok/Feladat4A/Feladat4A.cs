using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace ConsoleApplication1
{
    class valami
    {
        private List<DateTime> datumok = new List<DateTime>();
        private const int mindb = 10;
        private const int maxdb = 30;
        private bool teljesul = false;

        public void beolvas()
        {
            DateTime d = new DateTime();
            string sdatum;
            bool kilep = false;
            // Random r = new Random();   // Teszteléshez, adatbeírás helyett
            Console.WriteLine("=>  Írja be a születési dátumokat!\n");
            do
            {
                Console.Write("  "+ String.Format("{0,3}",(datumok.Count + 1)) + ". születési dátum: ");
                sdatum = Console.ReadLine();
             //   sdatum = r.Next(1950, 2000) + ".0" + r.Next(1, 10) + "." + r.Next(10, 28) + ".";  // Teszteléshez, adatbeírás helyett
             //   Console.WriteLine(sdatum);  // Teszteléshez, adatbeírás helyett
                while ((sdatum != "") && !(DateTime.TryParseExact(sdatum, "yyyy.MM.dd.", new CultureInfo("en-US"), DateTimeStyles.None, out d)))
                {
                    Console.WriteLine("    Helytelen dátum! (Adja meg újra!)\n ");
                    if (sdatum != "")
                    {
                        Console.Write("  " + String.Format("{0,3}", (datumok.Count + 1)) + ". születési dátum: ");
                        sdatum = Console.ReadLine();
                    }     
                }

                if (sdatum == "")
                {
                    if (datumok.Count< mindb)
                    {
                        Console.WriteLine("    A beírt születésnapok száma kisebb, mint " + mindb + ", folytatnia kell az adatbekérést!");
                        kilep = false;
                    }
                    else
                        kilep = true;
                }
                else
                    datumok.Add(d);
                
                if (datumok.Count == maxdb)
                {
                    Console.WriteLine("\n   A beírt születésnapok száma elérte a " + maxdb + " db-ot, többet nem írhat be!");
                    kilep = true;
                }
            }
            while (!(kilep));
            
            Console.WriteLine("\n   Továbblépéshez nyomja meg az Enter-t!");
            Console.ReadLine();
          }

        public void datumlista()
        {
            datumok.Sort();
            Console.WriteLine("=>  A születési dátumok növekvő sorrendben");
            Console.WriteLine("\n\tSorszám\t\tSzületési dátum");
            int i = 0;
            foreach (DateTime d in datumok)
            {
                Console.WriteLine("\t"+String.Format("{0,4}",(++i))+".\t\t  "+d.ToString("yyyy.MM.dd."));
            }
            Console.WriteLine("\n    Továbblépéshez nyomja meg az Enter-t!");
            Console.ReadLine();
        }

        public void tobbszor()
        {       
            HashSet<DateTime> datumok2 = new HashSet<DateTime>();
            foreach (DateTime d in datumok)
            {
                datumok2.Add(d.AddYears(-d.Year+1));
            }

            string s = "=>  A többször előforduló születésnapok"+"\n\n\tSzületésnap\tElőfordulás";
            
            List<DateTime> datumok3 = datumok2.ToList();
            datumok3.Sort();
            
            foreach (DateTime d3 in datumok3)
            {
                int db = 0;
                foreach (DateTime d in datumok)
                {
                    if ((d3.Month == d.Month) && (d3.Day == d.Day))
                    {
                        db++;
                    }
                }
                if (db > 1)
                {
                    teljesul = true;
                    s += "\n\t  " + d3.ToString("MM.dd.") + "\t    " + db;
                }
            }

            Console.Write((teljesul ? s: "=>  Nincs többször szereplő születésnap!")) ;
            
            Console.WriteLine("\n\n=>  "+(teljesul ? "Teljesül" : "Nem teljesül") + " a születésnap paradoxon!");
            Console.WriteLine("\n    A kilépéshez nyomja meg az Enter-t!");
            Console.ReadLine();
        }     
    }

    class Program
    {
        static void Main(string[] args)
        {
            valami v = new valami();
            v.beolvas();
            v.datumlista();
            v.tobbszor();
        }
    }
}
