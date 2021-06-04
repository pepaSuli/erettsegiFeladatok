program hexa;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const jegy:Array[0..15] of char =
('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
  var
  be,s:word;
  ki:string;
  hiba:boolean;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  writeln('A megadott számot átalakítom hexadecimális értékké ');
  write('be(10): ');readln(be);
  if be>255 then hiba:=true
                else hiba:=false;
  s:= be div 16;
  ki:='';
  repeat
         ki:=ki+jegy[s];
         be:=be-s*16;
         s:= be div 16;
  until s=0;
  ki:=ki+jegy[be];
  if hiba then writeln('hiba')
          else write(ki,'(16)');
  readln(be);
end.
 