
CREATE TABLE `szolgaltatas` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `elerheto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;





ALTER TABLE `szolgaltatas`
  ADD PRIMARY KEY (`id`);

  CREATE TABLE `ugyfel` (
  `id` int(11) NOT NULL,
  `ablak` int(11) NOT NULL,
  `szolgaltatasid` int(11) NOT NULL,
  `erkezett` time NOT NULL,
  `sorrakerult` time NOT NULL,
  `tavozott` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `ugyfel`
  ADD PRIMARY KEY (`id`);
   
  ALTER TABLE `ugyfel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1767;
  
  