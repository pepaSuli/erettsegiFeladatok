CREATE TABLE 
	hatar ( 
		magyarh VARCHAR(50) NOT NULL , 
		szomszedh VARCHAR(50) NOT NULL , 
		orszag VARCHAR(50) NOT NULL , 
		tipus VARCHAR(50) NOT NULL 
	);
CREATE TABLE 
	telepules ( 
		nev VARCHAR(50) NOT NULL , 
		tipus VARCHAR(50) NOT NULL , 
		megye VARCHAR(50) NOT NULL , 
		CONSTRAINT pk_telepules PRIMARY KEY (nev)
  );