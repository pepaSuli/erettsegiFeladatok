{Informatikai Alapismeretek Erettsegi
 2007. majus
 Emelt szint
 1. feladat
}

program infalap_E01_2007_maj;
uses crt;

var e:integer; {A kocka elhossza mm-ben}
    a,b:integer; {A papir oldalhosszai mm-ben}

begin
  clrscr;

  {Bemeno adatok beolvasasa}
  write('Adja meg a kocka elhosszat mm-ben: ');
  readln(e);
  write('Adja meg a lap egyik oldalanak hosszat mm-ben: ');
  readln(a);
  write('Adja meg a lap masik oldalanak hosszat mm-ben: ');
  readln(b);
  writeln();

  {Az eredmeny meghatarozasa, valasz kiiratasa}
  if ((a >= 3*e) and (b >= 4*e)) or
     ((a >= 4*e) and (b >= 3*e))
  then writeln ('ELKESZTITHETO')
  else writeln ('NEM KESZITHETO EL');
end.
