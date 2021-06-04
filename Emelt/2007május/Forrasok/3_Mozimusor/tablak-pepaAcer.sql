CREATE TABLE `film` (
  `fkod` int(11) NOT NULL,
  `filmcim` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szines` tinyint(1) NOT NULL,
  `szinkron` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szarmazas` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `mufaj` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `hossz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `hely` (
  `fkod` int(11) NOT NULL,
  `moziazon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `mozi` (
  `moziazon` int(11) NOT NULL,
  `mozinev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `irszam` int(11) NOT NULL,
  `cim` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `film`
  ADD KEY `fkod` (`fkod`);

ALTER TABLE `mozi`
  ADD PRIMARY KEY (`moziazon`);
COMMIT;