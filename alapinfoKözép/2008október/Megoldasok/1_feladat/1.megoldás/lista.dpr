program lista;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type filetip=Text;

Var T:filetip;
    sor:string;
    Tnev:string;
    i:longint;
    Sikerult:boolean;
    procedure beolv (VAR T: filetip; VAR S: string; VAR Sikerult:Boolean);
        begin
        	Sikerult:=not eof(T);
        	If Sikerult Then Readln(T,S);
        end;
begin
  { TODO -oUser -cConsole Main : Insert code here }
   	i:=0;
	write('A fálj neve: ');readln( tnev );
        Assign(t,tnev);Reset(t);
        beolv(t, sor, sikerult);
	while sikerult  do
        begin
		i:=i+1;
                if (i mod 20)=0 then
                    begin write('..........');readln;
                    end;
		writeln( sor );
		beolv (t, sor, sikerult);
	end;
    write('..........A lista vége..........');readln;
end.
 