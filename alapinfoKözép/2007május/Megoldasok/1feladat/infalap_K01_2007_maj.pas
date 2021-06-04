{Informatikai Alapismeretek Erettsegi
 2007. majus
 Kozep szint
 1. feladat
}

program infalap_K01_2007_maj;

  const
     N=50;
     M=50;

  var
    I,J:integer;
    A:array[0..N,0..M] of integer;

  begin
    for I:= 1 to N do
       for J:= 1 to M do
          A[I,J] := 2-random(5);
    I:=0;
    J:=0;
    while ((J<=0) and (J<=N) and (I<=0) and (I<=N) and (A[I,J]<>0)) do begin
        I:=I+A[I,J];
        J:=J+A[I,J];
    end;
    if A[I,J]=0
    then writeln('Vegallomas')
    else writeln('Indexhatar atlepes');
  end.
