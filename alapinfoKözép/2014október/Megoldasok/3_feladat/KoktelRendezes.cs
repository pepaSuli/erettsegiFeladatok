using System;

namespace KoktelRendezes
{
    class KoktelRendezes
    {
        static void KiirTomb(byte[] t)
        {
            for (int i = 0; i < t.Length; i++) Console.Write("{0}, ", t[i]);
            Console.WriteLine();
        }

        static void Main()
        {
            byte[] t = {54, 68, 14, 70, 93, 91, 39, 37, 7, 13};
            byte kezd = 0;
            byte veg = (byte)(t.Length - 1);
            bool csereVolt;
            byte csere;
            KiirTomb(t);
            do
            {
                csereVolt = false;
                for (byte i = kezd; i <= veg-1; i++)
                {
                    if (t[i] > t[i + 1])
                    {
                        csere = t[i];
                        t[i] = t[i + 1];
                        t[i + 1] = csere;
                        csereVolt = true;
                    }
                }
                veg--;

                if (csereVolt)
                {
                    csereVolt = false;
                    for (byte i = veg; i >= kezd+1; i--)
                    {
                        if (t[i] < t[i - 1])
                        {
                            csere = t[i];
                            t[i] = t[i - 1];
                            t[i - 1] = csere;
                            csereVolt = true;
                        }
                    }
                    kezd++;
                }
            } while (csereVolt);
            KiirTomb(t);
            Console.ReadKey();
        }
    }
}
