using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2
{
    class Euklidesz
    {
        private int a, b;

        public bool beker()
        {
            Console.Write("Adjon meg egy pozitív egész számot (kiléphet bármely nempozitív egésszel): ");
            a = int.Parse(Console.ReadLine());
            if (a > 0)
            {
                Console.Write("Adjon meg egy másikat is: ");
                b = int.Parse(Console.ReadLine());
            }
            return (a > 0);
        }

        private int lnko(int a, int b)
        {
            if (a < b)  // Ha a<b, akkor felcseréljük a kettőt
            {
                int s = a;
                a = b;
                b = s;
            }

            int e, m;

            do
            {
                e = a / b;  // Egészosztás eredménye e-be kerül
                m = a % b;  // Egészosztás maradéka  m-be kerül
                if (m != 0) // Ha nem nulla a maradék, léptetjük az adatokat
                {
                    a = b;  // b->a  
                    b = m;  // m->b
                }
            }
            while (m != 0); // Amíg 0-tól különböző a maradék

            return b;
        }

        public void lnkokiir()
        {
            Console.WriteLine("A két szám legnagyobb közös osztója: " + lnko(a, b));
            Console.ReadLine();
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Euklidesz e = new Euklidesz();
            while (e.beker())
            {
               e.lnkokiir();
            }
            
        }
    }
}
