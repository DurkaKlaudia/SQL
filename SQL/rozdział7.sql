-- TWORZENIE PÓL OBLICZANYCH
SELECT concat(dost_nazwa, ' (', dost_kraj, ')') 
FROM dostawcy 
ORDER BY dost_nazwa;

SELECT concat(dost_nazwa, ' - ', dost_kraj) 
FROM dostawcy 
ORDER BY dost_nazwa;  

SELECT concat(dost_nazwa, ' ', dost_kraj) 
FROM dostawcy 
ORDER BY dost_nazwa;

-- funkcja RTRIM usuwa zbędne spacje z prawej strony tekstu
-- funkcja LTRIM usuwa zbędne spacje z lewej strony tekstu
-- funkcja TRIM usuwa zbędne spacje z obu stron tekstu
SELECT concat(TRIM(dost_nazwa), ' ', TRIM(dost_kraj)) 
FROM dostawcy 
ORDER BY dost_nazwa;

-- ALIASY (kolumny pochodne) czyli nazwa stworzonej kolumny poprzez połączenie wartości jak wyżej
SELECT concat(dost_nazwa, ' (', dost_kraj, ')') 
AS dost_tytul 
FROM dostawcy 
ORDER BY dost_nazwa;

-- PRZEPROWADZANIE OBLICZEŃ MATEMATYCZNYCH
select prod_id, ilosc, cena_elem
from elementyzamowienia
where zam_numer = 20008;

select prod_id, ilosc, cena_elem, ilosc * cena_elem as wartosc
from elementyzamowienia
where zam_numer = 20008;

-- INNE FUNKCJE SELECT
select 3 * 2;
select trim('     abc     ');
select curdate();