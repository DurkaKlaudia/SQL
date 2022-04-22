-- TWORZENIE ZAAWANSOWANYCH ZŁĄCZEŃ

select kl_nazwa, kl_kontakt
from klienci as k, zamowienia as z, elementyzamowienia as e
where k.kl_id = z.kl_id
	and e.zam_numer = z.zam_numer
    and prod_id = 'rgan01';
    
select kl_id, kl_nazwa, kl_kontakt
from klienci
where kl_nazwa = (select kl_nazwa 
					from klienci
                    where kl_kontakt = 'Danuta Sroka');
			
select k1.kl_id, k1.kl_nazwa, k1.kl_kontakt
from klienci as k1, klienci as k2
where k1.kl_nazwa = k2.kl_nazwa
	and k2.kl_kontakt = 'Danuta Sroka';
    
select k.*, z.zam_numer, z.zam_data,
		e.prod_id, e.ilosc, e.cena_elem
from klienci as k, elementyzamowienia as e, zamowienia as z
where k.kl_id = z.kl_id
	and e.zam_numer = z.zam_numer
    and prod_id = 'rgan01';
    
select klienci.kl_id, zamowienia.zam_numer
from klienci
inner join zamowienia on klienci.kl_id = zamowienia.kl_id;

select klienci.kl_id, zamowienia.zam_numer
from klienci
left outer join zamowienia on klienci.kl_id = zamowienia.kl_id;

select klienci.kl_id, zamowienia.zam_numer
from klienci
right outer join zamowienia on klienci.kl_id = zamowienia.kl_id;

select klienci.kl_id, count(zamowienia.zam_numer) as liczba_zam
from klienci
inner join zamowienia on klienci.kl_id = zamowienia.kl_id
group by klienci.kl_id;

select klienci.kl_id, count(zamowienia.zam_numer) as liczba_zam
from klienci
left outer join zamowienia on klienci.kl_id = zamowienia.kl_id
group by klienci.kl_id;

-- PRACA DOMOWA
-- Zadanie 1
select kl_nazwa, zam_numer
from klienci
join zamowienia on klienci.kl_id = zamowienia.kl_id
order by kl_nazwa;

-- Zadanie 2
select kl_nazwa, zam_numer
from klienci
left join zamowienia on klienci.kl_id = zamowienia.kl_id
order by kl_nazwa;

-- Zadanie 3
select prod_nazwa, zam_numer
from produkty left join elementyzamowienia on produkty.prod_id = elementyzamowienia.prod_id
order by prod_nazwa;

-- Zadanie 4
select prod_nazwa, count(zam_numer) as liczba_zam
from produkty left join elementyzamowienia
on produkty.prod_id = elementyzamowienia.prod_id
group by prod_nazwa
order by prod_nazwa;

-- Zadanie 5
select dostawcy.dost_id, count(prod_id)
from dostawcy
left join produkty on dostawcy.dost_id = produkty.dost_id
group by dostawcy.dost_id;