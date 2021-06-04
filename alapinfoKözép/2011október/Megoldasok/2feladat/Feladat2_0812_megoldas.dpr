program Feladat2;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 Középpszint
 2. feladat
}

uses
  SysUtils;
Var A,B:Longint;

Function Tulajdonsag(A,B:longint):Boolean;
// A függvény logikai igaz értéket ad vissza, ha az A önmagánál kisebb
// osztóinak az összege megegyezik B-vel!
Var I,S:Longint;
begin
  S:=0;
  For I:=1 to A div 2 do  // A önmagánál kisebb osztóinak az összegzése
    Begin
      If A mod I=0
        then S:=S+I;
    end;
  Tulajdonsag:=S=B; // Igazat ad vissza, ha ez az összeg megegyezik B-vel!
end;

begin
WriteLn;
Write('Adja meg az egyik szamot: '); Readln(A);
Write('Adja meg a másik szamot : '); Readln(B);
WriteLn;
Write('A megadott szamok ');
If tulajdonsag(A,B) and Tulajdonsag(B,A) // Ha a tulajdonság kölcsönösen teljesül,
   Then Writeln('baratsagos szamok!')          //akkor a számpár barátságos
   Else Writeln('nem baratsagos szamok!');     //különben nem!
Readln;
end.
