using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Gazdasag
{
    class Gazdasag
    {
        static int LegelőSzáma(int sor, int oszlop, int[,] T)
        {
            return Math.Max(T[sor - 1, oszlop], T[sor, oszlop - 1]);
        }

        static void Main()
        {
            string[] forras = File.ReadAllLines("terulet.txt");

            //2. feladat: Méretek
            int sorok = forras.Length;
            int oszlopok = forras[0].Length;
            Console.WriteLine("2. feladat: {0}m x {1}m, területe: {2}ha", sorok*100, oszlopok*100, sorok * oszlopok);

            //3. Feladat: Legelők százaléka
            int legelők_száma = 0;
            for (int i = 0; i < sorok; i++)
                for (int j = 0; j < oszlopok; j++) if (forras[i][j] == 'L') legelők_száma++;
            Console.WriteLine("3. feladat: {0:0.00}%", 100d * legelők_száma / (sorok * oszlopok));

            //4: Feladat: Északról milyen messze van az első legelő?
            int első_legelő;
            for (első_legelő = 0; első_legelő < sorok && !forras[első_legelő].Contains("L"); első_legelő++) ;
            Console.WriteLine("4. feladat: {0}m", első_legelő*100);

            //5: Feladat: K-Ny irányban a legszélesebb legelő
            int max_szélesség = 0;
            for (int i = 0; i < sorok; i++)
            {
                int akt_szélesség = 0;
                for (int j = 0; j < oszlopok - 1; j++)
                    if (forras[i][j] == 'L' && forras[i][j + 1] == 'L') akt_szélesség++;
                    else
                    {
                        akt_szélesség++;
                        if (akt_szélesség > max_szélesség) max_szélesség = akt_szélesség;
                        akt_szélesség = 0;
                    }

            }
            Console.WriteLine("5. feladat: {0}m", max_szélesség*100);

            //6. feladat: Legelők darabszáma
            int akt_legelő=0;
            int[,] legelők = new int[sorok, oszlopok];
            for (int i = 1; i < sorok-1; i++)
                for (int j = 1; j < oszlopok-1; j++)
                    if (forras[i][j] == 'L')
                    {
                        if (LegelőSzáma(i, j, legelők) == 0) akt_legelő++;
                        legelők[i, j] = akt_legelő;
                    }
            Console.WriteLine("6. feladat: {0}db", akt_legelő);

            //7. feladat: Legnagyobb területü legelő
            int[] területek = new int[akt_legelő];
            for (int i = 1; i < sorok - 1; i++)
                for (int j = 1; j < oszlopok - 1; j++)  
                    if (legelők[i,j]!=0) területek[legelők[i, j]-1]++;
            Console.WriteLine("7. feladat: {0}ha", területek.Max());

            Console.ReadKey();
        }
    }
}
