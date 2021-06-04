using System;

namespace Prime
{
    class Prime
    {

        public static ulong elsoOszto(ulong N)
        {
            int[] szita = new int[] { 7, 11, 13, 17, 19, 23, 29, 31 };
            int[] elsoPrimek = new int[] { 2, 3, 5 };
            ulong ngyok;
            ulong i;
            int j;

            if (N == 1) return 0;
            
            for (j=0; j<elsoPrimek.Length;j++)
            {
                if (N % (ulong)elsoPrimek[j] == 0) return (ulong)elsoPrimek[j];
            }
            ngyok = (ulong)Math.Sqrt(N);

            i = 0;
            while (i < ngyok)
            {
                for (j = 0; j < szita.Length; j++)
                {
                    if (N % (i + (ulong)szita[j]) == 0)
                    {
                        return i + (ulong)szita[j];
                    }
                }
                i = i + 30;
            }
            return N;
        }

        public static bool primSzam(ulong N)
        {
            return elsoOszto(N) == N;
        }

        static void Main()
        {
           Console.WriteLine(primSzam(100));
           Console.WriteLine(primSzam(101));
          // Console.ReadKey();
        }
    }
}
