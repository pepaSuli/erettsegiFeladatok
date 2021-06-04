
CREATE TABLE `dal` (
  `id` int(11) NOT NULL,
  `ev` int(11) NOT NULL,
  `sorrend` int(11) NOT NULL,
  `orszag` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `nyelv` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `eloado` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `eredeti` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `magyar` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `helyezes` int(11) NOT NULL,
  `pontszam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;



CREATE TABLE `nyelv` (
  `id` int(11) NOT NULL,
  `orszag` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `nyelv` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


CREATE TABLE `verseny` (
  `ev` int(11) NOT NULL,
  `datum` date NOT NULL,
  `varos` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `orszag` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `induloszam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;


ALTER TABLE `dal`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `nyelv`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `verseny`
  ADD PRIMARY KEY (`ev`);


ALTER TABLE `dal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1152;

ALTER TABLE `nyelv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
