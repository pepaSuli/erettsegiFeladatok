CREATE TABLE `gep` (
  `id` int(11) NOT NULL,
  `gyarto` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `kijelzo` int(11) NOT NULL,
  `memoria` int(11) NOT NULL,
  `merevlemez` int(11) NOT NULL,
  `videovezerlo` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `processzorid` int(11) NOT NULL,
  `oprendszerid` int(11) NOT NULL,
  `db` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `oprendszer` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `processzor` (
  `id` int(11) NOT NULL,
  `gyarto` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `gep`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `oprendszer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `processzor`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
COMMIT;