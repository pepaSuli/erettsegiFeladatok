
CREATE TABLE `foglalkozas` (
  `azon` int(11) NOT NULL,
  `szemaz` int(11) NOT NULL,
  `fognev` varchar(30) NOT NULL;


ALTER TABLE `foglalkozas`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `mikor`
  ADD PRIMARY KEY (`azonosito`);

ALTER TABLE `szemely`
  ADD PRIMARY KEY (`szemaz`);


ALTER TABLE `foglalkozas`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mikor`
  MODIFY `azonosito` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `szemely`
  MODIFY `szemaz` int(11) NOT NULL AUTO_INCREMENT;
