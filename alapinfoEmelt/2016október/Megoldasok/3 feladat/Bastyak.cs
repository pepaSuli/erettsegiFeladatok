using System;
using System.Collections.Generic;

namespace Bastyak
{
    class Tábla
    {
        char[,] T;
        static Random R = new Random();
        public HashSet<int> H { get; set; }

        public Tábla()
        {
            T = new char[8, 8];
            H = new HashSet<int>();
        }

        public void Elhelyez(int db, int min, int max, char mit)
        {
            for (int i = 0; i < db; )
            {
                int sor = R.Next(min, max + 1);
                int oszlop = R.Next(min, max + 1);
                if (T[sor, oszlop] != 'G' && T[sor, oszlop] != 'B')
                {
                    T[sor, oszlop] = mit;
                    i++;
                }
            }
        }


        public int BástyaÉrték(int sor, int oszlop)
        {
            int érték = 0;
            //Balra:
            bool kijut = true;
            for (int x = oszlop - 1; x >= 0; x--)
                if (T[sor, x] != '\0')
                {
                    kijut = false;
                    break;
                }
            if (kijut) érték++;

            //Jobbra:
            kijut = true;
            for (int x = oszlop + 1; x < T.GetLength(1); x++)
                if (T[sor, x] != '\0')
                {
                    kijut = false;
                    break;
                }
            if (kijut) érték++;

            //Fel:
            kijut = true;
            for (int x = sor - 1; x >= 0; x--)
                if (T[x, oszlop] != '\0')
                {
                    kijut = false;
                    break;
                }
            if (kijut) érték++;

            //Le:
            kijut = true;
            for (int x = sor + 1; x < T.GetLength(0); x++)
                if (T[x, oszlop] != '\0')
                {
                    kijut = false;
                    break;
                }
            if (kijut) érték++;
            return érték;
        }
        public void BástyákÉrtékei()
        {
            for (int sor = 0; sor < T.GetLength(0); sor++)
            {
                for (int oszlop = 0; oszlop < T.GetLength(1); oszlop++)
                {
                    if (T[sor, oszlop] == 'B')
                    {
                        int érték = BástyaÉrték(sor, oszlop);
                        T[sor, oszlop] = érték.ToString()[0];
                        H.Add(érték);
                    }
                }
            }
        }


        //2. feladat:
        public void Megjelenít()
        {
            for (int sor = 0; sor < T.GetLength(0); sor++)
            {
                for (int oszlop = 0; oszlop < T.GetLength(1); oszlop++)
                {
                    if (T[sor, oszlop] != '\0') Console.Write("{0}", T[sor, oszlop]);
                    else Console.Write('#');
                }
                Console.WriteLine();
            }
        }

    }
    class Bastyak
    {
        static void Main()
        {
            Tábla t = new Tábla();
            Console.WriteLine("1. feladat: Gyalogok elhelyezése:");
            t.Elhelyez(10, 0, 7, 'G');
            t.Megjelenít();

            Console.WriteLine("\n3. feladat: Bástyák elhelyezése:");
            t.Elhelyez(5, 1, 6, 'B');
            t.Megjelenít();

            Console.WriteLine("\n4. feladat: Bástyák lépésértékei:");
            t.BástyákÉrtékei();
            t.Megjelenít();

            Console.WriteLine("\n5. feladat: Minden érték:");
            while (true)
            {
                
                t = new Tábla();
                t.Elhelyez(10, 0, 7, 'G');
                t.Elhelyez(5, 1, 6, 'B');
                t.BástyákÉrtékei();
                if (t.H.Count == 5)
                {
                    t.Megjelenít();
                    break;
                }
            }
            Console.ReadKey();
        }
    }
}
