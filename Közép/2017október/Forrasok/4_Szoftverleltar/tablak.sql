create table gep
(id int primary key,
hely varchar(60),
tipus varchar(60),
ipcim varchar(60));

create table szoftver
(id int primary key,
nev varchar(60),
kategoria varchar(60));

create table telepites
(id int primary key,
gepid int,
szoftverid int,
verzio varchar(60),
datum date);

