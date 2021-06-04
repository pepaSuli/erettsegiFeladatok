{
  INFORMATIKAI ALAPISMERETEK
  EMELT SZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat3;
uses crt;

const maxcegszam = 100; {FELTESSZUK, HOGY AZ INPUTFILE NEM TARTALMAZ
                         maxcegszam-nal TOBB SORT}

      napszam = 7; {FELTETELEZZUK, HOGY napszam>=2}

      inputfilenev = 'c:\segedanyag\ECegArf.txt'; {AZ INPUTFILE HELYE ES NEVE}


type cegadatok=record
                 cegnev:string;
                 zaroar:array[1..napszam] of integer;
               end;

var cegek:array [1..maxcegszam] of cegadatok;
    cegszam:integer;
    i,j:integer;
    inputfile:text;
    s:string;
    mindb:integer;
    minindexek:array[1..maxcegszam] of integer;
    minertek:integer;



{A STABILITASOSSZEGET KISZAMITO FUGGVENY}
function stabilitasosszeg(x:integer):integer;
var i:integer;
    s:integer;
begin
  s:=0;
  for i:=1 to napszam-1 do
      s:=s+abs(cegek[x].zaroar[i]-cegek[x].zaroar[i+1]);
  stabilitasosszeg:=s;
end;


begin

{ADATFELTOLTES INICIALIZALAS}
   clrscr;
   assign(inputfile,inputfilenev);
   reset(inputfile);

   {FELTETELEZZUK, HOGY A MEGNYITAS SIKERES VOLT ES
   A FILE FORMATUMA MEGFELELO VALAMINT, HOGY LEGALABB EGY
   CEG ADATAIT TARTALMAZZA}

   i:=0;
   while not(EOF(inputfile)) do begin
       i:=i+1;
       with cegek[i] do begin
           for j:=1 to napszam do
               read(inputfile, zaroar[j]);
           readln(inputfile, cegnev);
       end;
   end;
   close(inputfile);
   cegszam:=i;

{AZ ADATFELTOLTES SIKERESSEGET ELLENORZO KIIRATAS. A FELADATNAK NEM RESZE!!!}
   for i:=1 to cegszam do begin
       with cegek[i] do begin
           for j:=1 to napszam do
               write(zaroar[j]:6);
           writeln(cegnev:20,'   STAB:',stabilitasosszeg(i));
       end;
   end;
   writeln;

{A STABILITASOSSZEGEK MINIMUMAT MUTATO CEG(EK) MEGHATAROZASA}
    mindb:=1;
    minindexek[1]:=1;
    minertek:=stabilitasosszeg(1);
    for i:= 2 to cegszam do
        if stabilitasosszeg(i)<minertek
           then begin
                mindb:=1;
                minindexek[mindb]:=i;
                minertek:=stabilitasosszeg(i);
           end
           else if stabilitasosszeg(i)=minertek
                   then begin
                        mindb:=mindb+1;
                        minindexek[mindb]:=i;
                   end;

{A LEGSTABILABB CEGEK LISTAJA}
  writeln('A legstabilabb ceg(ek) listaja:');
  writeln;
  for i:=1 to mindb do
      writeln('NEV:',cegek[minindexek[i]].cegnev, '    STAB:',minertek);



end.


