{
  INFORMATIKAI ALAPISMERETEK
  EMELT SZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat2;
uses crt;

var kif:string;
      i:integer;
      s:integer;
      rossz_sorrend:boolean;

begin

{ADATFELTOLTES}
  clrscr;
  write('Adja meg a kifejezest:');
  readln(kif);

{KIERTEKELES}
  s:=0;
  rossz_sorrend:=false;
  for i:= 1 to length(kif) do begin
      case kif[i] of
           '(' : s:=s+1;
           ')' : s:=s-1;
      end;
      if s<0 then rossz_sorrend:=true;
  end;

{EREDMENY KIIRATASA}
  if s<>0
     then writeln('HIBA: Eltero szamu nyito es zarojelek.')
     else writeln('Egyezo szamu nyito es zarojelek');
  if rossz_sorrend
     then writeln('HIBA: Zarojelek rossz sorrendben.')
     else writeln('Megfelelo zarojel sorrend.');

end.


