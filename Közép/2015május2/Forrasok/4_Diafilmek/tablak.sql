

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kiadasiev` int(11) DEFAULT 0,
  `kocka` int(11) DEFAULT 0,
  `szinese` tinyint(1) DEFAULT NULL,
  `kiadoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `kiado` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `kiado`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `kiado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
