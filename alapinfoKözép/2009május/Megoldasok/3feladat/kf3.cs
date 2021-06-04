using System;
using System.Collections.Generic;
using System.Text;

namespace kf3
{
    class Program
    {
        // A megvalósított futásihiba-kezelés (try-catch-finally) nem része a kitűzött feladatnak,
        // ezért az azt nem tartalmazó megoldások is teljes értékűnek tekinthetőek. 
        static void Main(string[] args)
        {
            try
            {
                // Változók definiálása
                const int napSzam = 7;
                string[] napNev = { "hétfő", "kedd", "szerda", "csütörtök", "péntek", "szombat", "vasárnap" };
                double[] napiHomerseklet = new double[napSzam];
                int i;
                int fagyosNapokSzama;

                // Információk kiíratása
                Console.WriteLine("----------------------------");
                Console.WriteLine("Meteorológiai állomás");
                Console.WriteLine("Fagyos napok meghatározása");
                Console.WriteLine("----------------------------\n");
                
                // Bemenő adatok beolvasása
                Console.WriteLine("Adja meg a délben mért hőmérsékleteket!\n");
                for (i = 0; i < napSzam; i++)
                {
                    Console.Write(napNev[i] + ": ");
                    napiHomerseklet[i] = Double.Parse(Console.ReadLine());
                }

                //Az eredmény kiszámítása és kiíratása
                fagyosNapokSzama = 0;
                for (i = 0; i < napSzam; i++)
                    if (napiHomerseklet[i] < 0)
                        fagyosNapokSzama++;
                Console.Write("\nA héten {0} alkalommal (", fagyosNapokSzama);
                for (i = 0; i < napSzam; i++)
                    if (napiHomerseklet[i] < 0)
                    {
                        Console.Write(napNev[i]+",");
                    }
                if (fagyosNapokSzama == 0)
                    Console.Write("\b");
                else
                    Console.Write("\b) ");
                Console.WriteLine("volt fagy.\n");
            }
            catch (Exception e)
            {
                Console.WriteLine("\nHIBA: {0}", e.Message); 
            }
            finally 
            {
            // Program befejezés, várakozás billentyű lenyomásra
            Console.WriteLine();
            Console.WriteLine("A program befejezéséhez üssön le egy billentyűt!");
            Console.ReadKey();
            }
        }
    }
}
