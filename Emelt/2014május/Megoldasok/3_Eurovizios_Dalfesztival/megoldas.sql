--2.
SELECT dal.ev, dal.orszag, eredeti
	FROM dal, verseny
	WHERE dal.orszag=verseny.orszag
	AND dal.ev=verseny.ev
	ORDER BY dal.ev;
	
-- 3.
SELECT sorrend
	FROM dal
	WHERE helyezes=1
	GROUP BY sorrend
	HAVING Count(id)>=5;

-- 4.
SELECT ev
	FROM dal
	WHERE (orszag="Belgium" OR orszag="Hollandia" OR orszag="Luxemburg")
	GROUP BY ev
	HAVING Count(id)=3;
SELECT dal1.ev
	FROM dal AS dal1, dal AS dal2, dal AS dal3
	WHERE dal1.ev=dal2.ev 
	And dal2.ev=dal3.ev
	And dal1.orszag="Belgium"
	And dal2.orszag="Hollandia"
	And dal3.orszag="Luxemburg";

-- 5.
SELECT dal.orszag, dal.ev
	FROM dal, verseny
	WHERE dal.ev+1=verseny.ev
	AND dal.orszag<>verseny.orszag
	AND helyezes=1;

-- 6.
SELECT orszag, nyelv, eredeti
	FROM dal
	WHERE id NOT IN (
		SELECT dal.id
		FROM dal, nyelv
		WHERE dal.orszag=nyelv.orszag
		AND dal.nyelv=nyelv.nyelv)
		AND nyelv<>'angol'
		AND nyelv NOT Like "%,%";

-- 7.
SELECT MAX(ev)+1 AS miota
	FROM verseny
	WHERE MONTH(datum)<>5;

-- 8.
SELECT *
	FROM dal
	WHERE helyezes<=3;

	