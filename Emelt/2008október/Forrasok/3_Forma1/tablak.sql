CREATE TABLE `eredmeny` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `pilotaaz` int(11) NOT NULL,
  `helyezes` int(11) NOT NULL,
  `hiba` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `csapat` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `motor` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `gp` (
  `datum` date NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `helyszin` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `pilota` (
  `az` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `nem` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szuldat` date NOT NULL,
  `nemzet` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `eredmeny`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `gp`
  ADD PRIMARY KEY (`datum`);
  
ALTER TABLE `eredmeny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2260;
COMMIT;