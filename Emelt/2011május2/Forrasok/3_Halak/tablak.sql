CREATE TABLE faj ( 
	halid INT AUTO_INCREMENT ,
	nev VARCHAR(100),
	feljegy INT,
	gyakorisag VARCHAR(1),
	eloford BOOLEAN,
	vedett BOOLEAN,
	PRIMARY KEY (halid)
);

CREATE TABLE nev ( 
	halid INT,
	tajnev VARCHAR(100)
);


