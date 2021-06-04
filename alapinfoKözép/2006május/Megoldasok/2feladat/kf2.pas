{
  INFORMATIKAI ALAPISMERETEK
  KOZEP SZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat2;
uses crt;

const n=14;

var nevek:array[1..n] of string;
        i,j:integer;
        cs:string;
        c:char;
begin
   {A TOMB FELTOLTESE A NEVEKKEL}
   for i:=1 to n do begin
       write('Adja meg az ',i:3,'. nevet:');
       readln(nevek[i]);
   end;

   {A FELTOLTOTT TOMB NOVEKVO SORRENDBE RENDEZESE}
   for i:=1 to n-1 do
       for j:= i+1 to n do
           if nevek[i]>nevek[j]
              then begin
                  cs:=nevek[i];
                  nevek[i]:=nevek[j];
                  nevek[j]:=cs;
              end;


   {A NEVSOR KEPERNYORE IRATASA TAGOLASSAL}
   clrscr;
   for i:=1 to n do begin
       writeln(i:3,'. ',nevek[i]);
       if i mod 5 = 0
          then begin
               repeat until keypressed;
               c:=readkey;
               if ord(c)=0 then c:=readkey;
               clrscr;
          end;
   end;
end.