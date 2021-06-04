using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Egyszerusit
{
    class Egyszerusit
    {
        static void Main()
        {
            Console.Write("Számláló: ");
            uint sz;
            sz  = uint.Parse(Console.ReadLine());
            uint esz;
            esz=sz;
            uint n;
            do
            {
                Console.Write("Nevező: ");
                n = uint.Parse(Console.ReadLine());
            } while (n == 0);
            uint en;
            en = n;

            uint maradek;
            while (n != 0)
            {
                maradek = sz % n;
                sz = n;
                n = maradek;
            }
            uint lnko;
            if (sz > n) lnko = sz; else lnko = n;
            Console.WriteLine("Az eredeti tört: {0}/{1}", esz, en);
            if (lnko == 1) Console.WriteLine("Tovább nem egyszerűsíthető!");
            else
            {
                if (en == lnko) Console.WriteLine("Az egész szám: {0}", esz / lnko);
                else
                    Console.WriteLine("Egyszerűsítve: {0}/{1}", esz / lnko, en / lnko);
            }
            Console.ReadLine();
        }
    }
}
