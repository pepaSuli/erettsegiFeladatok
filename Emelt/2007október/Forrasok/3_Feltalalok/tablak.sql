CREATE TABLE `kapcsol` (
  `tkod` int(11) NOT NULL,
  `fkod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `kutato` (
  `fkod` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szul` int(11) NOT NULL,
  `meghal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `talalmany` (
  `tkod` int(11) NOT NULL,
  `talnev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `kutato`
  ADD PRIMARY KEY (`fkod`);
  
  ALTER TABLE `talalmany`
  ADD PRIMARY KEY (`tkod`);
COMMIT;