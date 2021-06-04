
DROP TABLE IF EXISTS `allomas`;
CREATE TABLE `allomas` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `ev` int(11) DEFAULT NULL,
  `dokszam` int(11) DEFAULT NULL
);



DROP TABLE IF EXISTS `hely`;
CREATE TABLE `hely` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cim` varchar(50) DEFAULT NULL,
  `kerulet` int(11) DEFAULT NULL,
  `allomasid` int(11) DEFAULT NULL
);
