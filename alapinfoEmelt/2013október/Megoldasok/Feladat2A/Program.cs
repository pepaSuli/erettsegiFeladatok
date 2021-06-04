using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Permutációk
{
    class Permutalas
    {
        private const int max = 20;
        private int[] x = new int[max];

        private void kiir(int n)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write(x[i] + " ");
            }
            Console.WriteLine();
        }

        private bool rosszeset(int i)
        {
            int j = 0;
            while ((j < i) && (x[j] != x[i]))
            {
                j++;
            }
            return (j < i);
        }
        
        private bool vanjoeset(int i,int n)
        {
            do
            {
                x[i]++;
            }
            while ((x[i] <= n ) && rosszeset(i));
            return (x[i] <= n );
        }

        public void permutal(int n)
        {
            for (int j = 0; j < n; j++)
            {
                x[j] = 0;
            }

            int i = 0;
            while (i >= 0)
            {
                while ((i >= 0) && (i <= n - 1))
                {
                    if (vanjoeset(i, n))
                    {
                        i++;
                    }
                    else
                    {
                        x[i--] = 0;
                    }
                }
                if (i > n - 1)
                {
                    kiir(n);
                    i = n - 1;
                }
            }
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            Permutalas p = new Permutalas();
            Console.Write("N=");
            int n = int.Parse(Console.ReadLine());
            Console.WriteLine("Permutációk:");
            p.permutal(n);
            Console.ReadLine();
        }
    }
}
