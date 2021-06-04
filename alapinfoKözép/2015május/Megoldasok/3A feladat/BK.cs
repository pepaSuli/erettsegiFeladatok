using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BinarySerach
{
    class BK
    {
        static int Kozep(int also, int felso)
        {
            return also + (felso - also) / 2;
        }

        static int BinarisKereses(int[] t, int keresett)
        {
            int a = 0; //alsó index
            int f = t.Length - 1; //felső index
            int k; //középső index

            while (a <= f)
            {
                k = Kozep(a, f);
                if (keresett == t[k])
                {
                    return k;
                }
                else if (keresett < t[k])
                    f = k - 1;
                else
                    a = k + 1;
            }
            return -1; //-1 jelzi, hogy a keresés sikertelen
        }

        static void Main()
        {
            Random r = new Random();
            int[] v = new int[10]; //vektor
            v[0] = r.Next(1, 10);
            for (int i = 1; i < v.Length; i++)
            {
                v[i] = v[i - 1] + r.Next(1, 6);
            }
            if (BinarisKereses(v, r.Next(1, 31)) != -1) Console.WriteLine("Megtalálható!");
            else Console.WriteLine("Nem található meg!");
            Console.ReadKey(); //nem része a megoldásnak
        }
    }
}
