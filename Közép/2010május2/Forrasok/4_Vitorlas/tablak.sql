CREATE TABLE `hajo` (
  `regiszter` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `utas` int(11) NOT NULL,
  `dij` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `tura` (
  `azon` int(11) NOT NULL,
  `hajoazon` int(11) NOT NULL,
  `nap` int(11) NOT NULL,
  `szemely` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `hajo`
  ADD PRIMARY KEY (`regiszter`);

ALTER TABLE `tura`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `hajo`
  MODIFY `regiszter` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tura`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT;
