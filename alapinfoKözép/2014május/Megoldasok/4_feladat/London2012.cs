using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace London2012
{
    class Sportag
    {
        public string nev;
        public byte[] dontok = new byte[16];
        
        public Sportag(string sor, int ssz)
        {
            string[] adatok = sor.Split(';');
            nev = adatok[0];
            for (int i = 1; i < adatok.Length; i++) dontok[i - 1] = byte.Parse(adatok[i]);
        }
        
       
        public int DontoNapok
        {
            get
            {
                int db = 0;
                foreach (var i in dontok) if (i != 0) db++;
                return db;
            }
        }

        public int DontoDB
        {
            get
            {
                int db = 0;
                foreach (var i in dontok) db = db + i;
                return db;
            }
        }

    }


    class London2012
    {
        static int NapToInd(int nap)
        {
            return nap > 27 ? nap - 28 : nap - 1;
        }

        static int IndToNap(int ind)
        {
            return ind < 4 ? 28 + ind : ind - 3;
        }

        static void Main()
        {
            //"1. feladat: Beolvasás, adatszerkezet feltöltése");
            string[] forras = File.ReadAllLines("London2012.txt");
            List<Sportag> sportagak = new List<Sportag>();
            int ssz = 0;
            foreach (var i in forras) sportagak.Add(new Sportag(i,ssz++));
            
            //"2. feladat: Hány nap volt atlétikában döntő?
            Console.WriteLine("2. feladat:");
            int ind=0;
            while (sportagak[ind].nev != "Atlétika") ind++;
            Console.WriteLine("\tDöntős napok száma atlétika sportágban: {0}db", sportagak[ind].DontoNapok);

            //"3. feladat: Hány aranyérmet oszttak ki úszás sportágban?
            Console.WriteLine("3. feladat:");
            ind = 0;
            while (sportagak[ind].nev != "Úszás") ind++;
            Console.WriteLine("\tAranyérmek száma úszásban: {0}db", sportagak[ind].DontoDB);

            //4. feladat: Hányadikán volt a legtöbb döntő?
            Console.WriteLine("4. feladat:");
            int max_donto = 0;
            int max_nap = 0;
            for (int nap = 0; nap < 16; nap++)
            {
                int napi_donto = 0;
                foreach (var i in sportagak)
                {
                    napi_donto += i.dontok[nap];
                }
                if (napi_donto > max_donto)
                {
                    max_donto = napi_donto;
                    max_nap = nap;
                }
            }
            Console.WriteLine("\tA legtöbb döntő ({0}db) {1}.-án/én volt.", max_donto, IndToNap(max_nap));

            //5.Feladat: Hány aranyérmet osztottak ki az olimpián?
            Console.WriteLine("5. feladat:");
            int db = 0;
            foreach (var i in sportagak)
            {
                db+=i.DontoDB;
            }
            Console.WriteLine("\t{0}db  aranyérmet osztottak ki az olimpián.", db);

            //6.feladat: 29-én hány döntő volt?
            Console.WriteLine("6. feladat:");
            db = 0;
            foreach (var i in sportagak)
            {
                db += i.dontok[NapToInd(29)];
            }
            Console.WriteLine("\t29.-án/én {0}db döntő volt.", db);


            Console.ReadKey();
        }
    }
}
