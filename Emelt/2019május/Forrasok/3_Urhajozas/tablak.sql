CREATE TABLE `kuldetes` (
  `id` int(11) NOT NULL,
  `megnevezes` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kezdet` date NOT NULL,
  `veg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `repules` (
  `urhajosid` int(11) NOT NULL,
  `kuldetesid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `urhajos` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `orszag` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `nem` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `szulev` int(11) NOT NULL,
  `urido` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


ALTER TABLE `repules`
  ADD PRIMARY KEY (`urhajosid`,`kuldetesid`);


ALTER TABLE `urhajos`
  ADD PRIMARY KEY (`id`);
COMMIT;