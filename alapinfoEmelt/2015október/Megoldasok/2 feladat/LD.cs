using System;

namespace Levenshtein
{
    class LD
    {
        int Min(int a, int b)
        {
            if (a < b) return a; else return b;
        }
        public int LDTav(string s1, string s2)
        {
            
            int h1 = s1.Length;
            int h2 = s2.Length;
            int[,] m = new int[26, 26];
            if (h1 == 0) return h2;
            if (h2 == 0) return h1;

            for (int i = 0; i <= h1; i++) m[i, 0] = i;
            for (int j = 0; j <= h2; j++) m[0, j] = j;

            for (int i = 1; i <= h1; i++)
            {
                for (int j = 1; j <= h2; j++)
                {
                    int c = 1;
                    if (s2[j - 1] == s1[i - 1]) c = 0;
                    m[i, j] = Min(Min(m[i - 1, j] + 1, m[i, j - 1] + 1), m[i - 1, j - 1] + c);
                }
            }
            return m[h1, h2];
        }

        static void Main()
        {
            Console.WriteLine(new LD().LDTav("alma", "falja"));
            Console.ReadKey();
        }
    }
}