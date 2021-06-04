using System;

namespace Ngyok
{
    class Ngyok
    {
        public static double Negyzetgyok(double x)
        {
            double pontossag, also, felso, proba;
            // A legnagyobb pontosságú valós típust használja!
            if (x > 0)
            {
                pontossag = 0.00000000000001;
                if (x < 1)
                {
                    also = x;
                    felso = 1;
                }
                else
                {
                    also = 1;
                    felso = x;
                }

                while (felso - also > pontossag)
                {
                    proba = (also + felso) / 2;
                    if (proba * proba > x) felso = proba;
                    else also = proba;
                }
                return (also + felso) / 2; ;
            }
            else if (x == 0) return 0; else return -1;
        }
        static void Main()
        {
            Console.WriteLine(Negyzetgyok(0));
            Console.WriteLine(Negyzetgyok(3.3));
            Console.WriteLine(Negyzetgyok(2));
            Console.WriteLine(Negyzetgyok(9));
            Console.WriteLine(Negyzetgyok(-9));
        }

    }
}
