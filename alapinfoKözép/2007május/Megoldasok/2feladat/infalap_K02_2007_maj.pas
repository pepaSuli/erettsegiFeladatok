{Informatikai Alapismeretek Erettsegi
 2007. majus
 Kozep szint
 2. feladat
}

program infalap_K02_2007_maj;
uses crt;

var o1,p1,mp1:byte; {Az egyik idopont, ora, perc, masodperc}
    o2,p2,mp2:byte; {A masik id”pont, ora, perc, masodperc}
    ip1mp,ip2mp:longint; {A ket idopont masodpercben}
    eltimp:longint; {Az eltelt ido masodpercben}
    eio,eip,eimp:byte; {Az eltelt ido ora, perc, masodperc}

begin
  clrscr;

  {Bemeno adatok beolvasasa}
  writeln('Adja meg az egyik idopontot!');
  write('Ora: ');
  readln(o1);
  write('Perc: ');
  readln(p1);
  write('Masodperc: ');
  readln(mp1);
  writeln();
  writeln('Adja meg a masik idopontot!');
  write('Ora: ');
  readln(o2);
  write('Perc: ');
  readln(p2);
  write('Masodperc: ');
  readln(mp2);
  writeln();


  {Az eredmeny meghatarozasa }
  ip1mp:=o1*3600+p1*60+mp1;
  ip2mp:=o2*3600+p2*60+mp2;
  eltimp:=abs(ip2mp-ip1mp);
  eio:=eltimp div 3600;
  eip:=(eltimp mod 3600) div 60;
  eimp:=eltimp mod 60;

  {A valasz kiiratasa}
  writeln('A megadott idopontok kozott ',eio,' ora ',eip,' perc ',eimp, ' masodperc telt el.');
end.
