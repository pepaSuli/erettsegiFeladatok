using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace anagram
{
    class Szó
    {
        public string Eredeti { get; set; }
        
        public Szó(string szó)
        {
            Eredeti = szó;
        }
        
        public string Abece()
        {
            List<char> karakterek = Eredeti.ToList<char>();
            karakterek.Sort();
            return String.Concat(karakterek);
        }

        public string Egyszeres()
        {
            string egyszeres = Abece().Substring(0,1);
            foreach (char ch in Abece())
            {
                if (ch != egyszeres.Last())
                {
                    egyszeres += ch;
                }
            }
            return egyszeres;
        }

        public string Rend()
        {
            return Eredeti.Length.ToString("D2") + Abece();
        }
    }


    class Program
    {
        static List<Szó> szavak = new List<Szó>();

        static void Main(string[] args)
        {
            CW(1);
            Console.Write("Adja meg a szöveget! ");
            Szó bekér = new Szó(Console.ReadLine());
            Console.WriteLine("{0}-féle  karakter: {1}", bekér.Egyszeres().Length, bekér.Egyszeres());

            CW(2);
            StreamReader sr = new StreamReader("szotar.txt");
            while (!sr.EndOfStream)
            {
                szavak.Add(new Szó(sr.ReadLine()));
            }
            sr.Close();
            Console.WriteLine("kész");

            CW(3);
            StreamWriter sw = new StreamWriter("abc.txt");
            foreach (Szó s in szavak)
            {
                sw.WriteLine(s.Abece());
            }
            sw.Close();
            Console.WriteLine("kész");

            CW(4);
            Console.Write("Adja meg az első szót: ");
            Szó egy = new Szó(Console.ReadLine());
            Console.Write("Adja meg a második szót: ");
            Szó ket = new Szó(Console.ReadLine());
            Console.WriteLine(egy.Abece()==ket.Abece()?"Anagramma":"Nem anagramma");

            CW(5);
            Console.Write("Adjon meg egy szót: ");
            Szó minta = new Szó(Console.ReadLine());
            string lista = "";
            foreach (Szó s in szavak)
            {
                if (s.Abece() == minta.Abece())
                {
                    lista = lista + s.Eredeti + "\n";
                }
            }
            Console.WriteLine(lista==""?"Nincs a szótárban anagramma":lista);

            CW(6);
            //szavak.Sort(delegate(Szó p1, Szó p2) { return p1.Rend().CompareTo(p2.Rend()); }); //így is lehet

            //Szó csere;                                                                        //és így is
            //for (int k = 0; k < szavak.Count-1; k++)
            //{
            //    for (int j = k+1; j < szavak.Count; j++)
            //    {
            //        if (szavak[k].Rend().CompareTo(szavak[j].Rend()) == 1)
            //        {
            //            csere = new Szó(szavak[k].Eredeti);
            //            szavak[k] = szavak[j];
            //            szavak[j] = csere;
            //        }
            //    }
            //}

            //List<Szó> Rendes = new List<Szó>(szavak);                                         //ez mindkettőhöz kell

            List<Szó> Rendes = new List<Szó>( szavak.OrderBy(x=>x.Rend()));
            
            int i = szavak.Count-1;
            do
            {
                Console.WriteLine(Rendes[i].Eredeti);
                i--;
            }
            //while (Rendes[szavak.Count - 1].Rend().Substring(0, 2) == Rendes[i].Rend().Substring(0, 2)); //ez is jó, csak bonyolultabb
            while (Rendes[szavak.Count - 1].Eredeti.Length == Rendes[i].Eredeti.Length);

            CW(7);
            sw = new StreamWriter("rendezve.txt");
            i = 0;
            do
            {
                sw.Write(Rendes[i].Eredeti);
                sw.Write((Rendes[i].Rend() != Rendes[i+1].Rend())?"\r\n":" "); //ha kell, soremelés
                sw.Write((Rendes[i].Eredeti.Length != Rendes[i+1].Eredeti.Length)?"\r\n":""); //ha kell, üres sor is.
                i++;
            } while (i<Rendes.Count - 1);
            sw.Write(Rendes[i].Eredeti);

            sw.Close();
            Console.WriteLine("kész");
            Console.ReadLine();
        }

        static void CW(int ssz)
        {
            Console.WriteLine("\n{0}. feladat",ssz);
        }
    }
}
