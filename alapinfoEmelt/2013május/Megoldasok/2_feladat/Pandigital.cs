using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pandigital
{
    class PandigitalClass
    {
        static bool Pandigital(int szam) //Nulla mentes pandigital szám ellenőrzése
        {
            int jegyek = 0;int db = 0;int tmp;

            while (szam > 0)
            {
                tmp = jegyek;
                jegyek = jegyek | (1 << (((szam % 10) - 1))); //mod
                if (tmp == jegyek) return false;
                db = db + 1;
                szam = szam / 10; //div
            }
            return jegyek == (1 << db) - 1;
        }

        static int Faktorialis(int faktor)
        {
            if (faktor > 1)
            {
                return faktor * Faktorialis(faktor - 1);
            }
            return 1;
        }

        static void Main()
        {
            int db = 0;
            for (int i = 123456789; i <= 198765432; i++)
            {
                if (Pandigital(i))
                {
                    db = db + 1;
                }
            }
            Console.WriteLine(db);
            Console.WriteLine(Faktorialis(8));
            Console.ReadKey();
        }
    }
}
