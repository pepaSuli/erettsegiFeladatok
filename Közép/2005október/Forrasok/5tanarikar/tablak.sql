CREATE TABLE `adatok` (
  `azon` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szak` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `mettol` int(11) NOT NULL,
  `meddig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `adatok`
  ADD PRIMARY KEY (`azon`);
  
  ALTER TABLE `adatok`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;
COMMIT;