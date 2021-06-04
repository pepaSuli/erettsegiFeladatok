CREATE TABLE `adalek` (
  `kod` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `mellekhatas` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `adalek`
  ADD PRIMARY KEY (`kod`);
COMMIT;

CREATE TABLE `funkcio` (
  `az` int(11) NOT NULL,
  `kod` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `fnev` varchar(60) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `funkcio`
  ADD PRIMARY KEY (`az`);


ALTER TABLE `funkcio`
  MODIFY `az` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;
COMMIT;