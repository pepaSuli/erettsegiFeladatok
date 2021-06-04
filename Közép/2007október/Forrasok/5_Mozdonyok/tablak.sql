CREATE TABLE `mozdony` (
  `sorozat` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `psz` int(11) NOT NULL,
  `gyart_ev` int(11) NOT NULL,
  `gyarto` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `allagba` date NOT NULL,
  `tulaj` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `mozdony`
  ADD PRIMARY KEY (`sorozat`,`psz`);
COMMIT;