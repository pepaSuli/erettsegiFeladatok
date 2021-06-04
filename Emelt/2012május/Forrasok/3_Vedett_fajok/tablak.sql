
CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);
COMMIT;

CREATE TABLE `ertek` (
  `id` int(11) NOT NULL,
  `forint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `ertek`
  ADD PRIMARY KEY (`id`);
COMMIT;

CREATE TABLE `allat` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `ertekid` int(11) NOT NULL,
  `ev` int(11) DEFAULT NULL,
  `katid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `allat`
  ADD PRIMARY KEY (`id`);
COMMIT;