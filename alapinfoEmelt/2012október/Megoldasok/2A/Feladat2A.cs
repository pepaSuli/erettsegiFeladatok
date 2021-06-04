using System; 

namespace PalindromNegyzetszamok
{
    class Palindrom
    {
        static bool Negyzetszam(int szam)
        {
            int gyok = (int)(Math.Sqrt(szam));
            return Math.Pow(gyok, 2) == szam;
        }

        static void Main()
        {
            const int H = 5;
            bool elso = true;
            for (int i = (int)Math.Pow(10, H - 1); i <= (int)Math.Pow(10, H)-1; i++)
            {
                int szam;
                int index;
                bool palindrom;
                byte[] jegyek = new byte[H];
                szam = i;
                index = 0;
                palindrom = true;
                do
                {
                    jegyek[index] = (byte)(szam % 10);
                    index = index + 1;
                    szam = szam / 10;
                } while (szam > 0);

                int j;
                j = 0;
                while (j < index / 2 + 1 && palindrom)
                {
                    if (jegyek[j] != jegyek[index - 1 - j])
                    {
                        palindrom = false;
                    }
                    j++;
                }

                if (palindrom && Negyzetszam(i))
                {
                    if (elso) elso = false;
                    else Console.Write(", ");
                    Console.Write(i);
                }
            }

            Console.ReadKey(); //nem része a feladatmegoldásnak!
        }
    }
}
