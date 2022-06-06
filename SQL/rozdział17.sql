-- TWORZENIE I MODYFIKACJA TABEL

select * from produkty;

/* 
tabela Produkty:

create table Produkty
(
prod_id		char(10)		not null,
dost_id		char(10)		not null,
prod_nazwa	char(254)		not null,
prod_cena	decimal(8,2)	not null,
produ_opis	varchar(1000)	null
);
*/

/*
tabela Zamówienia

create table Zamówienia
(
zam_numer	integer		not null,
zam_data	datetime	not null,
kl_id		char(10)	not null
);
*/

/*
tabela Dostawcy

create table Dostawcy
(
dost_id		char(10)	not null,
dost_nazwa	char(50)	not null,
dost_adres	char(50)	,
dost_miasto	char(50)	,
dost_woj	char(5)		,
dost_kod	char(10)	,
dost_kraj	char(50)
);
*/

/* 
tabela ElementyZamowienia

create table ElementyZamowienia
(
zam_numer		integer			not null,
zam_element		integer			not null,
prod_id			char(10)		not null,
ilosc			integer			not null default 1,
cena_elem		decimal(8,2)	not null
);
*/

-- pobieranie daty systemowej: 		current_date() lub now()

select * from dostawcy;

alter table dostawcy
add dost_telefon char(20);

drop table kopiaklienci;

-- PRACA DOMOWA	alter1.	ALTER TABLE Dostawcy
-- Zadanie 1
alter table dostawcy
add dost_witryna char(100);

-- Zadanie 2
update Dostawcy
set dost_witryna = 'https://google.com/'
where dost_id = 'DLL01';
