CREATE TABLE `aru` (
  `aru_kod` int(11) NOT NULL,
  `kat_kod` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `egyseg` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `eladas` (
  `aru_kod` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `kategoria` (
  `kat_kod` int(11) NOT NULL,
  `kat_nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `aru`
  ADD PRIMARY KEY (`aru_kod`);

ALTER TABLE `eladas`
  ADD PRIMARY KEY (`aru_kod`);

ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kat_kod`);
COMMIT;