DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `eloado` varchar(100) NOT NULL,
  `cim` varchar(100) NOT NULL
) ;

CREATE TABLE `toplista` (
  `albumid` int(11) NOT NULL,
  `helyezes` int(11) NOT NULL,
  `platinadb` int(11) NOT NULL,
  `ev` int(11) NOT NULL,
  `kiado` varchar(100) NOT NULL
) ;

ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;