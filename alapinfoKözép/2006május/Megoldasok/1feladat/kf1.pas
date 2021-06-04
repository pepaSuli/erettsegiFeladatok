{
  INFORMATIKAI ALAPISMERETEK
  KOZEPSZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat1;

const N=400;

var   b:array[1..N] of Boolean;
    i,j:integer;

begin
  for i:=1 to N do
      b[i]:=false;
  for i:=1 to N do begin
      j:=0;
      while j+i<=n do begin
          j:=j+i;
          b[j]:=not(b[j]);
      end;
  end;
  for i:=1 to N do
      if b[i] then writeln(i:4);
end.
