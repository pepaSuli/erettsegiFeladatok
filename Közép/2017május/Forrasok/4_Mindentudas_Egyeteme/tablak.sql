create table eloadas
(id int primary key,
cim varchar(60),
ido date);

create table kapcsolo
(tudosid int,
eloadasid int);

ALTER TABLE kapcsolo
  ADD PRIMARY KEY (tudosid,eloadasid);

create table tudos
(id int primary key,
nev varchar(60),
terulet varchar(60));

