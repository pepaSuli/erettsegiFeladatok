
DROP TABLE IF EXISTS `meres`;
CREATE TABLE `meres` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `vizallas` int(11) NOT NULL,
  `varos` varchar(30) NOT NULL,
  `folyo` varchar(30) NOT NULL;

ALTER TABLE `meres`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `meres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
