using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2
{
    class Felmeres
    {
        private const int max = 15;
        private double[] meresek = new double[max];
        private int n=0; // A mérések száma

        public void feltolt()
        {
            bool kilep=false;
            Console.WriteLine("=> Adatok beolvasása:");
            Console.WriteLine();
            do
            {
                Console.Write("  "+(n + 1) + ". mért érték: ");
                string s = Console.ReadLine();
                kilep=(s=="*");
                if (!kilep)
                   meresek[n++]= double.Parse(s);
            }
            while (n<max && !kilep);
        }

        public void rendez()
        {
            for (int i = 0; i < n-1; i++)
            {
                for (int j = i + 1; j < n; j++) 
                { 
                    if (meresek[i]>meresek[j])
                    {
                        double s=meresek[i];
                        meresek[i]=meresek[j];
                        meresek[j]=s;
                    }
                }
            }
        }

        public void kiir()
        {
            Console.WriteLine();
            Console.WriteLine("=> A mért értékek gyakorisága: ");
            Console.WriteLine();
            int db = 1;
            for (int i = 0; i < n; i++)
            {
                if ((i < n - 1 && meresek[i] < meresek[i + 1]) || (i==n-1))
                {
                    Console.Write("  "+meresek[i]+": "+db+" db");
                    db = 1;
                }
                else 
                {
                    db++;
                }
            }
            Console.WriteLine();
            Console.ReadKey();
        }        
    }

    class Program
    {
        static void Main(string[] args)
        {
            Felmeres m = new Felmeres();
            m.feltolt();
            m.rendez();
            m.kiir();  
        }
    }
}
