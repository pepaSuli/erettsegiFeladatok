program armstrong;

var i,j,k:integer;

begin
  writeln('A haromjegyu Armstrong-szamok a kovetkezok:');
  for i := 1 to 9 do
     for j := 0 to 9 do
        for k := 0 to 9 do
           if i*i*i + j*j*j + k*k*k = i*100 + j*10 + k
              then write(i*100 + j*10 + k,', ');
end.