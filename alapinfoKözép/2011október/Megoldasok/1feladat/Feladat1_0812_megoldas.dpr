program Feladat1;

{$APPTYPE CONSOLE}
{
 Informatikai Alapismeretek
 Középpszint
 1. feladat
}

uses
  SysUtils,Math;

const N=20;
      M=30;
var I,J,L:integer;
    A:Array[1..N] of integer;
    B:Array[1..M] of integer;
    C:Array[1..N] of integer;

begin
Randomize;

WriteLn;
WriteLn('A sorozat: ');
A[1]:=-50; Write(A[1],' ');
For I:=2 to N Do
  Begin
  A[I]:=A[I-1]+RandomRange(1,3);
  Write(A[I],' ');
  End;
WriteLn;

WriteLn;
WriteLn('B sorozat: ');
B[1]:=-40; Write(B[1],' ');
For I:=2 to M Do
  Begin
  B[I]:=B[I-1]+RandomRange(1,3);
  Write(B[I],' ');
  End;
WriteLn;

I:=1; J:=1; L:=0;
While (I<=N) and (J<=M) do
  begin
    If A[I]<B[J]
      then
        I:=I+1
      else
        If A[I]>B[J]
         then J:=J+1
         else
           begin
		         L:=L+1;
	           C[L]:=A[I];
		         I:=I+1;
             J:=J+1;
           end;
  end;

WriteLn;
Writeln('A két sorozat metszete:');
For I:=1 to L Do
  Write(C[I],'  ');
writeln;

ReadLn;

end.
