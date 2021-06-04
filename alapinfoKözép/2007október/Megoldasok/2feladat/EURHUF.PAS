program euro_forint_valtas;
uses crt;

var arfolyam, euro, forint:real;
begin
  clrscr;
  writeln('Euro - Forint atvaltas');
  writeln('----------------------');

  write('Hany forint egy euro? ');
  readln(arfolyam);
  write('Hany eurot szeretne forintra valtani? ');
  readln(euro);

  forint:=euro*arfolyam;

  writeln(euro:6:2, ' EUR = ', forint:6:2, ' HUF');
  writeln('----------------------');
end.
