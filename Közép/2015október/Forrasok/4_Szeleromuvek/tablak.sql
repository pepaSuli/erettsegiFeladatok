
CREATE TABLE `helyszin` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `megyeid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `megye` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `regio` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `torony` (
  `id` int(11) NOT NULL,
  `darab` int(11) DEFAULT NULL,
  `teljesitmeny` int(11) DEFAULT NULL,
  `kezdev` int(11) DEFAULT NULL,
  `helyszinid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `helyszin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `megye`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `torony`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `helyszin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `megye`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `torony`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
