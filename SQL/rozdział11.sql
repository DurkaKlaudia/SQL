-- ZAPYTANIA ZAGNIEŻDŻONE

select zam_numer
from elementyzamowienia
where prod_id = 'rgan01';

select kl_id 
from zamowienia
where zam_numer in(20007, 20008);

select kl_id
from zamowienia
where zam_numer in(select zam_numer
					from elementyzamowienia
                    where prod_id = 'rgan01');
                    
select kl_nazwa, kl_kontakt
from klienci
where kl_id in('1000000004', '1000000005');		

select kl_nazwa, kl_kontakt
from klienci
where kl_id in(select kl_id
				from zamowienia
				where zam_numer in(select zam_numer
									from elementyzamowienia
									where prod_id = 'rgan01'));
                                    
select count(*) as zamowienia
from zamowienia
where kl_id = '1000000001';  

select kl_nazwa, kl_woj, (select count(*)
							from zamowienia
                            where zamowienia.kl_id = klienci.kl_id) as zamowienia
from klienci
order by kl_nazwa;

-- PRACA DOMOWA
-- Zadanie 1
select kl_id
from zamowienia
where zam_numer in(select zam_numer
				from elementyzamowienia
				where cena_elem >= 10);
                
-- Zadanie 2
select * from zamowienia;
select * from elementyzamowienia;

select kl_id, zam_data
from zamowienia
where zam_numer in(select zam_numer
				from elementyzamowienia
                where prod_id = 'br01')
order by zam_data;

-- Zadanie 3
select * from klienci;

select kl_email
from klienci
where kl_id in(select kl_id
			from zamowienia
			where zam_numer in(select zam_numer
							from elementyzamowienia
							where prod_id = 'br01'));
                            
-- Zadanie 4
select kl_id,
       (select SUM(cena_elem*ilosc)
        from ElementyZamowienia
        where Zamowienia.zam_numer = ElementyZamowienia.zam_numer) 
        as wartosc_zam
from Zamowienia
order by wartosc_zam desc;

-- Zadanie 5
select prod_nazwa,
       (select sum(ilosc)
        from ElementyZamowienia
        where Produkty.prod_id=ElementyZamowienia.prod_id) as sprzedano_sztuk
from Produkty;