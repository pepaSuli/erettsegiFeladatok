CREATE TABLE `csaladtag` (
  `azon` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `mettol` int(11) NOT NULL,
  `meddig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `szulo` (
  `azon` int(11) NOT NULL,
  `apja` int(11) NOT NULL,
  `anyja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `csaladtag`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `szulo`
  ADD PRIMARY KEY (`azon`);
COMMIT;