using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat1
{
    class orgona
    {
        private const int n = 10;
        private int[] a = new int[n];

        public void tombbeker()
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write((i+1)+". elem: ");
                a[i] = int.Parse(Console.ReadLine());
            }
        }

        public void orgonarendez()
        {
            int j = 0;
            int k = n - 1;
            for (int i = 0; i < n; i++)
            {
                int ind=j;
                for (int l = j+1; l <=k ; l++)
                {
                    if (a[l]<a[ind])
                    {
                        ind=l;
                    }
                }
                int s = a[ind];
                if (i % 2 == 0)
                { 
                    a[ind] = a[j];
                    a[j++] = s;
                }
                else
                {
                    a[ind] = a[k];
                    a[k--] = s;
                }
            }
        }

        public void tombkiir()
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write(a[i] + " ");
            }
            Console.WriteLine();
            Console.ReadLine();
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            orgona o = new orgona();
            o.tombbeker();
            o.orgonarendez();
            o.tombkiir();
        }
    }
}
