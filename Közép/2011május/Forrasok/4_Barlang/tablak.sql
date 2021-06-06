
DROP TABLE IF EXISTS `barlang`;
CREATE TABLE `barlang` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `hossz` int(11) NOT NULL,
  `kiterjedes` int(11) NOT NULL,
  `melyseg` int(11) NOT NULL,
  `magassag` int(11) NOT NULL,
  `telepules` varchar(30) NOT NULL;


ALTER TABLE `barlang`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `barlang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

