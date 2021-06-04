using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Feladat2
{
    class szamrendszer
    {
        private string szama, szamb;
        
        public void beker_szamit()
        {
            Console.WriteLine("=>  Összeadás 2-es számrendszerben\n");
            Console.Write("   Adja meg az első számot: ");
            szama = Console.ReadLine();
            Console.Write("   Adja meg második számot: ");
            szamb = Console.ReadLine();
            Console.WriteLine("\n   Az összeg: "+osszeg(szama, szamb));
            Console.ReadLine();
        }
        
        public string osszeg(string a, string b)
        {
            string c;
            if (a.Length < b.Length)  // Az a-ban legyen a hosszabb string
            {
                c = a;
                a = b;
                b = c;
            }
            
            while (a.Length>b.Length)  // b feltöltése '0'-kal, amíg a-val egyenlő hosszú nem lesz
            {
                b = String.Concat('0',b);
            }

            int atvitel = 0;
            int eredmeny;   
            c = ""; 
            for (int i = a.Length-1; i >=0; i--)
            {
                eredmeny=ertek(a[i])+ertek(b[i])+atvitel;
                if (eredmeny >= 2)  // Ha van átvitel
                {
                    eredmeny -= 2;  // az eredmény-be az utolsó jegyet tesszük
                    atvitel = 1;
                }
                else
                    atvitel = 0;
                c =karakter(eredmeny)+c;                
            }
            if (atvitel == 1)  // Ha a legnagyobb helyiértéken van átvitel
                c = '1' + c;
            return c;
        }

        public int ertek(char c)  // '0' => 0,  '1' => 1
        {
            return c - 48;
        }

        public char karakter(int a)   // 0 => '0',  1 => '1'
        {
            return (char)(a + 48);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            szamrendszer s = new szamrendszer();
            s.beker_szamit();
        }
    }
}
