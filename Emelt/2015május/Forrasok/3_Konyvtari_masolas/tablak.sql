
CREATE TABLE `hallgato` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `osztondijas` tinyint(1) NOT NULL,
  `karid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `kar` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kvota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `masolas` (
  `id` int(11) NOT NULL,
  `hallgatoid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `lap` int(11) NOT NULL,
  `oldal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `hallgato`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kar`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `masolas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `hallgato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `kar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `masolas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
