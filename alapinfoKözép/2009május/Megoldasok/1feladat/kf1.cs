using System;
using System.Collections.Generic;
using System.Text;

namespace kf1
{
    class Program
    {
        static void Main(string[] args)
        {
            int i, j;
            Console.Write("SZORZÓTÁBLA");
            Console.WriteLine();
            for (i = 1; i <= 10; i++)
            {
                for (j = 1; j <= 10; j++)
                {
                    Console.Write("{0,4}", i * j);
                    if (j != 10)
                        Console.Write(",");
                }
                Console.WriteLine();
            }
            Console.ReadKey(); // A kitűzött feladatban nem szerepel ez a várakozás
        }
    }
}
