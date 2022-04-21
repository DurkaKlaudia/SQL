-- MODYFIKACJA DANYCH ZA POMOCĄ FUNKCJI

select dost_nazwa, upper(dost_nazwa) as dost_nazwa_duze
from dostawcy
order by dost_nazwa;

/*
left() - zwraca znaki z lewej strony tekstu
rirht() - zwraca znaki z prawej strony testu
lenght() - zwraca długość tekstu
lower() - konwertuje na małe litery
upper() - konwertuje na duże litery
trim() - usuwa spacje z obu stron tesktu
ltrim() - usuwa spacje z lewej strony tekstu
rtrim() - usuwa spacje z prawej strony tekstu
substr() - pobiera fragment łańcucha znaków
soundex() - zwaraca wartosc soundex tekstu 
*/

select kl_nazwa, kl_kontakt
from klienci
where kl_kontakt = 'Michael Znany';

select kl_nazwa, kl_kontakt
from klienci
where soundex(kl_kontakt) = soundex('Michael Znany');

select zam_numer 
from zamowienia
where year(zam_data) = 2012;

/*
FUNKCJE NUMERYCZNE
abs() - wartość bezwzględna liczby
sin() - sinus podanego kąta
cos() - cosinus podanego kąta
tg() - tangens podanego kąta
ctg() - cotangens podanego kąta
exp() - wartość wykładnicza dla podanej liczby
pi() - wartość liczby pi
sqrt() - pierwiastek kwadratowy podanej liczby
*/

-- PRACA DOMOWA
-- Zadanie 1
select kl_id, kl_nazwa, concat(upper(left(kl_kontakt, 2)), upper(left(kl_miasto, 3))) as login
from klienci;

-- Zadanie 2
select zam_numer, zam_data
from zamowienia
where year(zam_data) = 2012
order by zam_data;