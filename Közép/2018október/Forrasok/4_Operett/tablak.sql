CREATE TABLE `kapcsolat` (
  `id` int(11) NOT NULL,
  `muid` int(11) NOT NULL,
  `tipus` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `alkotoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `alkoto` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `mu` (
  `id` int(11) NOT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `eredeti` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `szinhaz` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `ev` int(11) NOT NULL,
  `felvonas` int(11) NOT NULL,
  `kep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `kapcsolat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1561;
