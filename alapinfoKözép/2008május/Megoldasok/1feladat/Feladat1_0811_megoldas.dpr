program Feladat1;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 Középszint
 1. feladat
}


uses
  SysUtils,Math;

const N=20;
      M=30;
var I,J,L:integer;
    A:Array[1..N] of Integer;
    B:Array[1..M] of Integer;
    C:Array[1..N] of Integer;

begin

Randomize;
WriteLn;
WriteLn('A sorozat: ');
For I:=1 to N Do
  Begin
  A[I]:=RandomRange(-20,30);
  Write(A[I],' ');
  End;
WriteLn;

WriteLn;
WriteLn('B sorozat: ');
For I:=1 to M Do
  Begin
  B[I]:=RandomRange(-10,40);
  Write(B[I],' ');
  End;
WriteLn;

L:=0;
For I:=1 to N Do
  Begin
    J:=1;
    While (J<=M) And (A[I]<>B[J]) Do
      Inc(J);
    If J<=M
      Then
        Begin
          L:=L+1;
          C[L]:=A[I];
        End;
  End;

WriteLn;
Writeln('A ket sorozat metszete:');
For I:=1 to L Do
  Write(C[I],'  ');
Writeln;

ReadLn;

end.
