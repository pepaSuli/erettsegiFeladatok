program Feladat2;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 K�z�ppszint
 2. feladat
}

uses
  SysUtils;
Var A,B:Longint;

Function Tulajdonsag(A,B:longint):Boolean;
// A f�ggv�ny logikai igaz �rt�ket ad vissza, ha az A �nmag�n�l kisebb
// oszt�inak az �sszege megegyezik B-vel!
Var I,S:Longint;
begin
  S:=0;
  For I:=1 to A div 2 do  // A �nmag�n�l kisebb oszt�inak az �sszegz�se
    Begin
      If A mod I=0
        then S:=S+I;
    end;
  Tulajdonsag:=S=B; // Igazat ad vissza, ha ez az �sszeg megegyezik B-vel!
end;

begin
WriteLn;
Write('Adja meg az egyik szamot: '); Readln(A);
Write('Adja meg a m�sik szamot : '); Readln(B);
WriteLn;
Write('A megadott szamok ');
If tulajdonsag(A,B) and Tulajdonsag(B,A) // Ha a tulajdons�g k�lcs�n�sen teljes�l,
   Then Writeln('baratsagos szamok!')          //akkor a sz�mp�r bar�ts�gos
   Else Writeln('nem baratsagos szamok!');     //k�l�nben nem!
Readln;
end.
