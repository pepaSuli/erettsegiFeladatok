#include <iostream>
#include <fstream>
#include <math.h>
#include <string>

using namespace std;

struct tEgyJarmu
{
       long Sorszam;
       long Ido;
       long Sebesseg;
       string Honnan;
};
typedef tEgyJarmu tEgyJarmuTomb[2000];

void FKiir(int sorszam_);
void Beolvasas(int& JarmuSzam_, tEgyJarmuTomb& Jarmu_);
void Nedik(tEgyJarmuTomb Jarmu_);
void Felsobe(int JarmuSzam_, tEgyJarmuTomb Jarmu_);
void Statisztika(int JarmuSzam_, tEgyJarmuTomb Jarmu_);
void Leg10(int JarmuSzam_, tEgyJarmuTomb Jarmu_);
void Kilepes(int JarmuSzam_, tEgyJarmuTomb Jarmu_);

int main()
{
    int InduloSzint;
    int JarmuSzam;
    tEgyJarmuTomb Jarmu;
    int i;
    
    FKiir(1);
    Beolvasas(JarmuSzam, Jarmu);
    FKiir(2);
    Nedik(Jarmu);
    FKiir(3);
    Felsobe(JarmuSzam, Jarmu);
    FKiir(4);
    Statisztika(JarmuSzam, Jarmu);
    FKiir(5);
    Leg10(JarmuSzam, Jarmu);
    FKiir(6);
    Kilepes(JarmuSzam, Jarmu);

    system("PAUSE");
    return EXIT_SUCCESS;
}

void FKiir(int sorszam_)
{
     cout << sorszam_ << ". feladat" << endl;
}

void Beolvasas(int& JarmuSzam_, tEgyJarmuTomb& Jarmu_)
{
	
	int i;
	long ora, perc, masodperc;

	fstream be("forgalom.txt", ios::in);
    
    be >> JarmuSzam_;
	
	for (i=0; i<JarmuSzam_; i++)
	{
        be >> ora;
        be >> perc;
        be >> masodperc;
        be >> Jarmu_[i].Sebesseg;
        be >> Jarmu_[i].Honnan;
        Jarmu_[i].Ido=ora*3600+perc*60+masodperc;
        Jarmu_[i].Sorszam=i+1;
    }
	be.close();
}

void Nedik(tEgyJarmuTomb Jarmu_)
{
     int n;
     cout << "Adja meg a jármû sorszámát! ";
     cin >> n;
     cout << "A(z) " << n << ". jármû ";
     if ( Jarmu_[n-1].Honnan=="A") { cout << "a Felsõ"; }
     else { cout << "az Alsó"; }
     cout << " város felé haladt " << endl;
     
}

void Felsobe(int JarmuSzam_, tEgyJarmuTomb Jarmu_)
{
     int i=0, poz=JarmuSzam_-1;
     int fjarmu[2]={0};
     while (i<2 && poz>=0)
     {
           if ( Jarmu_[poz].Honnan=="A") { fjarmu[i]=poz; i++; }
           poz--;
     }
     if (i==2)
     {
              cout << "A Felsõ városba tartó utolsó két jármû "
                   << Jarmu_[fjarmu[0]].Ido-Jarmu_[fjarmu[1]].Ido
                   << " másodperc eltéréssel követte egymást." << endl;
     }
     else { cout << "Kevesebb, mint 2 jármû tartott a Felsõ városba. " << endl; }
}

void Statisztika(int JarmuSzam_, tEgyJarmuTomb Jarmu_)
{
     int i, ora;
     int stat[24][2]={0};
     for (i=0; i<JarmuSzam_; i++)
     {
         if ( Jarmu_[i].Honnan=="A" ) 
         { 
              stat[Jarmu_[i].Ido/3600][0]++;
         }
         else
         { 
              stat[Jarmu_[i].Ido/3600][1]++;
         }
     }
     for (ora=0; ora<24; ora++)
     {
         if (stat[ora][0]+stat[ora][1]>0) 
         { 
              cout << "Óra: " << ora
                   << " A: " << stat[ora][0] 
                   << " F: "<< stat[ora][1] << endl;
         }
     }
}

void Leg10(int JarmuSzam_, tEgyJarmuTomb Jarmu_)
{
     int i, j;
     string honnan;
     tEgyJarmu Csere;
     tEgyJarmuTomb Jarmu__;
     for (i=0; i<JarmuSzam_; i++)
     { Jarmu__[i]=Jarmu_[i]; }
     for (i=0; i<JarmuSzam_; i++)
     {
         for (j=0; j<(JarmuSzam_-i)-1; j++)
         {
             if(Jarmu__[j].Sebesseg>Jarmu__[j+1].Sebesseg)
             {
                 swap(Jarmu__[j], Jarmu__[j+1]);
             }
         }
     }
     for (i=0; i<10; i++)
     {
         if (Jarmu__[i].Honnan=="A") { honnan="Alsó"; } else { honnan="Felsõ"; }
         cout << (Jarmu__[i].Ido / 3600) << " "  
              << ((Jarmu__[i].Ido / 60) % 60)  << " " 
              << (Jarmu__[i].Ido % 60) << " " 
              << honnan << " " 
              << floor(10*1000.0/Jarmu__[i].Sebesseg)/10 << " m/s" << endl;
     }
}

void Kilepes(int JarmuSzam_, tEgyJarmuTomb Jarmu_)
{
     int i;
     string honnan;
     fstream ki;
     long ElozoIdo=0, SajatIdo;

     honnan="F";
     ki.open("also.txt", ios::out);
     
     for (i=0; i<JarmuSzam_; i++)
     {
         if (Jarmu_[i].Honnan==honnan)
         {
              SajatIdo=Jarmu_[i].Ido+Jarmu_[i].Sebesseg;
              SajatIdo=max(SajatIdo, ElozoIdo);
              ki << (SajatIdo / 3600) << " "  << ((SajatIdo / 60) % 60)  
                 << " " << (SajatIdo % 60) << endl;
              ElozoIdo=SajatIdo;
         }
     }

     ki.close();
}

