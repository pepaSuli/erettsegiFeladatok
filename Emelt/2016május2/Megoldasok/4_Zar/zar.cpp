#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <time.h>
using namespace std;
bool nyit(string jo, string proba)
{
    bool egyezik=(jo.size()==proba.size());
    if(egyezik)
	{
		int elteres=int(jo[0])-int(proba[0]);
		for(unsigned int i=1; i<jo.size(); i++)
		{
			if( (elteres-(int(jo[i])-int(proba[i]))) % 10 !=0 )
			{
				egyezik=false;
			}
		}
	}
	return egyezik;
}
int main()
{
	cout << "1. feladat" << endl;
	string kod[500];
	ifstream be("ajto.txt");
	int db=0;
	while(be >> kod[db])
	{
		db++;
	}
	be.close();

	cout << "2. feladat" << endl;
	string nyitokod;
	cout << "Adja meg, mi nyitja a zarat! ";
	cin >> nyitokod;

	cout << "3. feladat" << endl;
	cout << "A nyito kodszamok sorai: ";
	for(int i=0; i<db; i++)
	{
		if(kod[i]==nyitokod)
		{
			cout << i+1 << " ";
		}
	}
	cout << endl;

	cout << "4. feladat" << endl;
	bool jo=true;
	int i=0;
	while(jo and i<db)
	{
		for(char jel='0'; jel<='9'; jel++)
		{
			int elofordulas=0;
			for(unsigned int b=0; b<kod[i].size(); b++)
			{
				if(kod[i][b]==jel) elofordulas++;
			}
			if(elofordulas>1) jo=false;
		}
		i++;
	}
	if(!jo)
	{
		cout << "Az elso ismetlodest tartalmazo probalkozas sorszama: " << i << endl;
	}
	else
	{
		cout << "Nem volt ismetlodo szamjegy." << endl;
	}


	cout << "5. feladat" << endl;
	srand(time(NULL));
	string veletlen="0123456789";
	for(int i=0; i<1000; i++)
	{
		swap(veletlen[rand()%10], veletlen[rand()%10]);
	}
	cout << "Egy " << nyitokod.size() << " hosszu kodszam: " << veletlen.substr(0, nyitokod.size()) << endl;

	cout << "6. feladat" << endl;

	cout << "7. feladat" << endl;
	ofstream ki("siker.txt");
	string ertekeles;
	for(int i=0; i<db; i++)
	{
		if(kod[i].size()!=nyitokod.size())
		{
			ertekeles="hibas hossz";
		}
		else
		if(!nyit(nyitokod, kod[i]))
		{
			ertekeles="hibas kodszam";
		}
		else
		{
			ertekeles="sikeres";
		}
		ki << kod[i] << " " << ertekeles << endl;
	}
	ki.close();

    return 0;
}
