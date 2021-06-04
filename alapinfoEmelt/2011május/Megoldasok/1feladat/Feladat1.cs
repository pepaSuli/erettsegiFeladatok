using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat1
{
    class Romai
    {
        public static char[] romaiszamjegyek = {'I','V','X','L','C','D','M'};
        public static string arabszamjegybol_romai(int ertek, int helyiertek)
        {
            string r ="" ;
            if (!(ertek == 4 || ertek == 9)) // Ha ertek nem 4, vagy 9
            {
                if (ertek >= 5)  // Beállítás V-re, L-re, vagy D-re
                {
                    r += romaiszamjegyek[2 * helyiertek+1];
                }
                for (int i = 0; i < ertek%5; i++) //A megfelelő számú I, X vagy C mögé fűzése 
                {
                    r += romaiszamjegyek[2 * helyiertek];
                }
            }
            else  // Ha az ertek 4 vagy 9, akkor 
                r += String.Concat(romaiszamjegyek[2 * helyiertek],romaiszamjegyek[2 * helyiertek + 1+(ertek/5)]);
            return r; 
        }
        
        public static string romai(int arab)
        {
            string s = arab.ToString();
            string romai = "";
            for (int i = 0; i <s.Length ; i++)
            {
                romai += arabszamjegybol_romai(s[i]-48, s.Length-i-1).ToString();
            }
            return romai;
        }
    }

    class teszt
    {        
        public teszt()
        {
            Console.WriteLine("Római szám\n");
            Console.WriteLine("Adjon meg egy egész számot 1 és 3999 között: ");
            int arabszam = int.Parse(Console.ReadLine());
            Console.WriteLine("Római szám alakban: ");
            Console.WriteLine(Romai.romai(arabszam));
            Console.ReadLine();
        }
    }

    class Program
    {        
        static void Main(string[] args)
        {
            teszt t = new teszt();
        }
    }
}
