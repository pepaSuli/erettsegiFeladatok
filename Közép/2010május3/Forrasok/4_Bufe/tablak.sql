
CREATE TABLE `vasarlas` (
  `id` int(11) NOT NULL,
  `vasarlokod` int(11) NOT NULL,
  `osszeg` int(11) NOT NULL,
  `idopont` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `vasarlo` (
  `kod` int(11) NOT NULL,
  `csoport` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `ferfi` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `vasarlas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vasarlo`
  ADD PRIMARY KEY (`kod`);

ALTER TABLE `vasarlas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `vasarlo`
  MODIFY `kod` int(11) NOT NULL AUTO_INCREMENT;
