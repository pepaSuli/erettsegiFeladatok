{NEM feladat, hogy a vizsg z¢ megfogalmazza az algoritmus  ltal
meg megoldott feladatot.
Az al bbi program gener l 10 sz mot 0..99 tartom nyban, majd egy
bek‚rt sz mhoz megadja a k‚t lekg”zelebbi gener lt ‚rt‚ket.
}
uses crt;
var
	A		:array [1..10] of longint;
	I,Min,Max,P	:longint;

Begin
	randomize;
        clrscr;
	For I := 1 to 10 do
		begin
			A[I] := random(100);
			write(A[I],' ');
		end;
	writeln;
	write('K‚rem a sz mot:');
	readln(P);
	Min := 100;
	Max := 0;
	for i:= 1 to 10 do
            If A[I] > P
               then
                   Begin if A[I] < Min
                            then Min := A[I]
                   End
               else
                   Begin If A[I] > Max
                      then Max := A[I]
                   End;
	writeln('P sz m: ', P);
        writeln('A legkisebb: ',Min);
        writeln('A legnagyobb: ',Max);
        readkey;
End.
