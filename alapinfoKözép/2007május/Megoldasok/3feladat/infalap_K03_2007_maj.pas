{Informatikai Alapismeretek Erettsegi
 2007. majus
 Koz‚e szint
 3. feladat
}

program infalap_K03_2007_maj;
uses crt;

const n=32; {Osztalyletszam}
var matns:array[1..n] of string; {Matek szakkor nevsora}
    nmat:integer; {Matek szakkor tagjainak szama}
    magyns:array[1..n] of string; {Magyar szakkor nevsora}
    nmagy:integer; {Magyar szakkor tagjainak szama}
    matmagyns:array[1..n] of string; {Mindket szakkorre jarok nevsora}
    nmatmagy:integer; {Mindk‚t szakkorre jarok szama}
    i,j:integer; {Ciklusvaltozok beolvasashoz, es feldolgozashoz}

begin
  clrscr;

  {Bemeno adatok beolvasasa}
  write('Adja meg a matematika szakkorosok szamat: ');
  readln(nmat);
  writeln('Adja meg a matematika szakkorosok neveit: ');
  for i:= 1 to nmat do begin
     write('A(z) ',i,'. nev:');
     readln(matns[i]);
  end;
  writeln();
  write('Adja meg a magyar szakkorosok szamat: ');
  readln(nmagy);
  writeln('Adja meg a magyar szakkorosok neveit: ');
  for i:= 1 to nmagy do begin
     write('A(z) ',i,'. nev:');
     readln(magyns[i]);
  end;
  writeln();

  {Az eredmeny meghatarozasa}
  nmatmagy:=0;
  for i:= 1 to nmat do begin
     j:=1;
     while (j<=nmagy) and (matns[i]<>magyns[j]) do
        inc(j);
     if j<=nmagy
     then begin
        inc(nmatmagy);
        matmagyns[nmatmagy]:=matns[i];
     end;
  end;

  {A valasz kiirasa}
  if nmatmagy>0
  then begin
     writeln('Mindket szakkorre jar(nak):');
     for i:=1 to nmatmagy do
        writeln(matmagyns[i]);
  end
  else
     writeln('Nincs olyan diak aki mindket szakkorre jar.');
end.
