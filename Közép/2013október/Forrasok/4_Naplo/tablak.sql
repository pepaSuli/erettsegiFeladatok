CREATE TABLE `diak` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `osztaly` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `fiu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

ALTER TABLE `diak`
  ADD PRIMARY KEY (`id`);
COMMIT;

CREATE TABLE `jegy` (
  `id` int(11) NOT NULL,
  `diakid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `ertek` int(11) NOT NULL,
  `tipus` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `targyid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

ALTER TABLE `jegy`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `jegy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6439;
COMMIT;

CREATE TABLE `targy` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `kategoria` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

ALTER TABLE `targy`
  ADD PRIMARY KEY (`id`);
COMMIT;