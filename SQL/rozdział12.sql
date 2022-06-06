-- ZŁĄCZENIE TABEL

select dost_nazwa, prod_nazwa, prod_cena
from dostawcy, produkty
where dostawcy.dost_id = produkty.dost_id;

select dost_nazwa, prod_nazwa, prod_cena
from dostawcy
inner join produkty on dostawcy.dost_id = produkty.dost_id;

select prod_nazwa, dost_nazwa, prod_cena, ilosc
from elementyzamowienia, dostawcy, produkty 
where dostawcy.dost_id = produkty.dost_id
	and elementyzamowienia.prod_id = produkty.prod_id
    and zam_numer = 20007;
    
-- poniższe polecenie z zapytań zagnieżdżonych można przedtsawić za pomocom złączenia tabel
select kl_nazwa, kl_kontakt
from klienci
where kl_id in(select kl_id
			from zamowienia
            where zam_numer in(select zam_numer
							from elementyzamowienia
                            where prod_id = 'rgan01'));
                            
select kl_nazwa, kl_kontakt
from klienci, zamowienia, elementyzamowienia
where klienci.kl_id = zamowienia.kl_id
	and elementyzamowienia.zam_numer = zamowienia.zam_numer
    and prod_id = 'rgan01';
    
-- PRACA DOMOWA
-- Zadanie 1
select kl_nazwa, zam_numer
from klienci, zamowienia
where klienci.kl_id = zamowienia.kl_id
order by kl_nazwa, zam_numer;

select kl_nazwa, zam_numer
from klienci
inner join zamowienia on klienci.kl_id = zamowienia.kl_id
order by kl_nazwa, zam_numer;

-- Zadanie 2
select kl_nazwa, zam_numer, (select sum(cena_elem * ilosc)
								from elementyzamowienia
                                where elementyzamowienia.zam_numer = zamowienia.zam_numer) as wartosc
from klienci, zamowienia
where klienci.kl_id = zamowienia.kl_id
order by wartosc, kl_nazwa, zam_numer;

select kl_nazwa, zamowienia.zam_numer, sum(cena_elem * ilosc) as wartosc
from klienci, zamowienia, elementyzamowienia
where klienci.kl_id = zamowienia.kl_id
	and elementyzamowienia.zam_numer = zamowienia.zam_numer
group by kl_nazwa, Zamowienia.zam_numer
order by wartosc, kl_nazwa, zam_numer;
    
-- Zadanie 3
select kl_id, zam_data
from zamowienia, elementyzamowienia
where zamowienia.zam_numer = elementyzamowienia.zam_numer
	and prod_id = 'br01'
order by zam_data, kl_id;

-- Zadanie 4
select kl_email
from klienci
inner join zamowienia on zamowienia.kl_id = klienci.kl_id
inner join elementyzamowienia on elementyzamowienia.zam_numer = zamowienia.zam_numer
	and prod_id = 'br01';
    
-- Zadanie 5
select * from elementyzamowienia;
select kl_nazwa, sum(ilosc * cena_elem) as wartosc
from klienci, elementyzamowienia, zamowienia
where klienci.kl_id = zamowienia.kl_id
and zamowienia.zam_numer = elementyzamowienia.zam_numer
group by kl_nazwa having sum(ilosc * cena_elem) >= 1000    
order by kl_nazwa;