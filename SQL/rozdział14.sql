-- ŁĄCZENIE ZAPYTAŃ

select kl_nazwa, kl_kontakt, kl_email
from klienci
where kl_woj in('MAL', 'MAZ', 'WKP');

select kl_nazwa, kl_kontakt, kl_email
from klienci 
where kl_nazwa = 'Zabawa dla wszystkich'; 

select kl_nazwa, kl_kontakt, kl_email
from klienci
where kl_woj in('MAL', 'MAZ', 'WKP')
	or kl_nazwa = 'Zabawa dla wszystkich';

select kl_nazwa, kl_kontakt, kl_email
from klienci
where kl_woj in('MAL', 'MAZ', 'WKP')
union
select kl_nazwa, kl_kontakt, kl_email
from klienci 
where kl_nazwa = 'Zabawa dla wszystkich'
order by kl_nazwa, kl_kontakt;

select kl_nazwa, kl_kontakt, kl_email
from klienci
where kl_woj in('MAL', 'MAZ', 'WKP')
union all
select kl_nazwa, kl_kontakt, kl_email
from klienci 
where kl_nazwa = 'Zabawa dla wszystkich';

-- PRACA DOMOWA
-- Zadanie 1
select prod_id, ilosc
from elementyzamowienia
where prod_id like 'bnbg%'
union
select prod_id, ilosc
from elementyzamowienia
where ilosc = 100
order by prod_id;

-- Zadanie 2
select prod_id, ilosc
from elementyzamowienia
where prod_id like 'bnbg%'
	or ilosc = 100
order by prod_id;