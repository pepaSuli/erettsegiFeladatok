#include <iostream>
#include <fstream>

using namespace std;

struct tEgyIgeny
{
       long Ido;
       int Csapat;
       int Indulo, Cel;
};
typedef tEgyIgeny tEgyIgenyTomb[100];

void FKiir(int sorszam_);
void Beolvasas(int& SzintSzam_, int& CsapatSzam_, int& IgenySzam_, tEgyIgenyTomb& Igeny_);
void InduloSzintBe(int& Szint);
void VegzoSzint(int IgenySzam_, tEgyIgenyTomb Igeny_);
void SzelsoSzintek(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_);
void Felfele(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_);
void LiftNelkul(int CsapatSzam_, int IgenySzam_, tEgyIgenyTomb Igeny_);
void SzabalytalanCsapat(int CsapatSzam_, int IgenySzam_, tEgyIgenyTomb Igeny_, int VizsgaltCsapat_);
void Blokk(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_, int VizsgaltCsapat_);

int main()
{
    int InduloSzint;
    int SzintSzam, CsapatSzam, IgenySzam;
    int VizsgaltCsapat;
    tEgyIgenyTomb Igeny;
    int i;
    
    FKiir(1);
    Beolvasas(SzintSzam, CsapatSzam, IgenySzam, Igeny);
    FKiir(2);
    InduloSzintBe(InduloSzint);
    FKiir(3);
    VegzoSzint(IgenySzam, Igeny);
    FKiir(4);
    SzelsoSzintek(InduloSzint, IgenySzam, Igeny);
    FKiir(5);
    Felfele(InduloSzint, IgenySzam, Igeny);
    FKiir(6);
    LiftNelkul(CsapatSzam, IgenySzam, Igeny);
    FKiir(7);
    SzabalytalanCsapat(CsapatSzam, IgenySzam, Igeny, VizsgaltCsapat);
    FKiir(8);
    Blokk(InduloSzint, IgenySzam, Igeny, VizsgaltCsapat);

    system("PAUSE");
    return EXIT_SUCCESS;
}

void FKiir(int sorszam_)
{
     cout << sorszam_ << ". feladat" << endl;
}

void Beolvasas(int& SzintSzam_, int& CsapatSzam_, int& IgenySzam_, tEgyIgenyTomb& Igeny_)
{
	
	int i;
	long ora, perc, masodperc;
	int tmp;	

	fstream be("igeny.txt", ios::in);
    
    be >> SzintSzam_;
    be >> CsapatSzam_;
    be >> IgenySzam_;
	
	for (i=0; i<IgenySzam_; i++)
	{
        be >> ora;
        be >> perc;
        be >> masodperc;
        be >> Igeny_[i].Csapat;
        be >> Igeny_[i].Indulo;
        be >> Igeny_[i].Cel;
        Igeny_[i].Ido=ora*3600+perc*60+masodperc;
    }
	be.close();
}

void InduloSzintBe(int& Szint_)
{
     cout << "Adja meg, hogy kezdetben melyik szinten van a lift! ";
     cin >> Szint_;
}

void VegzoSzint(int IgenySzam_, tEgyIgenyTomb Igeny_)
{
     cout << "A lift a(z) " << Igeny_[IgenySzam_-1].Cel 
          << ". szinten all az utolso igeny teljesitese utan." << endl;
}

void SzelsoSzintek(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_)
{
     int Also=InduloSzint_, Felso=InduloSzint_;
     int i;

     for (i=0; i<IgenySzam_; i++)
     {
         Also=min(Also, min(Igeny_[i].Indulo, Igeny_[i].Cel));
         Felso=max(Felso, max(Igeny_[i].Indulo, Igeny_[i].Cel));
     }
     cout << "A legalacsonyabb sorszamu szint: " << Also << endl;
     cout << "A legmagasabb sorszamu szint: " << Felso << endl;
}

void Felfele(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_)
{
     int Utassal=0, Uresen=0;
     int i;
     // utassal
     for (i=0; i<IgenySzam_; i++)
     {
         if (Igeny_[i].Indulo<Igeny_[i].Cel) {Utassal++;}
     }
     // uresen
     for (i=0; i<IgenySzam_-1; i++)
     {
         if (Igeny_[i].Cel<Igeny_[i+1].Indulo) {Uresen++;}
     }
     if (InduloSzint_ < Igeny_[1].Indulo) {Uresen++;}
     cout << "Utassal " << Utassal << " izben indult felfele." << endl;
     cout << "Uresen " << Uresen << " izben indult felfele." << endl;
}

void LiftNelkul(int CsapatSzam_, int IgenySzam_, tEgyIgenyTomb Igeny_)
{
     int i;
     bool Utazott[50]={false};

     for (i=0; i<IgenySzam_; i++) { Utazott[Igeny_[i].Csapat]=true; }
     cout << "A liftet nem hasznalo csapatok: ";
     for (i=1; i<=CsapatSzam_; i++) 
     {
         if (!Utazott[i]) { cout << i << " "; }
     }
     cout << endl;
}

void SzabalytalanCsapat(int CsapatSzam_, int IgenySzam_, tEgyIgenyTomb Igeny_, int VizsgaltCsapat_)
{
     int i;
     bool ElsoUt=true, Szabalytalan=false;
     int aktSzint;
     string tmp;
     
     srand(time(0));
     VizsgaltCsapat_=(rand() % CsapatSzam_)+1;
//     VizsgaltCsapat_=3;
     cout << "A vizsgalt csapat: " << VizsgaltCsapat_ << endl;
     for (i=0; i<IgenySzam_; i++)
     {
         if (Igeny_[i].Csapat == VizsgaltCsapat_)
         {
              if (!ElsoUt)
              {
                  if (aktSzint!=Igeny_[i].Indulo)
                  {
                      cout << "Gyalog haladtak a(z) " << aktSzint 
                           << ". es a(z) " << Igeny_[i].Indulo 
                           << ". szintek kozott." << endl;
                      Szabalytalan=true;
                  }
              }
              else ElsoUt=false;
              aktSzint=Igeny_[i].Cel;
         }
     }
     if (!Szabalytalan) cout << "Nem bizonyithato szabalytalansag." << endl;
}

void Blokk(int InduloSzint_, int IgenySzam_, tEgyIgenyTomb Igeny_, int VizsgaltCsapat_)
{
     int i;
     string Sikerszoveg, Feladatkod;
     
   	 fstream ki("blokkol.txt", ios::out);
   	 for (i=0; i<IgenySzam_; i++)
   	 {
         if (Igeny_[i].Csapat==VizsgaltCsapat_)
         {
             ki << "Befejezes ideje: " <<  (Igeny_[i].Ido / 3600)  << ":" 
                << ((Igeny_[i].Ido / 60) % 60)<< ":"  <<  (Igeny_[i].Ido % 60) << endl;
             cout << "Az elõzõ munka eredménye? ";
             cin >> Sikerszoveg;
             ki << "Sikeresség: " << Sikerszoveg << endl;
             ki << "-----" << endl;
             ki << "Indulási emelet: " << Igeny_[i].Indulo << endl;
             ki << "Célemelet: " << Igeny_[i].Cel << endl;
             cout << "A következõ feladat kódja: ";
             cin >> Feladatkod;
             ki << "Feladatkód: " << Feladatkod << endl;
         }
     }
     ki.close();
}
