CREATE TABLE `elofizetes` (
  `id` int(11) NOT NULL,
  `eloid` int(11) NOT NULL,
  `lapid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `elofizeto` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `utca` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `hazszam` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

CREATE TABLE `lap` (
  `id` int(11) NOT NULL,
  `tema` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `havi` int(11) NOT NULL,
  `negyedeves` int(11) NOT NULL,
  `feleves` int(11) NOT NULL,
  `eves` int(11) NOT NULL,
  `gyakorisag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

ALTER TABLE `elofizetes`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `elofizeto`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lap`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `elofizetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
COMMIT;