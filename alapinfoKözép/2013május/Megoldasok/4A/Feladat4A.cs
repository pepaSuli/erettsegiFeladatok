using System;
using System.IO;

namespace EvvegiErtekeles
{
    class Feladat4A
    {
        static void Main()
        {
            //1. feladat:
            string[] adatok = File.ReadAllLines("enaplo.txt");

            //1. feladat: Alternatív megoldás szöveges fájl beolvasása helyett
            //string[] adatok = new string[] 
            //{
            //    "Kis Ramóna*43*34*14*19*6",
            //    "Nagy Kálmán*23*19*20*18*22",
            //    "Horváth Tamás*17*29*29*14*30",
            //    "Szabó János*101*21*3*0*0",
            //    "Magyar Béla*12*34*27*33*35",
            //    "Németh Jenő*25*31*22*14*11",
            //    "Takács Márton*86*19*5*2*1",
            //    "Kovács Kázmér*43*33*18*8*7",
            //    "Nagy Kitti*51*32*15*4*1",
            //    "Török Beáta*95*30*6*0*0",
            //    "Kiss Ferenc*80*24*6*2*0"
            //  };

            //2. feladat: Adatszerkezet feltöltése
            string[] nevek = new string[adatok.Length];
            byte[,] jegyek = new byte[adatok.Length, 5];

            for (int i = 0; i < adatok.Length; i++) 
			{
                string[] sor = adatok[i].Split('*');
                nevek[i] = sor[0];
                for (int j = 0; j < 5; j++)
                {
                    jegyek[i, j] = byte.Parse(sor[1 + j]);
                }
            }

            Console.WriteLine("3. feladat:");
            int[] pontszamok = new int[adatok.Length];
            Console.Write("\tA pontszámok: ");
            for (int i = 0; i < adatok.Length; i++) 
            {
                pontszamok[i] = jegyek[i, 0] * 3 + jegyek[i, 1] * 2 - jegyek[i, 3] - 2*jegyek[i, 4];
                Console.Write("{0}, ", pontszamok[i]);
            }
            Console.WriteLine();

            Console.WriteLine("4. feladat:");
            int összeg = 0; 
            foreach (var i in pontszamok) 
            {
                összeg += i;
            }
            double átlag = (float)összeg / pontszamok.Length;
            Console.WriteLine("\tA pontszámok átlaga: {0}", átlag);

            Console.WriteLine("5. feladat:");
            for (int i = 0; i < pontszamok.Length; i++) 
			{
                if (pontszamok[i] > átlag) Console.WriteLine("\t{0}\t Pontszám:{1}", nevek[i], pontszamok[i]);
            }

            Console.WriteLine("6. feladat:");
            int maxPont = pontszamok[0];
            for (int i = 1; i < pontszamok.Length; i++)
            {
                if (pontszamok[i] > maxPont) maxPont = pontszamok [i];
            }

            for (int i = 0; i < nevek.Length; i++)
            {
                if (maxPont == pontszamok[i]) Console.WriteLine("\t{0}", nevek[i]);
            }

            Console.ReadKey();

        }
    }
}
