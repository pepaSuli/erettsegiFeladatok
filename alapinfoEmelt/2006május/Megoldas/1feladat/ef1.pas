{
  INFORMATIKAI ALAPISMERETEK
  EMELT SZINTU IRASBELI ERETTSEGI VIZSGA
  2006. majus 18.
}

program Feladat1;

const cellak_szama=400;

var   cella_ajto_nyitva:array[1..cellak_szama] of Boolean;
                    i,j:integer;

begin
  {INICIALIZALAS, AZ AJTOK ZARASA} 
  for i:=1 to cellak_szama do
      cella_ajto_nyitva[i]:=false;

  {A SZULTAN PARANCSAINAK VEGREHAJTASA}
  for i:=1 to cellak_szama do begin
      j:=0;
      while j+i<=cellak_szama do begin
          j:=j+i;
          cella_ajto_nyitva[j]:=not(cella_ajto_nyitva[j]);
      end;
  end;

  {AZ EREDMENY MEGJELENITESE}
  for i:=1 to cellak_szama do
      if cella_ajto_nyitva[i] then writeln(i:4);
end.
