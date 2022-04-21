-- POBIERANIE DANYCH

SELECT prod_nazwa 
FROM produkty;

SELECT prod_id, prod_nazwa, prod_cena 
FROM produkty;

SELECT * 
FROM produkty;

SELECT dost_id 
FROM produkty;

/* słowo kluczowe DISTINCT pokazuje tylko pojedyncze wystąpienia sortowanych danych (id dostawców powtarzało się) */
SELECT DISTINCT dost_id 
FROM produkty; 

/* słowo kluczowe DISTINCT sortuje po wszytskich kolumnach, a nie tylko to tej przed którą słowo zostało postawione. */
SELECT DISTINCT dost_id, prod_cena 
FROM produkty;

SELECT dost_id, prod_cena 
FROM produkty;

/* słowo kluczowe LIMIT 5 informuje SZBD że ma pobrać nie więcej jak 5 wierszy */
SELECT prod_nazwa 
FROM produkty 
LIMIT 5;

/* aby pobrać 5 następnych wierszy, należy wskazać zarówno liczbę wierszy jak i miejsce rozpoczęcia pobierania. 
w przykładzie poniżej pobierze nam tylko 4 produkty, ponieważ łącznie produktów mamy tylko 9  */
SELECT prod_nazwa 
FROM produkty 
LIMIT 5 OFFSET 5;

/* UWAGA pierwszy zwracany wiersz ma numer 0, a nie 1. Zatem polecenie LIMIT 1 OFFSET 1 zwróci nam drugi wiersz */
SELECT prod_nazwa 
FROM produkty 
LIMIT 1 OFFSET 1;

/* UWAGA istenieje skrócona wersja polecenia LIMIT 4 OFFSET 3 --> LIMIT 3,4 --> KOLEJNOŚĆ JEST ODWRÓCONA! */
SELECT prod_nazwa 
FROM produkty 
LIMIT 3, 4;

-- PRACA DOMOWA
-- Zadanie 1
SELECT kl_id 
FROM klienci;

-- Zadanie 2
SELECT DISTINCT prod_id 
FROM elementyzamowienia;

-- Zadanie 3
SELECT * 
FROM klienci;

SELECT kl_id 
FROM klienci;