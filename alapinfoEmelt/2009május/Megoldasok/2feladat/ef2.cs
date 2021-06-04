using System;
using System.Collections.Generic;
using System.Text;

namespace ef2
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
                const double idoIntervallum = 3;
                const int pontokSzama = 11;
                double[] x = new double[pontokSzama];
                double[] y = new double[pontokSzama];
                double sebesseg, maxSebesseg;
                int i;

                // Információk kiíratása
                Console.WriteLine("--------------------------");
                Console.WriteLine("Hangya sebesség maximum...");
                Console.WriteLine("--------------------------\n");

                // Bemenő adatok beolvasása
                x[0] = 0;
                y[0] = 0;
                Console.WriteLine("Adja meg a hangya pozícióit!\n");
                for (i = 1; i < pontokSzama; i++)
                {
                    Console.WriteLine("A(z) {0}. másodpercben: ", i * idoIntervallum);
                    Console.Write("   x: ");
                    x[i] = Int32.Parse((Console.ReadLine()));
                    Console.Write("   y: ");
                    y[i] = Int32.Parse((Console.ReadLine()));
                }
                Console.WriteLine();

                //Az eredmény kiszámítása és kiíratása
                maxSebesseg = 0;
                for (i = 1; i < pontokSzama; i++)
                {
                    sebesseg = (Math.Sqrt(Math.Pow(x[i] - x[i - 1], 2) + Math.Pow(y[i] - y[i - 1], 2)))/1000/idoIntervallum;
                    if (sebesseg > maxSebesseg)
                        maxSebesseg = sebesseg;
                }
                Console.WriteLine("A mért időszakban elért legnagyobb átlagsebesség {0} m/s", maxSebesseg);                
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
