program Feladat2;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 K�z�pszint
 2. feladat
}

uses
  SysUtils;

Var I:Longint;

Function Tokeletes(N:longint):Boolean;
Var I,S:longint;
begin
  S:=0;
  For I:=1 to N div 2 do // Az N �nmag�n�l kisebb oszt�inak az �sszegz�se S-ben
    Begin
      If N mod I=0
        Then S:=S+I;
    end;
  Tokeletes:=S=N; // A f�ggv�ny igazat ad vissza, ha az oszt�k �sszege megegyezik N-nel
end;

begin

Writeln;
Writeln('A tokeletes szamok 10000-ig:');
Writeln;
For I:=1 To 10000 Do   // V�gigvizsg�ljuk a sz�mokat 1 �s 10000 k�z�tt
  If Tokeletes(I)
    Then
      Writeln(I);
Readln;

end.

  
