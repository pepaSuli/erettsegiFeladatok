using System;
using System.Collections.Generic;
using System.Text;

namespace ef1
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
                double a,b,c;
                // Információk kiíratása
                Console.WriteLine("------------------------------------");
                Console.WriteLine("Háromszög szerkeszthetőség vizsgálat");                
                Console.WriteLine("------------------------------------\n");
         
                // Bemenő adatok beolvasása
                Console.Write("Adja meg az a oldal hosszát: ");
                a = Int32.Parse((Console.ReadLine()));
                Console.Write("Adja meg a b oldal hosszát: ");
                b = Int32.Parse((Console.ReadLine()));
                Console.Write("Adja meg a c oldal hosszát: ");
                c = Int32.Parse((Console.ReadLine()));
                Console.WriteLine();

                //Az eredmény kiszámítása és kiíratása
                if ((a+b>c) && (a+c>b) && (b+c>a))
                    Console.WriteLine("Az adott hosszúságú szakaszokból szerkeszthető háromszög.");
                else
                    Console.WriteLine("Az adott hosszúságú szakaszokból nem szerkeszthető háromszög.");
                
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
