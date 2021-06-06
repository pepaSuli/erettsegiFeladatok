DROP TABLE IF EXISTS `ar`;
CREATE TABLE `ar` (
  `id` int(11) NOT NULL,
  `sutiid` int(11) NOT NULL,
  `ertek` int(11) NOT NULL,
  `egyseg` varchar(30) NOT NULL
) ;
DROP TABLE IF EXISTS `suti`;
CREATE TABLE `suti` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `tipus` varchar(30) NOT NULL,
  `dijazott` tinyint(1) NOT NULL
) ;
DROP TABLE IF EXISTS `tartalom`;
CREATE TABLE `tartalom` (
  `id` int(11) NOT NULL,
  `sutiid` int(11) NOT NULL,
  `mentes` varchar(30) NOT NULL
);
ALTER TABLE `suti`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tartalom`
  ADD PRIMARY KEY (`id`);