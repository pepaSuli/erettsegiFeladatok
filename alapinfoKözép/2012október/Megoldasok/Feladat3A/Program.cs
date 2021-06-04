using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Szétválogatás
{
    class Szetvalogato
    {
        private const int n=20;
        private double[] a=new double[n];
        private Random r=new Random();

        public void Feltolt()
        {
           for (int i = 0; i < n; i++)
			{
                a[i] = r.NextDouble() * 1000 - 500;
			}
        }

        public void Kiir(string s)
        {
            Console.WriteLine(s);
            for (int i = 0; i < n; i++)
            {
                Console.Write(Math.Round(a[i],2)+" ");
            }
            Console.ReadLine();
        }

        public void Szetvalogat()
        {
            int k = 0;
            int l = n-1;
            double x = a[k];
            while (k < l)
            {
                while ((k < l) && (a[l] >= x))
                {
                    l--;
                }
                if (k < l)
                {
                    a[k++] = a[l];
                }

                while ((k < l) && (a[k] <= x))
                {
                    k++;
                }
                if (k < l)
                {
                    a[l--] = a[k];
                }
            }
            a[k] = x;
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Szetvalogato s = new Szetvalogato();
            s.Feltolt();
            s.Kiir("Eredeti sorozat:");
            s.Szetvalogat();
            s.Kiir("Szétválogatott sorozat:");
        }
    }
}
