
CREATE TABLE `megallo` (
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `menetido` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `utazas` (
  `az` int(11) NOT NULL,
  `honnan` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `hova` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `mikor` time NOT NULL,
  `letszam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `megallo`
  ADD PRIMARY KEY (`nev`);

ALTER TABLE `utazas`
  ADD PRIMARY KEY (`az`);

ALTER TABLE `utazas`
  MODIFY `az` int(11) NOT NULL AUTO_INCREMENT;
