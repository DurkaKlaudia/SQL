-- FILTORWANIE DANYCH

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena = 9.99;

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena < 30;

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena <= 30;

-- operatory <> oraz != są równoznacze, obydwa polecenia zwrócą ten sam wynik
SELECT dost_id, prod_nazwa 
FROM produkty 
WHERE dost_id <> 'DLL01';

SELECT dost_id, prod_nazwa 
FROM produkty 
WHERE dost_id != 'DLL01';

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena BETWEEN 10 AND 30;

SELECT prod_nazwa 
FROM klienci 
WHERE prod_cena IS NULL;

SELECT kl_nazwa 
FROM klienci 
where kl_email IS NULL;

-- PRACA DOMOWA
-- Zadanie 1
SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_cena = 12.99;

-- Zadanie 2
SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_cena >= 15;

-- Zadanie 3
SELECT DISTINCT zam_numer 
FROM elementyzamowienia 
WHERE ilosc >= 100;

-- Zadanie 4
SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena BETWEEN 20 AND 40 
ORDER BY prod_cena;