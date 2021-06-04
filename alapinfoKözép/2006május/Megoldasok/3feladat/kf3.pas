{
  INFORMATIKAI ALAPISMERETEK
  KOZEP SZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat3;
uses crt;

const cegszam=4;   {FELTETELEZZUK, HOGY cegszam>=1}
      napszam=3;   {FELTETELEZZUK, HOGY napszam>=2}

type cegarfolyam = record
                      cegnev:string;
                      arfolyam:array[1..napszam] of integer;
                   end;

var     cegek:array[1..cegszam] of cegarfolyam;
          i,j:integer;
        maxdb:integer;
   maxindexek:array[1..cegszam] of integer;
     maxertek:integer;



{EGY CEG EREDMENYE AZ UTOLSO ES ELSO NAPI ZAROAR KULONBSEGE.}
function eredmeny(x:integer):integer;
  begin
     eredmeny:=cegek[x].arfolyam[napszam]-cegek[x].arfolyam[1];
  end;

begin

   {ADATOK FELTOLTESE}
   clrscr;
   for i:= 1 to cegszam do begin
       write('Az ',i:3,'. ceg neve:');
       readln(cegek[i].cegnev);
       for j:= 1 to napszam do begin
           write('A(z) ',cegek[i].cegnev,' ',j:3,'. napi arfolyama:');
           readln(cegek[i].arfolyam[j]);
       end;
       writeln;
   end;

   {MAXIMUM HELY(EK) MEGHATAROZASA}
   maxdb:=1;
   maxindexek[1]:=1;
   maxertek:=eredmeny(1);
   for i:= 2 to cegszam do
       if eredmeny(i)>maxertek
          then begin
               maxdb:=1;
               maxindexek[maxdb]:=i;
               maxertek:=eredmeny(i);
          end
          else if eredmeny(i)=maxertek
                  then begin
                       maxdb:=maxdb+1;
                       maxindexek[maxdb]:=i;
                  end;

   {AZ EREDMENY KIIRATASA. ELOFORDULHAT, HOGY NEM VOLT NYERESEGES CEG}
   if maxertek<=0
      then writeln ('A cegek kozul egyik sem volt nyereseges.')
      else begin
           writeln('A legnagyobb nyereseget elert ceg(ek):');
           for i:= 1 to maxdb do
               writeln (cegek[maxindexek[i]].cegnev);
      end;
end.





