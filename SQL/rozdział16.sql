-- AKTUALIZACJA I USUWANIE DANYCH

select * from klienci;
select * from dostawcy;

update klienci
set kl_email =null
where kl_id = '1000000005';

delete from klienci
where kl_id = '1000000006';

-- PRACA DOMOWA
--  Zadanie 1
update dostawcy
set dost_woj = upper(dost_woj)
where dost_kraj = 'Polska';
update klienci
set kl_woj = upper(kl_woj)
where kl_kraj = 'Polska';

-- Zadanie 2
select * from klienci
where kl_id = 1000000007;

delete klienci
from klienci
where kl_id = 1000000007;