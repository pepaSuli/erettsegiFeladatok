using System;

namespace PiKalkulacio
{
    class Spigot
    {
        static public string SpigotPi(int digits)
        {
            digits = digits + 1;
            string result = "";
            int N = digits * 3 + 2; 
            int[] x = new int[N];
            int[] r = new int[N];

            for (int j = 0; j < N; j++) x[j] = 20;

            for (int i = 0; i < digits; i++)
            {
                int carry = 0;
                for (int j = 0; j < N; j++)
                {
                    x[j] = x[j] + carry;
                    int num = N - j - 1;
                    int q = x[j] / (num * 2 + 1);
                    r[j] = x[j] % (num * 2 + 1);
                    carry = q * num;
                }
                if (i < digits - 1) result = result + x[N - 1] / 10;
                r[N - 1] = x[N - 1] % 10;
                for (int j = 0; j < N; j++) x[j] = r[j] * 10;
            }
            return result;
        }
        static void Main()
        {
            Console.WriteLine(SpigotPi(15));
            Console.ReadKey();
        }
    }
}
