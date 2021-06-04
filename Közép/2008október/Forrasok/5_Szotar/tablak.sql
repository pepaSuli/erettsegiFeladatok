CREATE TABLE `szolista` (
  `azon` int(11) NOT NULL,
  `angol` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `magyar` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `felvetel` date NOT NULL,
  `helyes` int(11) NOT NULL,
  `helytelen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `szolista`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `szolista`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1558;
COMMIT;