
INSERT INTO `helyszin` (`id`, `nev`, `megyeid`) VALUES
(1, 'Várpalota', 14),
(2, 'Kulcs', 13),
(3, 'Mosonszolnok', 15),
(4, 'Mosonmagyaróvár', 15),
(5, 'Bükkaranyos', 1),
(6, 'Erk', 2),
(7, 'Újrónafő', 15),
(8, 'Szápár', 14),
(9, 'Vép', 16),
(11, 'Mezőtúr', 5),
(12, 'Törökszentmiklós', 5),
(14, 'Felsőzsolca', 1),
(15, 'Csetény', 14),
(16, 'Ostffyasszonyfa', 16),
(17, 'Levél', 15),
(19, 'Csorna', 15),
(20, 'Mecsér', 15),
(21, 'Bakonycsernye', 13),
(22, 'Sopronkövesd', 15),
(23, 'Nagylózs', 15),
(25, 'Jánossomorja', 15),
(26, 'Ács', 12),
(27, 'Pápakovácsi', 14),
(28, 'Vönöck', 16),
(29, 'Kisigmánd', 12),
(30, 'Bőny', 15),
(31, 'Csém', 12),
(32, 'Nagyigmánd', 12),
(35, 'Bábolna', 12),
(37, 'Ikervár', 16),
(38, 'Lövő', 15);


INSERT INTO `megye` (`id`, `nev`, `regio`) VALUES
(1, 'Borsod-Abaúj-Zemplén', 'Észak-Magyarország \r'),
(2, 'Heves', 'Észak-Magyarország \r'),
(3, 'Nógrád', 'Észak-Magyarország \r'),
(4, 'Hajdú-Bihar', 'Észak-Alföld \r'),
(5, 'Jász-Nagykun-Szolnok', 'Észak-Alföld \r'),
(6, 'Szabolcs-Szatmár-Bereg', 'Észak-Alföld \r'),
(7, 'Bács-Kiskun', 'Dél-Alföld \r'),
(8, 'Békés', 'Dél-Alföld \r'),
(9, 'Csongrád', 'Dél-Alföld \r'),
(10, 'Pest', 'Közép-Magyarország \r'),
(11, 'Budapest ', 'Közép-Magyarország \r'),
(12, 'Komárom-Esztergom', 'Közép-Dunántúl \r'),
(13, 'Fejér', 'Közép-Dunántúl \r'),
(14, 'Veszprém', 'Közép-Dunántúl \r'),
(15, 'Győr-Moson-Sopron', 'Nyugat-Dunántúl \r'),
(16, 'Vas', 'Nyugat-Dunántúl \r'),
(17, 'Zala', 'Nyugat-Dunántúl \r'),
(18, 'Baranya', 'Dél-Dunántúl \r'),
(19, 'Somogy', 'Dél-Dunántúl \r'),
(20, 'Tolna', 'Dél-Dunántúl \r');


INSERT INTO `torony` (`id`, `darab`, `teljesitmeny`, `kezdev`, `helyszinid`) VALUES
(1, 1, 250, 2000, 1),
(2, 1, 600, 2001, 2),
(3, 2, 600, 2002, 3),
(4, 2, 600, 2003, 4),
(5, 1, 225, 2005, 5),
(6, 1, 800, 2005, 6),
(7, 1, 800, 2005, 7),
(8, 1, 1800, 2005, 8),
(9, 1, 600, 2005, 9),
(10, 5, 2000, 2005, 4),
(11, 1, 1500, 2006, 11),
(12, 1, 1500, 2006, 12),
(13, 5, 2000, 2006, 4),
(14, 1, 1800, 2006, 14),
(15, 2, 2000, 2006, 15),
(16, 1, 600, 2006, 16),
(17, 12, 2000, 2006, 17),
(18, 1, 800, 2007, 3),
(19, 1, 800, 2007, 19),
(20, 1, 800, 2007, 20),
(21, 1, 2000, 2007, 21),
(22, 4, 3000, 2008, 22),
(23, 3, 3000, 2008, 23),
(24, 1, 2000, 2008, 23),
(25, 12, 2000, 2008, 17),
(26, 4, 2000, 2008, 25),
(27, 1, 1800, 2008, 25),
(28, 1, 2000, 2008, 26),
(29, 1, 2000, 2008, 27),
(30, 1, 850, 2008, 28),
(31, 19, 2000, 2009, 29),
(32, 8, 2000, 2009, 30),
(33, 4, 1800, 2010, 30),
(34, 1, 1800, 2010, 30),
(35, 6, 2000, 2010, 31),
(36, 7, 2000, 2010, 32),
(37, 6, 2000, 2010, 26),
(38, 2, 2000, 2010, 32),
(39, 6, 2000, 2010, 35),
(40, 1, 3000, 2010, 35),
(41, 1, 2000, 2010, 25),
(42, 4, 2000, 2011, 37),
(43, 13, 2000, 2011, 37),
(44, 1, 2000, 2010, 38);

