using System;

namespace NLSz
{
    class NLSz
    {
        const int N = 5;
        static char[] Cserel(char[] szam, int i1, int i2)
        {
            char ch = szam[i1];
            szam[i1] = szam[i2];
            szam[i2] = ch;
            return szam;
        }

        static char[] Keres(char[] szam)
        {
            int indA = -1;
            int i = N - 1;
            while (i > 0 && indA == -1)
            {
                if (szam[i - 1] < szam[i]) indA = i - 1;
                i--;
            }

            if (indA == -1) return szam;

            int indB = indA + 1;
            for (int j = indA + 2; j <= N - 1; j++)
            {
                if (szam[j] > szam[indA] && szam[j] < szam[indB]) indB = j;
            }

            szam = Cserel(szam, indA, indB);

            for (int ig = N - 1; ig >= 1; ig--)
            {
                for (int j = indA + 1; j <= ig - 1; j++)
                {
                    if (szam[j] > szam[j + 1]) szam = Cserel(szam, j, j + 1);
                }
            }

            return szam;
        }

        static void Main()
        {
            char[] szam = new char[N];
            szam[0] = '5';
            szam[1] = '2';
            szam[2] = '6';
            szam[3] = '3';
            szam[4] = '1';

            //vagy: char[] szam = { '5', '2', '6', '3', '1' };
            Console.WriteLine(szam);
            Console.WriteLine(Keres(szam));
            Console.ReadKey(); //Nem a megoldás része
        }
    }
}
