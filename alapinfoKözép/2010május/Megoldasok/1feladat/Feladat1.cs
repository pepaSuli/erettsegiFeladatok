using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat1
{

    class rendezo
    {
        private const int n = 10;
        private int[] a = new int[n];

        public void generalas()
        {
            Random randNum = new Random();
            for (int i = 0; i < n; i++)
            {
                a[i] = randNum.Next(101)-50;
            }
        }

        public void kiir()
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write(a[i] + " ");
            }
            Console.WriteLine();
            Console.ReadLine();
        }

        public void beillesztrendez()
        {
            for (int i = 1; i < n; i++)
            {
                int j = i - 1;
                int x = a[i];
                while ((j > -1) && (x < a[j]))
                {
                    a[j + 1] = a[j--];
                }
                a[j + 1] = x;
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            rendezo r = new rendezo();
            r.generalas();
            r.kiir();
            r.beillesztrendez();
            r.kiir();
        }
    }
}
