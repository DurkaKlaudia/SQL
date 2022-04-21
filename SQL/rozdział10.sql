-- GRUPOWANIE DANYCH

select count(*) as liczba_prod
from produkty
where dost_id = 'dll01';

select dost_id, count(*) as liczba_prod
from produkty
group by dost_id;

select kl_id, count(*) as zamowienia
from zamowienia
group by kl_id
having count(*) >= 2;

select dost_id, count(*) as liczba_prod
from produkty
where prod_cena >= 10
group by dost_id
having count(*) >= 2;

select dost_id, count(*) as liczba_prod
from produkty
group by dost_id
having count(*) >= 2;

select zam_numer, count(*) as elementy
from elementyzamowienia
group by zam_numer
having count(*) >= 3;

select zam_numer, count(*) as elementy
from elementyzamowienia
group by zam_numer
having count(*) >= 3
order by elementy, zam_numer;

-- PRACA DOMOWA
-- Zadanie 1
select zam_numer, count(*) as zam_pozycje
from elementyzamowienia
group by zam_numer
order by zam_pozycje; 

-- Zadanie 2
select dost_id, min(prod_cena) as najtanszy_prod
from produkty
group by dost_id
order by najtanszy_prod;

-- Zadanie 3
select zam_numer 
from elementyzamowienia
where ilosc >= 100
group by zam_numer
order by zam_numer;

select zam_numer
from ElementyZamowienia
group by zam_numer
having SUM(ilosc) >= 100
order by zam_numer;

-- Zadanie 4
select zam_numer, sum(cena_elem * ilosc) as cena_w_sumie
from elementyzamowienia
group by zam_numer
having sum(cena_elem * ilosc) >= 1000
order by zam_numer;