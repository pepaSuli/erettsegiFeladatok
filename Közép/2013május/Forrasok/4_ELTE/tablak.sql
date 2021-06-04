CREATE TABLE `jelentkezes` (
  `az` int(11) NOT NULL,
  `ev` int(11) NOT NULL,
  `szakaz` int(11) NOT NULL,
  `ossz` int(11) NOT NULL,
  `elso` int(11) NOT NULL,
  `felvett` int(11) NOT NULL,
  `pont` int(11) NOT NULL,
  `forma` varchar(5) COLLATE utf8_hungarian_ci NOT NULL,
  `munkarend` varchar(5) COLLATE utf8_hungarian_ci NOT NULL,
  `tamogatott` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `jelentkezes`
  ADD PRIMARY KEY (`az`);

ALTER TABLE `jelentkezes`
  MODIFY `az` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2110;
COMMIT;

CREATE TABLE `szak` (
  `az` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kar` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `szak`
  ADD PRIMARY KEY (`az`);
COMMIT;
