
DROP TABLE IF EXISTS `menetrend`;
CREATE TABLE `menetrend` (
  `azon` int(11) NOT NULL,
  `jarat` varchar(30) NOT NULL,
  `honnan` varchar(30) NOT NULL,
  `hova` varchar(30) NOT NULL,
  `indul` time NOT NULL,
  `erkezik` time NOT NULL
);
ALTER TABLE `menetrend`
  ADD PRIMARY KEY (`azon`);

ALTER TABLE `menetrend`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT;

