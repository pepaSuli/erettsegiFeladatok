using System;
using System.Collections.Generic;
using System.Text;

namespace ef3
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
                const int sorokSzama = 10;
                string[] szovegSorok = new string[sorokSzama];
                string ujSor1, ujSor2;
                int i,j;
                // Információk kiíratása
                Console.WriteLine("-------------------------------------");
                Console.WriteLine("Szövegátalakítás, szóköz redukálás...");
                Console.WriteLine("-------------------------------------\n");

                // Bemenő adatok beolvasása
                Console.WriteLine("Adjon meg tíz sornyi szöveget!");
                Console.WriteLine("..............................");
                for (i = 0; i < sorokSzama; i++)
                    szovegSorok[i] = Console.ReadLine();
                Console.WriteLine("..............................");

                //A szóközök redukálása
                for (i = 0; i < sorokSzama; i++)
                {
                    // Sorvégi szóközök eltávolítása, csak szóközt tartalmazó sor ürítése
                    ujSor1 = szovegSorok[i].TrimEnd(' ');
                    //Sor eleji szóközök megtartáas
                    ujSor2="";
                    for (j = 0; (j < ujSor1.Length) && (ujSor1[j] == ' '); j++)
                        ujSor2 += ujSor1[j];
                    //Többszörös szóközök cseréje egy szóközre
                    while (j < ujSor1.Length)
                    { 
                        for (;(j < ujSor1.Length) && (ujSor1[j] != ' '); j++)
                            ujSor2 += ujSor1[j];
                        if (j < ujSor1.Length)
                            ujSor2 += ' ';
                        for (; (j < ujSor1.Length) && (ujSor1[j] == ' '); j++);
                    }                         
                        szovegSorok[i] = ujSor2;
                }
   
                //Az eredmény kiíratása
                Console.WriteLine("\nAz átalakított szöveg:");
                Console.WriteLine("..............................\n");
                for (i = 0; i < sorokSzama; i++)
                    Console.WriteLine(szovegSorok[i]+"|");
                Console.WriteLine("..............................");
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
