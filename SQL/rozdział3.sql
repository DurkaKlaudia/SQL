-- SORTOWANIE POBRANYCH DANYCH

SELECT prod_nazwa 
FROM produkty;

SELECT prod_nazwa 
FROM produkty 
ORDER BY prod_nazwa;

SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
ORDER BY prod_cena, prod_nazwa;
-- polecenie poniżej wykona dokładnie to samo co polecenie wyżej
SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
ORDER BY 2,3;

-- sortowanie odwrotne, czyli Z-A (domyslnie wystepuje sortowanie A-Z), a w naszym przypadku od najdrożej do najtańszej
SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
ORDER BY prod_cena DESC;

-- słowo kluczowe DESC dotyczy tylko kolumny bezpośrednio poprzedzającej. Przykład:
SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
ORDER BY prod_cena DESC, prod_nazwa;

SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
ORDER BY prod_cena DESC, prod_nazwa DESC;

-- PRACA DOMOWA
-- Zadanie 1
SELECT kl_nazwa 
FROM klienci 
ORDER BY kl_nazwa DESC;

SELECT kl_nazwa 
FROM klienci 
ORDER BY 1 DESC;

-- Zadanie 2
SELECT kl_id, zam_numer 
FROM zamowienia 
ORDER BY kl_id, zam_data DESC;

-- Zadanie 3
SELECT ilosc, cena_elem 
FROM elementyzamowienia 
ORDER BY ilosc DESC, cena_elem DESC;

-- Zadanie 4
-- po nazwie "dost_nazwa" nie powinno być przecinka
-- nie występuje "BY" przy poleceniu "ORDER"