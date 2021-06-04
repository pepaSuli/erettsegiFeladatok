{Informatikai Alapismeretek Erettsegi
 2007. majus
 Emelt szint
 2. feladat
}

program infalap_E02_2007_maj;
uses crt;

const n = 15; {A meressorozat elemszama}
var me:array[1..n] of integer; {A meresi sorozat elemei}
    i:integer; {Ciklusvaltozo az adatfeltolto es az ertekelo ciklushoz}
    db:integer; {A lokalis csucsok darabszama}

begin
  clrscr;

  {Bemeno adatok beolvasasa}
  for i:=1 to n do begin
     write('Adja meg a(z) ',i,'. meres eredmenyet:');
     readln(me[i]);
  end;
  writeln();

  {Az eredmeny meghatarozasa}
  db:=0;
  for i:=2 to n-1 do
     if (me[i]>me[i-1]) and (me[i]>me[i+1])
     then inc(db);

  {Az eredmeny kiiratasa}
  writeln ('A meressorozatban ',db,' darab lokalis csucs volt.');
end.
