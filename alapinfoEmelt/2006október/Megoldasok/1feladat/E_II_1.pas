{Adott egy kiz r¢lag alapmûveleteket (+,-,*,/,=), sz mokat ‚s z r¢jeleket
tartalmaz¢ kifejez‚s.
Vezessnk be egy "s" sz mot, amely a z r¢elek  llapot t figyeli.
Kezd‹‚rt‚ke legyen nulla. Balr¢l jobbra haladva egyes‚vel megvizsg ljuk a
kifejez‚sben el‹fordul¢ jeleket. Amennyiben z r¢jelet tal lunk, akkor
nyit sn l n”veljk, z r sn l cs”kkentsk "s" ‚rt‚k‚t egyel.
K‚sz¡tsen programot, mely eld”nti, hogy helyesen z r¢jelezett-e a
megadott kifejez‚s!
Akkor helyesen z r¢jelezett, ha b rmely pillanatban igaz, hogy s>=0,
‚s a v‚g‚n s=0.
A kifejez‚sben el‹fordul¢ egyéb karaktereket nem kell ellen‹rizni.
}
Program kifejez;
Uses crt;
Var k: string;
    s,i:integer;
    helyes:Boolean;
Begin
    clrscr;
    writeln('Adjon meg egy kifejez‚st, megmondom, helyesen z r¢jelezett-e');
    readln(k);
    s:=0;
    i:=0;
    helyes :=True;
    while helyes and (length(k)>i)do
    begin
         i:=i+1;
         if k[i] ='(' then s:=s+1;
         if k[i] =')' then s:=s-1;
         helyes:=(s>=0);
    end;
    if s=0 then writeln('Helyesen z r¢jelezett kifejez‚s')
           else writeln('NEM helyesen z r¢jelezett kifejez‚s');
    readkey;
end.

