CREATE TABLE `vizsga` (
  `vizsgazoaz` int(11) NOT NULL,
  `vizsgatargyaz` int(11) NOT NULL,
  `szobeli` int(11) NOT NULL,
  `irasbeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `vizsgatargy` (
  `azon` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szomax` int(11) NOT NULL,
  `irmax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `vizsgazo` (
  `azon` int(11) NOT NULL,
  `nev` int(255) NOT NULL,
  `osztaly` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `vizsgatargy`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `vizsgazo`
  ADD PRIMARY KEY (`azon`);
COMMIT;