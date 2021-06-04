--Feladat 2:
SELECT nev FROM diak WHERE fiu=-1 AND osztaly LIKE "9%";

--Feladat 3:
SELECT jegy.datum, targy.nev, jegy.ertek FROM diak,jegy,targy WHERE diak.id=jegy.diakid AND jegy.targyid=targy.id AND diak.nev="Balogh Lili";

--Feladat 4:
SELECT targy.nev, jegy.datum, jegy.ertek FROM diak,jegy,targy WHERE diak.id=jegy.diakid AND jegy.targyid=targy.id AND diak.nev="Balogh Lili" ORDER BY targy.nev, jegy.datum;

--Feladat 5:
SELECT diak.nev, jegy.datum, targy.nev FROM diak,jegy,targy WHERE diak.id=jegy.diakid AND jegy.targyid=targy.id AND diak.osztaly="9/A" AND jegy.ertek=1 AND jegy.datum LIKE "%-09-%";

--Feladat 6:
SELECT targy.nev,COUNT(jegy.id) FROM targy,jegy WHERE jegy.targyid=targy.id AND targy.kategoria="reál\r" GROUP BY targy.nev;
	
--Feladat 7:
SELECT AVG(jegy.ertek), fiu FROM diak,jegy,targy WHERE diak.id=jegy.diakid AND jegy.targyid=targy.id GROUP BY diak.fiu;

--Feladat 8:
SELECT diak.nev FROM diak,jegy,targy WHERE diak.id=jegy.diakid AND jegy.targyid=targy.id GROUP BY diak.id HAVING MIN(jegy.ertek)=5;

