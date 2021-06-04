using System;

namespace ConsoleApplication1
{
    public class armstrong
    {
        static int Hatvany(byte alap, byte kitevo)
        {
            int eredmeny;
            eredmeny = 1;
            while (kitevo > 0)
            {
                eredmeny = eredmeny * alap;
                kitevo = (byte)(kitevo - 1);
            }
            return eredmeny;
        }

        static void Main()
        {
            int n, szam, kob;
            byte jegy, db;
            db = 0;
            Console.WriteLine("Haromjegyu Armstrong-szamok:");
            for (szam = 100; szam <= 999; szam++)
            {
                kob = 0;
                n = szam;
                while (n!=0)
                {
                    jegy = (byte)(n % 10);
                    kob = kob + Hatvany(jegy,3);
                    n = n / 10;
                }
                if (kob == szam)
                {
                    Console.WriteLine(szam);
                    db = (byte)(db + 1);
                }
            }
            Console.WriteLine("Darabszam:{0}", db);
            Console.ReadKey();
        }
    }
}