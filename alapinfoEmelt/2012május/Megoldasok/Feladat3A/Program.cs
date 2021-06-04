using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Feladat3A
{
    class keppont
    {
        private int x;
        private int y;

        public int X { get { return x; } set { x = X; } }
        public int Y { get { return y; } set { y = Y; } }

        public keppont(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        public override string ToString()
        {
            return "(" + x + ";" + y + ")";
        }

        public bool szimmetrikus(keppont masik, keppont kepmeret)
        {
            return ((this.y == masik.y) && (this.X == kepmeret.x - 1 - masik.x));
        }

        public bool egyezik(keppont masik)
        {
            return (this.x == masik.x) && (this.y ==masik.y);
        }
    }

    class szakasz
    {
        private keppont a;
        private keppont b;
        private int[] rgb = new int[3];

        public szakasz(keppont a, keppont b, int[] rgb)
        {
            this.a = a;
            this.b = b;
            this.rgb = rgb;
        }

        public override string ToString()
        {
            return "(" + a + " ; " + b + " ; RGB(" + rgb[0] + "," + rgb[1] + "," + rgb[2] + ") )";
        }

        public int hossz()
        {
            return (int)Math.Round(Math.Sqrt(Math.Pow(a.X-b.X,2) + Math.Pow(a.Y-b.Y,2)));
        }

        public bool alapszinu()
        {
            return (((rgb[0] == 255) && (rgb[1] == 0) && (rgb[2] == 0)) ||
                     ((rgb[0] == 0) && (rgb[1] == 255) && (rgb[2] == 0)) ||
                     ((rgb[0] == 0) && (rgb[1] == 0) && (rgb[2] == 255)));
        }

        public bool egyszinu(szakasz masik)
        {
            return ((this.rgb[0]==masik.rgb[0])&&(this.rgb[1]==masik.rgb[1])&&(this.rgb[2]==masik.rgb[2]));
        }

        public bool fuggoleges()
        {
            return (a.X == b.X);
        }

        public bool vizszintes()
        {
            return (a.Y == b.Y);
        }

        public bool kapcsolodik(szakasz masik)
        {
            return this.a.egyezik(masik.a)||this.a.egyezik(masik.b)||this.b.egyezik(masik.a)||this.b.egyezik(masik.b);
        }

        public bool szimmetrikus(szakasz masik, keppont kepmeret)
        {
            return this.a.szimmetrikus(masik.a, kepmeret) &&
                   this.b.szimmetrikus(masik.b, kepmeret) ||
                   this.a.szimmetrikus(masik.b, kepmeret) &&
                   this.b.szimmetrikus(masik.a, kepmeret);       
        }
    }

    class kep
    {
        private static keppont kepmeret;
        private List<szakasz> szakaszok = new List<szakasz>();
      
        private void beolvas()
        {
            Console.Write("\n=> Adja meg a file nevét: ");
            string fnev = Console.ReadLine();

            StreamReader f = File.OpenText(fnev);
            string[] sor = f.ReadLine().Split(';');
            kepmeret = new keppont(int.Parse(sor[0]), int.Parse(sor[1]));
            while (!(f.EndOfStream))
            {
                sor = f.ReadLine().Split(';');
                keppont keppontA = new keppont(int.Parse(sor[0]), int.Parse(sor[1]));
                keppont keppontB = new keppont(int.Parse(sor[2]), int.Parse(sor[3]));
                int[] rgb = { int.Parse(sor[4]), int.Parse(sor[5]), int.Parse(sor[6]) };
                szakaszok.Add(new szakasz(keppontA, keppontB, rgb));
            }
        }

        private void szimmSzakaszDb()
        {
            int db = 0;
            for (int i = 1; i < szakaszok.Count; i++)
            {
                if (szakaszok[0].szimmetrikus(szakaszok[i],kepmeret)&&szakaszok[0].egyszinu(szakaszok[i]))
                {
                    db++;
                }
            }
            Console.WriteLine("\n=> Azon szakaszok száma, amelyek szimmetrikusak az első szakaszra, \n   és egyszínűek vele: "+db);
        }

        private void kapcsolodoSzakaszKeres()
        {
            bool van = false;
            int i=-1;
            int j = 0;
            while ((i < szakaszok.Count) && !(van))
            {
                i++;
                j = 0;
                while ((j < szakaszok.Count-1) && !(van))
                {
                    j++;
                    van = (szakaszok[i].fuggoleges() && szakaszok[j].vizszintes() && szakaszok[i].kapcsolodik(szakaszok[j]));
                }
            }
            if (van)
            {
                Console.WriteLine("\n=> A keresett egymáshoz kapcsolódó szakaszok: ");
                Console.WriteLine("   - a függőleges szakasz: " + szakaszok[i] + "\n   - a vízszintes szakasz: " + szakaszok[j]);
            }
            else
                Console.WriteLine("\n=> Nincs egymáshoz kapcsolódó függőleges, és vízszintes szakasz!");
        }
        
        private void maxAlapszinu()
        {
            bool van = false;
            int ind=-1;
            for (int i = 0; i < szakaszok.Count; i++)
            {
                if (szakaszok[i].alapszinu())
                {
                    if (!(van))
                    {
                        van = true;
                        ind = i;
                    }
                    else
                    {
                        if (szakaszok[i].hossz() > szakaszok[ind].hossz())
                        {
                            ind = i;
                        }
                    }
                }
            }
            if (ind == -1)
                Console.WriteLine("\n=> Nincs olyan szakasz, amelynek színe valamelyik alapszín!");
            else
                Console.WriteLine("\n=> A leghosszabb olyan szakasz sorszáma, amelynek színe alapszín: " + ind);
        }

        public kep()
        {
            beolvas();
            szimmSzakaszDb();
            kapcsolodoSzakaszKeres();
            maxAlapszinu();
            Console.ReadLine();
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            new kep();
        }
    }
}
