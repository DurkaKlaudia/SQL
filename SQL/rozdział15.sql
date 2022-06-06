-- WSTAWIANIE DANYCH

select * from klienci;

insert into klienci
values('1000000006',
	'Zabawkolandia',
    'Miodowa 12',
    'Katowice',
    'SLK',
    '41-200',
    'Polska',
    null,
    null);
    
insert into klienci(kl_id,
	kl_nazwa,
    kl_adres,
    kl_miasto,
    kl_woj,
    kl_kod,
    kl_kraj,
    kl_kontakt,
    kl_email)
values('1000000006',
	'Zabawkolandia',
    'Miodowa 12',
    'Katowice',
    'SLK',
    '41-200',
    'Polska',
    null,
    null);
    
insert into klienci(kl_id,
			kl_nazwa,
			kl_adres,
			kl_miasto,
			kl_woj,
			kl_kod,
			kl_kraj,
			kl_kontakt,
			kl_email)
select kl_id,
		kl_nazwa,
		kl_adres,
		kl_miasto,
		kl_woj,
		kl_kod,
		kl_kraj,
		kl_kontakt,
		kl_email
from klienciNowi;

create table kopiaKlienci as select * from klienci;

-- PRACA DOMOWA
-- Zadanie 1
insert into klienci(kl_id,
	kl_nazwa,
    kl_adres,
    kl_miasto,
    kl_woj,
    kl_kod,
    kl_kraj,
    kl_kontakt,
    kl_email)
values('1000000007',
	'Zabawkoraj',
    'Złota 13',
    'Łowicz',
    'LDZ',
    '99-299',
    'Polska',
    'Anna Nowak',
    'nowak.anna@zabawkoraj.pl');
    
-- Zadanie 2
create table kopiaZamowienia as select * from zamowienia;
create table kopiaElementyZamowienia as select * from elementyzamowienia;