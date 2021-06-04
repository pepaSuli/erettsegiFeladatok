CREATE TABLE `iro` (
  `azonosito` int(11) NOT NULL,
  `ev` int(11) NOT NULL,
  `szemely` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `szulhely` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `iro`
  ADD PRIMARY KEY (`azonosito`);

ALTER TABLE `iro`
  MODIFY `azonosito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
COMMIT;

CREATE TABLE `fold` (
  `azon` int(11) NOT NULL,
  `orszag` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kontinens` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `fold`
  ADD PRIMARY KEY (`azon`);
COMMIT;
