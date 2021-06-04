using System;
using System.IO;

namespace KoPapirOllo
{
    class KoPapirOllo
    {
        static byte eredmény(byte első, byte második)
        {
            byte[,] eredmeny_mátrix = new byte[3, 3] {// k p o 
                                                        {0,2,1}, //k
                                                        {1,0,2}, //p 
                                                        {2,1,0}, //o
                                                     };
            return eredmeny_mátrix[első,második];
        }

        static byte választ(string kié)
        {
            byte j;
            bool siker;
            do
            {
                Console.Write("Kérem {0} játékos választását kódolva (0-kő, 1-papír, 2-olló):",kié);
                siker = byte.TryParse(Console.ReadLine(), out j);
            } while (!siker || j > 2);
            return j;
        }

        static void Main()
        {
            Console.WriteLine("1. Feladat:");
            byte j1 = választ("az első");
            byte j2 = választ("a második");

            Console.WriteLine("2. Feladat:");
            Console.WriteLine("\tEredmény kódolva (0-döntetlen,  1-első nyert, 2-második nyert):{0}", eredmény(j1, j2));

            Console.WriteLine("3. Feladat:");
            string[] forrás = File.ReadAllLines("jatek.txt");
            Console.WriteLine("\tTovábbi játékok száma: {0} db", forrás.Length);

            Console.WriteLine("4. Feladat: Statisztika");
            byte[,] játék = new byte[forrás.Length+1, 2];
            játék[0, 0] = j1;
            játék[0, 1] = j2;
            for (int i = 0; i < forrás.Length; i++)
            {
                játék[i+1, 0] = byte.Parse((forrás[i].Split('-'))[0]);
                játék[i+1, 1] = byte.Parse((forrás[i].Split('-'))[1]);
            }

            int[] stat = new int[3];
            for (int i = 0; i < játék.GetLength(0); i++)
            {
                stat[eredmény(játék[i, 0], játék[i, 1])]++;
            }
            Console.WriteLine("\tDöntetlenek: {0} db", stat[0]);
            Console.WriteLine("\tElső játékos nyert: {0} db", stat[1]);
            Console.WriteLine("\tMásodik játékos nyert: {0} db", stat[2]);

            Console.ReadKey();
        }
    }
}
