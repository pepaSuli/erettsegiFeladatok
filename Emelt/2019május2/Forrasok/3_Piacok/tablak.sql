DROP TABLE IF EXISTS arusitohely;
DROP TABLE IF EXISTS nyitvatartas;

CREATE TABLE arusitohely (
id int(11),
nev varchar(255),
tipus varchar(255),
megye varchar(255),
telepules varchar(255),
tipusid int(11),
megyeid int(11),
telepulesid int(11),
irszam int(11),
cim varchar(255)
);


CREATE TABLE nyitvatartas (
	helyid int(11),
	napid int(11)
);

ALTER TABLE arusitohely
  ADD PRIMARY KEY (id);

ALTER TABLE nyitvatartas ADD INDEX (helyid,napid);
ALTER TABLE nyitvatartas ADD PRIMARY KEY (helyid,napid);