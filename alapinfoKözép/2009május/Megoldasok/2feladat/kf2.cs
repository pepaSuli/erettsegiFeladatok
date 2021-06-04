using System;
using System.Collections.Generic;
using System.Text;

namespace kf2
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
                string atvaltasIrany;
                double ertek, atvaltottErtek;
                // Információk kiíratása
                Console.WriteLine("----------------------------");
                Console.WriteLine("Centiméter <-> Inch Átváltás");
                Console.WriteLine("cm -> inch: ci");
                Console.WriteLine("inch -> cm: ic");
                Console.WriteLine("----------------------------");
                Console.WriteLine("");
                // Bemenő adatok beolvasása
                Console.Write("Adja meg az átváltás fajtáját (ci vagy ic):");
                atvaltasIrany = (Console.ReadLine());
                Console.Write("\nAdja meg az átváltandó értéket:");
                ertek = Double.Parse(Console.ReadLine());
                Console.WriteLine();

                //Az eredmény kiszámítása és kiíratása
                if (atvaltasIrany == "ci")
                {
                    atvaltottErtek = ertek / 2.54;
                    Console.WriteLine("{0} centiméter az annyi, mint {1} inch.", ertek, atvaltottErtek);
                }
                else if (atvaltasIrany == "ic")
                {
                    atvaltottErtek = ertek * 2.54;
                    Console.WriteLine("{0} inch az annyi, mint {1} centiméter.", ertek, atvaltottErtek);
                }
                else Console.WriteLine("Értelmezhetetlen utasítás!");
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
