{
3. feladat: (15 pont)
Adott egy maximum 100 karaktert tartalmaz¢ sz”veg.
µllap¡tsa meg, h ny sz¢t tartalmaz, ha felt‚telezzk, hogy a sz”veg elej‚n
ill v‚g‚n tal lhat¢ betûsorokat lesz m¡tva minden sz¢k”zzel hat rolt
karaktersorozat egy-egy sz¢! A kezdõ sz¢ el”tt ‚s a befejez‹ sz¢ m”g”tt
‚rtelemszerûen nem felt‚tlenl van sz¢k”z.
}
Program szokoz;
uses crt;
Const hossz=100;
Var  s:string[hossz];
     i,j,db:byte;
Begin
     repeat
        Writeln('Adjon meg egy max ',hossz,') betûs sz”veget, megadom h ny sz¢bol  ll.');
        Readln(s);
        If length(s)>hossz then writeln('T£l hossz£');
     until length(s)<hossz+1;
     db:=0;
     for i:= 1 to length(s)-1 do
         begin
              if (s[i]<>' ') and (s[i+1]=' ')
                 OR
                   ((s[i]<>' ') and (s[i+1]<>' ') and (i=length(s)-1))
                 then db:=db+1;
         end;
     writeln('A sz”vegben ',db,' sz¢ tal lhat¢ ');
     readkey;
End.