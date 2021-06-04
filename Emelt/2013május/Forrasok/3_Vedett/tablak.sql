
CREATE TABLE `igazgatosag` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `kapcsolo` (
  `vtid` int(11) NOT NULL,
  `telepid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `telepules` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `vt` (
  `id` int(11) NOT NULL,
  `kategoria` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `igid` int(11) NOT NULL,
  `terulet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `igazgatosag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kapcsolo`
  ADD PRIMARY KEY (`vtid`,`telepid`);

ALTER TABLE `telepules`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vt`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `igazgatosag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `vt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
