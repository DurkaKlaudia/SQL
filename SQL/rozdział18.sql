-- STOSOWANIE PERSPEKTYW

select kl_nazwa, kl_kontakt
from klienci, zamowienia, elementyzamowienia
where klienci.kl_id = zamowienia.kl_id
	and elementyzamowienia.zam_numer = zamowienia.zam_numer
    and prod_id = 'rgan01';

create view ProduktyKlientow as
select kl_nazwa, kl_kontakt, prod_id
from klienci, zamowienia, elementyzamowienia
where klienci.kl_id = zamowienia.kl_id
	and elementyzamowienia.zam_element = zamowienia.zam_numer;
    
select kl_nazwa, kl_kontakt
from ProduktyKlientow
where prod_id = 'rgan01';

select rtrim(dost_nazwa) + ' (' + rtrim(dost_kraj) + ')' as dost_tytul
from dostawcy
order by dost_nazwa;

create view LokalizacjeKlientow as 
select rtrim(dost_nazwa) + ' (' + rtrim(dost_kraj) + ')' as dost_tytul
from dostawcy;

select * from LokalizacjeKlientow;

create view AdresyEmailKlientow as 
select kl_id, kl_nazwa, kl_email
from klienci
where kl_email is not null;

select * from AdresyEmailKlientow;

select prod_id, ilosc, cena_elem, ilosc*cena_elem as wartosc
from elementyzamowienia
where zam_numer = 20008;

create view WartosciElementowZamowienia as
select zam_numer, prod_id, ilosc, cena_elem, ilosc*cena_elem as wartosc
from elementyzamowienia;

select * 
from WartosciElementowZamowienia 
where zam_numer = 20008;

-- PRACA DOMOWA	
-- Zadanie 1
create view KlienciZZamowieniami as
select Klienci.kl_id,
       Klienci.kl_nazwa,
       Klienci.kl_adres,
       Klienci.kl_miasto,
       Klienci.kl_woj,
       Klienci.kl_kod,
       Klienci.kl_kraj,
       Klienci.kl_kontakt,
       Klienci.kl_email
from Klienci
join Zamowienia on Klienci.kl_id = Zamowienia.kl_id;

select * from KlienciZZamowieniami;
