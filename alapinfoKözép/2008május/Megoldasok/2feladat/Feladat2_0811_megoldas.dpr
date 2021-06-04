program Feladat2;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 Középszint
 2. feladat
}

uses
  SysUtils;

Var I:Longint;

Function Tokeletes(N:longint):Boolean;
Var I,S:longint;
begin
  S:=0;
  For I:=1 to N div 2 do // Az N önmagánál kisebb osztóinak az összegzése S-ben
    Begin
      If N mod I=0
        Then S:=S+I;
    end;
  Tokeletes:=S=N; // A függvény igazat ad vissza, ha az osztók összege megegyezik N-nel
end;

begin

Writeln;
Writeln('A tokeletes szamok 10000-ig:');
Writeln;
For I:=1 To 10000 Do   // Végigvizsgáljuk a számokat 1 és 10000 között
  If Tokeletes(I)
    Then
      Writeln(I);
Readln;

end.

  
