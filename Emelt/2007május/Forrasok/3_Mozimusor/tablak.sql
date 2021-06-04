CREATE TABLE `film` (
  `fkod` int(11) NOT NULL,
  `filmcim` varchar(255) NOT NULL,
  `szines` tinyint(1) NOT NULL,
  `szinkron` varchar(255) NOT NULL,
  `szarmazas` varchar(255) NOT NULL,
  `mufaj` varchar(255) NOT NULL,
  `hossz` int(11) NOT NULL
);

CREATE TABLE `hely` (
  `fkod` int(11) NOT NULL,
  `moziazon` int(11) NOT NULL
);

CREATE TABLE `mozi` (
  `moziazon` int(11) NOT NULL,
  `mozinev` varchar(255) NOT NULL,
  `irszam` int(11) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL
);

ALTER TABLE `film`
  ADD PRIMARY KEY `fkod` (`fkod`);

ALTER TABLE `mozi`
  ADD PRIMARY KEY (`moziazon`);
