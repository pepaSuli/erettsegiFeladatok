CREATE TABLE `klub` (
  `id` int(11) NOT NULL,
  `csapatnev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `labdarugo` (
  `id` int(11) NOT NULL,
  `mezszam` int(11) NOT NULL,
  `klubid` int(11) NOT NULL,
  `posztid` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `utonev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `vezeteknev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `szulido` date NOT NULL,
  `magyar` tinyint(1) NOT NULL,
  `kulfoldi` tinyint(1) NOT NULL,
  `ertek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `poszt` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `klub`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `labdarugo`
  ADD PRIMARY KEY (`id`);
  
 ALTER TABLE `poszt`
  ADD PRIMARY KEY (`id`);
