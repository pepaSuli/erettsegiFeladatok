using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat1
{
        class binomialis
        {
            public int n, k;
            public void beker()
            {
                do
                {
                    Console.Write(" Adja meg n értékét: ");
                    n = int.Parse(Console.ReadLine());
                }
                while (n < 0);
                do
                {
                    Console.Write(" Adja meg k értékét: ");
                    k = int.Parse(Console.ReadLine());
                }
                while (!(n >= k && k >= 0));
            }

            
            private int binom(int n, int k)
            {
                double szamlalo = 1; // Valósban számolunk
                double nevezo = 1;
                int j = n;           // A számlálóban n-ről indulunk, és lefelé lépünk
                for (int i = 1; i <= k; i++)
                {
                    szamlalo *= j--;
                    nevezo *= i;
                }
                return (int)Math.Round(szamlalo / nevezo);
            }

            public void binomkiir()
            {
                Console.WriteLine(" "+n+" alatt a " + k + ": " + binom(n, k));
            }
        }

        class Program
        {
            static void Main(string[] args)
            {
                binomialis b = new binomialis();
                b.beker();
                b.binomkiir();
                Console.ReadLine();
            }
        }

}



