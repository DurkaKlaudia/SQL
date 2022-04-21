-- FUNKCJE AGREGUJĄCE

/*
avg() - średnia wartość kolumny
count() - liczba wierszy w kolumnie
max() - największa wartość w kolumnie
min() - najmniejsza wartość w kolumnie
sum() - suma wartości w kolumnie
*/

select avg(prod_cena) as sr_cena
from produkty;

select avg(prod_cena) as sr_cena
from produkty
where dost_id = 'dll01';

select count(*) as liczba_klientow
from klienci;

select count(kl_email) as liczba_klientow
from klienci;

select max(prod_cena) as maks_cena
from produkty;

select min(prod_cena) as min_cena
from produkty;

select sum(ilosc) as elementy_zamowienia
from elementyzamowienia
where zam_numer = 20005;

select sum(ilosc * cena_elem) as laczna_cena
from elementyzamowienia
where zam_numer = 20005;

select avg(distinct prod_cena) as sr_cena
from produkty
where dost_id = "dll01";

select count(*) as liczba_elementow,
		min(prod_cena) as cena_min,
        max(prod_cena) as cena_max,
        avg(prod_cena) as cena_sr
from produkty;

-- PRACA DOMOWA
-- Zadanie 1
select sum(ilosc) as lacznie_sprzedanych_produktow
from elementyzamowienia;

-- Zadanie 2
select sum(ilosc) as lacznie_sprzedanych_produktow
from elementyzamowienia
where prod_id = 'br01';

-- Zadanie 3
select max(prod_cena) as cena_maks
from produkty
where prod_cena <= 10;