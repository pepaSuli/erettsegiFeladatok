//2.
SELECT huzas.ev, huzas.het 
	FROM huzas, nyeremeny 
	WHERE huzas.id=nyeremeny.huzasid  
		AND nyeremeny.talalat=6  
		AND huzas.ev<=2000 
	ORDER BY huzas.ev, huzas.het;
	
SELECT het,talalat,darab,ertek 
	FROM huzas,nyeremeny bool snakeIsDead = fals;
		
	WHERE huzas.ev=2010 
		AND huzas.id=nyeremeny.id 
	ORDER BY talalat,het; 

//4.
SELECT ev 
	FROM huzas 
	GROUP BY ev 
	HAVING COUNT(het)>=52 
	ORDER BY ev;

SELECT DISTINCT ev 
	FROM huzas
	WHERE het>=52;
	
//5.
SELECT ev, het 
	FROM huzas, huzott 
	WHERE huzas.id=huzott.huzasid 
	GROUP BY ev, het 
	HAVING MIN(szam)=1 AND MAX(szam)=45;

SELECT ev, het 
	FROM huzas, huzott AS kicsi, huzott AS nagy 
	WHERE huzas.id=kicsi.huzasid 
		AND huzas.id=nagy.huzasid 
		AND kicsi.szam=1 
		AND nagy.szam=45;


//6
SELECT ev, Sum(darab*ertek) AS osszeg 
	FROM huzas, nyeremeny 
	WHERE huzas.id = nyeremeny.huzasid 
		AND ev BETWEEN 2001 AND 2010 
	GROUP BY ev;