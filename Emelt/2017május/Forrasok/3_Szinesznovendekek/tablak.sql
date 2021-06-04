create table hallgato
(id int primary key,
osztalyid int,
nev varchar(60),
ferfi boolean);

create table osztaly
(id int primary key,
kezdeseve int,
vegzeseve int);

create table tanitja
(id int primary key,
tanarid int,
osztalyid int);

create table tanar
(id int primary key,
nev varchar(60));