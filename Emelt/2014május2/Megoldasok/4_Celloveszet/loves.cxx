#include <iostream>
#include <fstream>
using namespace std;

struct Tversenyzo {
	string sorozat;
	int rajtszam;
};

void feladat(string f)
{
	cout << f << ". feladat: " << endl;
}
int loertek(string sor)
{
	int aktpont=20;
	int ertek=0;
	for(unsigned int i=0; i<sor.size(); i++)
	{
		if( (aktpont>0) and (sor[i]=='-') )
		{
			aktpont--;
		}
		if (sor[i]=='+')
		{
			ertek+=aktpont;
		}
	}
	return ertek;
}

int main(int argc, char **argv)
{
	Tversenyzo versenyzo[100];
	
	feladat("1");
	ifstream be;
	int db;
	be.open("verseny.txt");
	be >> db;
	for(int i=0; i<db; i++)
	{
		be >> versenyzo[i].sorozat;
		versenyzo[i].rajtszam=i+1;
	}
	be.close();
	
	feladat("2");
	cout << "Az egymast kovetoen tobbszor talalo versenyzok: ";
	for(int i=0; i<db; i++)
	{
		if(versenyzo[i].sorozat.find("++")!=string::npos)
		{
			cout << versenyzo[i].rajtszam << " ";
		}
	}
	cout << endl;
	
	feladat("3");
	int maxhely=0;
	for(int i=1; i<db; i++)
	{
		if(versenyzo[i].sorozat.size()>versenyzo[maxhely].sorozat.size())
		{
			maxhely=i;
		}
	}
	cout << "A legtobb lovest leado versenyzo rajtszama: " << versenyzo[maxhely].rajtszam << endl;
	
	feladat("5");
	int rajtszam, talalatszam=0, reszhossz=0, maxhossz=0;
	string sorozat;
	cout << "Adjon meg egy rajtszamot! ";
	cin >> rajtszam;
	feladat("5a");
	sorozat=versenyzo[rajtszam-1].sorozat;
	cout << "Celt ero lovesek: ";
	for(unsigned int i=0; i<sorozat.size(); i++)
	{
		if(sorozat[i]=='+')
		{
			cout << i+1 << " ";
			talalatszam++;
			reszhossz++;
			if(reszhossz>maxhossz)
			{
				maxhossz=reszhossz;
			}
		}
		else
		{
			reszhossz=0;
		}
	}
	cout << endl;
	feladat("5b");
	cout << "Az eltalalt korongok szama: " << talalatszam << endl;
	feladat("5c");
	cout << "A leghosszabb hibatlan sorozat hossza: " << maxhossz << endl;
	feladat("5d");
	cout << "A versenyzo pontszama: " << loertek(sorozat) << endl;
	
	feladat("6");
	ofstream ki;
	ki.open("sorrend.txt");
	for(int i=0; i<db-1; i++)
	{
		for(int j=0; j<db-i-1; j++)
		{
			if(loertek(versenyzo[j].sorozat)<loertek(versenyzo[j+1].sorozat))
			swap(versenyzo[j], versenyzo[j+1]);
		}
	}
	int helyezes=0;
	int korabbiertek=0;
	for(int i=0; i<db; i++)
	{
		if(loertek(versenyzo[i].sorozat)!=korabbiertek)
		{
			helyezes=i+1;
		}
		ki << helyezes << "\t" << versenyzo[i].rajtszam << "\t" 
				<< loertek(versenyzo[i].sorozat) << endl;
		korabbiertek=loertek(versenyzo[i].sorozat);
	}
	ki.close();
	
	return 0;
}

