#3. feladat
SELECT filmcim FROM film WHERE szarmazas LIKE '%francia%';

#4. feladat
SELECT mozi.*
	FROM mozi, film, hely
	WHERE film.fkod=hely.fkod AND
		mozi.moziazon=hely.moziazon AND
		filmcim='Lakótársat keresünk';
		
#5. feladat
SELECT DISTINCT mozinev
	FROM mozi, film, hely
	WHERE film.fkod=hely.fkod AND
			mozi.moziazon=hely.moziazon AND
			NOT szines;

#6. feladat
SELECT mozinev, telefon FROM mozi WHERE (moziazon NOT IN (SELECT moziazon FROM hely));

#7. feladat
SELECT filmcim
	FROM mozi, film, hely
	WHERE film.fkod=hely.fkod AND
			mozi.moziazon=hely.moziazon AND
			mufaj='vígjáték' AND
			szinkron='fel'
	GROUP BY filmcim
	HAVING COUNT(*)>2;

#8. feladat
SELECT filmcim, mozinev
	FROM mozi, film, hely
	WHERE film.fkod=hely.fkod AND
			mozi.moziazon=hely.moziazon
	ORDER BY hossz DESC
	LIMIT 1;

#9. feladat
SELECT filmcim, mozinev, irszam, cim
	FROM mozi, film, hely
	WHERE film.fkod=hely.fkod AND
			mozi.moziazon=hely.moziazon AND
			irszam BETWEEN 1130 AND 1139;

