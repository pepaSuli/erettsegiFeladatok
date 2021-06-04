
create table merkozes
(id int primary key,
datum date,
ido time,
varos varchar(60),
stadion varchar(60),
nezoszam int,
ellenfel varchar(60),
lott int,
kapott int,
tetmeccs varchar(60));

create table megbizas
(id int primary key,
kapitanyid int,
elso int,
utolso int);

create table kapitany
(id int primary key,
nev varchar(60),
szuletett int,
elhunyt int);

