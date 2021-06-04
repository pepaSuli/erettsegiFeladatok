program feher;
uses crt;
type aminosav = record
					nev: string;
					jel: char;
					c, h, o, n, s, at: integer;
					end;
var i, j, n, m, kezd, veg, z, x: integer;
	as : array [1..20] of aminosav;
	e, f: text;
	lanc: array[1..1000] of char;

procedure F01;
begin
assign(f,'aminosav.txt');
reset(f);
for i:=1 to 20 do
begin
	readln(f,as[i].nev);
	readln(f,as[i].jel);
	readln(f,as[i].c);
	readln(f,as[i].h);
	readln(f,as[i].o);
	readln(f,as[i].n);
	readln(f,as[i].s);
end;
close(f);
end;


procedure F02;
begin
for i:=1 to 20 do
	as[i].at:=as[i].c*12++as[i].h+as[i].o*16+as[i].n*14+as[i].s*32;
end;


procedure F03;
var hely: aminosav;
	min: integer;
begin
writeln('3. feladat');
writeln(e, '3. feladat');
for i:=1 to 19 do
begin
	min:=i;
	for j:= i+1 to 20 do
		if as[j].at<as[min].at then min:=j;
	hely:=as[min];
	as[min]:=as[i];
	as[i]:=hely;
	writeln(as[i].nev,' ',as[i].at,' ');
	writeln(e,as[i].nev,' ',as[i].at);
end;
writeln(as[20].nev,' ',as[20].at);
writeln(e, as[20].nev,' ',as[20].at);
writeln;
writeln(e);
end;


procedure F04;
var dbc, dbn, dbo, dbh, dbs:longint;
begin
writeln('4. feladat');
writeln(e, '4. feladat');
assign(f,'bsa.txt');
reset(f);
dbc:=0; dbh:=0; dbn:=0; dbo:=0; dbs:=0;
n:=0;
while not eof(f) do
begin
	n:=n+1;
	readln(f,lanc[n]);
	i:=0;
	repeat i:=i+1 until lanc[n]=as[i].jel;
	dbc:=dbc+as[i].c;
	dbh:=dbh+as[i].h;
	dbo:=dbo+as[i].o;
	dbn:=dbn+as[i].n;
	dbs:=dbs+as[i].s;
end;
dbo:=dbo-(n-1);
dbh:=dbh-2*(n-1);
writeln('C ',dbc,' H ',dbh,' O ',dbo,' N ',dbn,' S ',dbs);
writeln(e,'C ',dbc,' H ',dbh,' O ',dbo,' N ',dbn,' S',dbs);
writeln;
end;


procedure F05;
var	h: integer;
begin
writeln('5. feladat');
j:=0;
h:=0;
for i:=1 to n do
begin
	j:=j+1;
	if lanc[i] in ['Y','F','W']
	then begin
		if h<j then begin h:=j; veg:=i; end;
		j:=0;
	end;
end;
kezd:=veg-h+1;
writeln('hossza: ',h,'; kezdet helye: ',kezd,'; v‚g helye: ',veg);
writeln;
end;


procedure F06;
begin
writeln('6. feladat');
x:=0; i:=0;
repeat
	i:=i+1;
	if lanc[i]='C' then x:=x+1;
until (lanc[i]='R') and ((lanc[i+1]='A') or (lanc[i+1]='V'));
writeln('Az elso has¡t sig ', x,' darab Cisztein van.');
end;


Begin
clrscr;
assign(e, 'eredmeny.txt');
rewrite(e);
F01;
F02;
F03;
F04;
F05;
F06;
close(e);
readln;
end.