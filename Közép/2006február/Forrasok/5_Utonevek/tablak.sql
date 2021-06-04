CREATE TABLE `list2005` (
  `azon` int(11) NOT NULL,
  `utonev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `elso` int(11) NOT NULL,
  `masodik` int(11) NOT NULL,
  `ujsz_1` int(11) NOT NULL,
  `ujsz_2` int(11) NOT NULL,
  `nem` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `list2005`
  ADD PRIMARY KEY (`azon`);
  
  ALTER TABLE `list2005`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;
COMMIT;