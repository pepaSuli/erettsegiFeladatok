create table szinesz
(id int primary key,
nev varchar(60),
szuletesinev varchar(60),
valasztas date,
szuletett date,
szuletesihely varchar(60),
elhunyt date,
halalozasihely varchar(60));

create table kapott
(id int primary key,
ev int,
szineszid int,
elismeresid int);

create table elismeres
(id int primary key,
megnevezes varchar(60));

