DROP TABLE IF EXISTS rendeles;
DROP TABLE IF EXISTS cim;
DROP TABLE IF EXISTS pizza;

CREATE TABLE `cim` (
  `id` int(11) NOT NULL,
  `nev` varchar(100),
  `utca` varchar(100),
  `hsz` varchar(100),
  PRIMARY KEY (id)
);


CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `nev` varchar(100),
  `meret` int(11),
  `ar` int(11),
  PRIMARY KEY (id)
);

CREATE TABLE `rendeles` (
  `id` int(11) NOT NULL,
  `pizzaid` int(11),
  `darab` int(11),
  `cimid` int(11),
  `szallitas` time,
  PRIMARY KEY (id),
  FOREIGN KEY (pizzaid) REFERENCES pizza(id),
  FOREIGN KEY (cimid) REFERENCES cim(id)
);

