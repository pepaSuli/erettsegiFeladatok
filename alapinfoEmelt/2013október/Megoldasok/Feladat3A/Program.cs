using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication1
{
    class amoba
    {   
        private const int n=10;
        private const int kor=0;
        private const int kereszt=1;
        private const int ures=2;

        private int[,] tabla=new int[n,n];
        private int kordb=0;
        private int keresztdb = 0;
        private int akt, kov;
        private int kezd = -1;
        private bool hiba = false;

        private void betolt() // a.,b., feladat
        {
            Console.Write("=> Adja meg a file nevét: ");
            string fnev = Console.ReadLine();
            StreamReader f = File.OpenText(fnev);
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    tabla[i,j] = ures;
                }
            }

            while (!(f.EndOfStream)&&!hiba)
            {
                string s = f.ReadLine();
                if ((s == "O") || (s == "X"))
                {
                    akt = (s == "O" ? kor : kereszt);
                    if (kezd==-1) kezd = akt;
                }
                else
                {
                    if (akt == kor)
                    {
                        kordb++;
                    }
                    else
                    {
                        keresztdb++;
                    }
                    string[] reszek=s.Split(' ');
                    int sor=int.Parse(reszek[0])-1;
                    int oszlop=int.Parse(reszek[1])-1;
                    if (tabla[sor, oszlop] == ures)
                    {
                        tabla[sor, oszlop] = akt;
                    }
                    else
                    {
                        hiba = true;
                        Console.WriteLine("\n=> Az állás hibás, az első hibás lépés: "+s);
                    }
                }
            }
        }

        private void kiir()  // c., feladat
        {
            string s = "\n=> A játék állása:\n\n";
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    s += (tabla[i, j] == kor ? "O" : (tabla[i, j] == kereszt ? "X" : "."));
                }
                s += "\n";
            }
            Console.WriteLine(s);
        }

        private void kovetkezik()
        {
            if (kordb == keresztdb)
            {
                kov = kezd;
            }
            else
            {
                if (kezd == kor)
                    kov = kereszt;
                else
                    kov = kor;
            }
            Console.WriteLine("=> A játékot kezdte: " + (kezd == kor ? "O" : "X"));
            Console.WriteLine("   Következik      : "+(kov==kor?"O":"X"));
        }

        private void vsorozatok()
        {
            Console.WriteLine("\n=>  Vízszintes sorozatok\n");
            Console.WriteLine(String.Format("{0,5}{1,12}{2,10}{3,10}", "Sor","Kezdete","Vége","Hossz"));
            int i = -1;
            int max = 0;
            while(i<n-1)
            {
                i++;
                int j=-1;
                int db = 0;
                int kezdet=0,veg=0;
                while(j<n-1)
                {
                    j++;
                    if (tabla[i, j] == kov)
                    {
                        db++;
                        if (db == 1) kezdet = j;
                    }
                    else 
                    {
                        if (db > 0)
                        {
                            veg = j - 1;
                            Console.WriteLine(String.Format("{0,5}{1,9}{2,12}{3,10}", (i+1)+".",kezdet + 1,veg+1,db));
                            if (db > max) max = db;
                            db = 0; 
                        }
                    }
                }
            }
            Console.WriteLine("\n=>  A leghosszabb vízszintes sorozat hossza: "+max);
        }

        public void feladatok()
        {
            betolt();
            if (!hiba)
            {
                kiir();
            }
            kovetkezik();
            vsorozatok();
            Console.ReadLine();
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            amoba a = new amoba();
            a.feladatok();
        }
    }
}
