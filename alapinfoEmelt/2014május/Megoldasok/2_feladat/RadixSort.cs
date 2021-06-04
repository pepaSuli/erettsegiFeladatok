using System;

namespace RadixSort
{
    class RadixSort
    {
        static void KiirTomb(int[] t, string sz)
        {
            Console.WriteLine(sz);
            for (int i = 0; i < t.Length; i++) Console.WriteLine("t[" + i + "] = " + t[i]);
        }

        static void Main()
        {
            int[] t = { 11, 1, 23, 45, 98, 7, 6, 554, 34, 100 };
            KiirTomb(t, "Rendezes előtt:");
            int[] st = new int[t.Length];
            int EgeszBitMeret = sizeof(int) * 8;
            int[] Szamlalo = new int[16];
            int[] Prefix = new int[16];
            int Csoportok = EgeszBitMeret / 4;
            int Maszk = 15;
            int Eltol = 0;
            int ind;
            for (int c = 0; c < Csoportok; c++)
            {
                for (int i = 0; i < Szamlalo.Length; i++) Szamlalo[i] = 0;
                for (int i = 0; i < t.Length; i++)
                {
                    ind = (t[i] >> Eltol) & Maszk;
                    Szamlalo[ind] = Szamlalo[ind]+1;
                }
                Prefix[0] = 0;
                for (int i = 1; i < Szamlalo.Length; i++) Prefix[i] = Prefix[i - 1] + Szamlalo[i - 1];
                for (int i = 0; i < t.Length; i++)
                {
                    ind = (t[i] >> Eltol) & Maszk;
                    st[Prefix[ind]] = t[i];
                    Prefix[ind]++;
                }
                for (int i = 0; i < t.Length; i++) t[i] = st[i];
                Eltol = Eltol + 4;
            }

            KiirTomb(t, "Rendezes után:");
            Console.ReadKey();
        }
    }
}
