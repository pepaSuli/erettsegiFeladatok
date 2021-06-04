{Informatikai Alapismeretek Erettsegi
 2007. majus
 Emelt szint
 3. feladat
}

program infalap_E03_2007_maj;
uses crt;

const n = 10; {A kockadobasok szama}
var kd:array[1..n] of byte; {A dobas sorozat elemei}
    i:integer; {Ciklusvaltozo az adatfeltolto es az ertekelo ciklushoz}
    hossz:integer; {Az aktualis szigoruan monoton csokkeno reszsorozat elemszama}
    maxhossz:integer;  {A leghosszabb szigoruan monoton csokkeno reszsorozat elemszama}

begin
  clrscr;

  {Bemeno adatok beolvasasa}
  for i:=1 to n do begin
     write('Adja meg a(z) ',i,'. dobas eredmenyet:');
     readln(kd[i]);
  end;
  writeln();

  {Az eredmeny meghatarozasa}
  maxhossz:=1; {A monoton csokkeneshez szukseges legalabb ket elemu reszsorozat}
  hossz:=1;
  i:=1;

  while i<=n-1 do begin

    if (kd[i]>kd[i+1])
    then inc(hossz)
    else hossz:=1;

    if hossz>maxhossz
    then maxhossz:=hossz;

    inc(i);
  end;

  {Az eredmeny kiiratasa}
  if maxhossz > 1
  then writeln ('A dobas sorozatban elofordulo leghosszabb szigoruan monoton csokkeno reszsorozat hossza: ',maxhossz)
  else writeln ('A dobas sorozatnak nem volt legalabb ket elemu szigoruan monoton reszsorozata!');

end.
