program palindrom;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var s1,s2:string;
      i:byte;
      pali:boolean;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  writeln('Palindrom vizsgáló program');
  write('Adja meg a vizsgált szöveget: ');
  readln(s1);
  s2:='';
  for i:=1 to length(s1) do
         If s1[i]<>' ' Then s2:=s2+upcase(s1[i]);
  i:=1;
  while  (i< length(s1) div 2) and  (s2[i]=s2[length(s2)-i+1]) do
       i:=i+1;
  pali:= (i>= length(s1) div 2);
  If pali then writeln('Palindrom')
          else writeln('NEM Palindrom');
  readln;
end.
 