program uzemanyag_fogyasztas;
uses crt;

const FOGY = 8;
      NSZ = 7;

var napi_fogy:array[1..NSZ] of real;
    i:integer;
    heti_fogy:real;
    megtett_km:real;

begin
  clrscr;
  writeln('Uzemanyag fogyasztasok es megtett ut...');
  writeln('---------------------------------------');

  for i := 1 to NSZ do
     begin
        write('Hany litert tankolt ', i , '. este? ');
        readln(napi_fogy[i]);
     end;

  heti_fogy := 0;
  for i := 1 to NSZ do
     heti_fogy := heti_fogy+napi_fogy[i];

  megtett_km := heti_fogy / 8 * 100;

  writeln('---------------------------------------');
  writeln('Az auto a heten ', heti_fogy:6:2 , ' liter uzemanyagot fogyasztott,');
  writeln('amivel ', megtett_km:6:2, ' kilometert tehetett meg.');
  writeln('---------------------------------------');
end.

