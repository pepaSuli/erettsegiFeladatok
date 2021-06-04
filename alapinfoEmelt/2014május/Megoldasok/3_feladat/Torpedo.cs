using System;
using System.Collections.Generic;
using System.IO;

namespace Torpedo
{
    class Torpedo
    {
        public struct lövés
        {
            public int sor;
            public int oszlop;
        }

        static void Main(string[] args)
        {
            //1. feladat: Adatbevitel. adatszerkezet feltöltése
            byte[,] m = new byte[12, 12];
            string[] sorok = File.ReadAllLines("adatok.txt");
            for (int i = 1; i <= 10; i++)
            {
                for (int j = 1; j <= 10; j++)
                {
                    m[i, j] = Byte.Parse(sorok[i-1][j-1].ToString());
                }
            }

            //2. feladat: Lövések beolvasása
            List<lövés> lövések = new List<lövés>();
            for (int i = 10; i < sorok.Length; i++)
            {
                lövések.Add(new lövés() 
                { 
                    sor = (int)sorok[i][0]-64,
                    oszlop = int.Parse(sorok[i][1].ToString()) 
                });
            }

            //3. feladat: Játéktér, hajók, víz és lövések
            Console.WriteLine("3. feladat: Játéktér, hajók(1), víz(0) és lövések(szürke háttér)");
            Console.Write("  ");
            for (int i = 1; i <= 10; i++) Console.Write("{0,-2}", i);
            Console.WriteLine();

            for (int i = 1; i <= 10; i++)
            {
                Console.Write("{0,-2}",(char)(i+64));
                for (int j = 1; j <= 10; j++)
                {
                    Console.BackgroundColor = ConsoleColor.White;
                    foreach (var lv in lövések)
                    {
                        if (lv.sor == i && lv.oszlop == j)
                        {
                            Console.BackgroundColor = ConsoleColor.Gray;
                            break;
                        }
                    }
                    Console.Write("{0,-2}",m[i, j]);
                }
                Console.WriteLine();
            }

            //4. feladat: Találatok száma
            int találatok = 0;
            foreach (var i in lövések) if (m[i.sor, i.oszlop] == 1) találatok++;
            Console.WriteLine("\n4. feladat: Találatok száma: {0} db", találatok);


            //5. feladat: Új kódolás
            Console.WriteLine("\n5. feladat: A hajók helyzetének új kódolása:");
            List<string> newForm = new List<string>();
            bool[,] sm = new bool[12, 12]; //Segédtömb a már kódolt cellák tárolására
            for (int i = 1; i <= 10; i++)
            {
                for (int j = 1; j <= 10; j++)
                {
                    if (m[i, j] == 1 && !sm[i, j])
                    {
                        if (m[i, j + 1] == 0 && m[i + 1, j] == 0) //Egycellás hajók:
                        {
                            sm[i, j] = true;
                            newForm.Add(((char)(i + 64)).ToString() + (j<10?((char)(j + 48)).ToString():"10"));
                        }
                        else //Többcellás hajók
                        {
                            if (m[i, j + 1] == 1)
                            {  //Vízszintes többcellás:
                                sm[i, j] = true;
                                sm[i, j + 1] = true;
                                int vhossz = 2;
                                while (m[i, j + vhossz] != 0) { sm[i, j + vhossz] = true; vhossz++; }
                                newForm.Add(((char)(i + 64)).ToString() + (j < 10 ? ((char)(j + 48)).ToString() : "10") + 'v' + vhossz);
                            }
                            else //Függőleges többcellás
                            {
                                sm[i, j] = true;
                                sm[i+1, j] = true;
                                int fhossz = 2;
                                while (m[i+fhossz, j] != 0) { sm[i+fhossz, j] = true; fhossz++; }
                                newForm.Add(((char)(i + 64)).ToString() + (j < 10 ? ((char)(j + 48)).ToString() : "10") + 'f' + fhossz);
                            }
                        }
                    }
                }
                
            }
            File.WriteAllLines("hajok.txt", newForm);
            foreach (var i in newForm) Console.Write("{0}-",i);
            Console.ReadKey();
        }
    }
}