-- ZAAWANSOWANIE FILTOROWANIE DANYCH

SELECT prod_id, prod_cena, prod_nazwa 
FROM produkty 
WHERE dost_id = 'DLL01' AND prod_cena <= 10;

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE dost_id = 'DLL01' OR dost_id = 'BRS01';

/* poniższe polecenia różnią się dodaniem nawiasu, który całkowicie zmienia nam wynik filtrowania
bez nawiasów "pierwszeństwo" ma operator AND więc inaczej interpretuje polecenie */
SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE dost_id = 'DLL01' OR dost_id = 'BRS01' AND prod_cena >= 50;

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE (dost_id = 'DLL01' OR dost_id = 'BRS01') AND prod_cena >= 50;

-- te dwa polecenia są równorzędne - dają taki sam wynik 
SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE dost_id = 'DLL01' OR dost_id = 'BRS01' 
ORDER BY prod_nazwa;

SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE dost_id IN ('DLL01', 'BRS01') 
ORDER BY prod_nazwa;

-- wszytskie 3 poniższe polecenia są równorzędne - dają taki sam wynik
SELECT prod_nazwa 
FROM produkty 
WHERE NOT dost_id = 'DLL01' 
ORDER BY prod_nazwa;

SELECT prod_nazwa 
FROM produkty 
WHERE dost_id != 'DLL01' 
ORDER BY prod_nazwa;

SELECT prod_nazwa 
FROM produkty 
WHERE dost_id <> 'DLL01' 
ORDER BY prod_nazwa;

-- PRACA DOMOWA
-- Zadanie 1
SELECT dost_nazwa 
FROM dostawcy 
WHERE dost_kraj = 'Polska' AND dost_woj = 'MAZ';

-- Zadanie 2
SELECT zam_numer, prod_id, ilosc 
FROM elementyzamowienia 
WHERE ilosc >= 100 AND prod_id IN ('BR01', 'BR02', 'BR03') 
ORDER BY prod_id, ilosc;

SELECT zam_numer, prod_id, ilosc 
FROM elementyzamowienia 
WHERE ilosc >= 100 AND (prod_id ='BR01' OR prod_id = 'BR02' OR prod_id = 'BR03') 
ORDER BY prod_id, ilosc;
        
-- Zadanie 3
SELECT prod_nazwa, prod_cena 
FROM produkty 
WHERE prod_cena >= 20 AND prod_cena <= 40 
ORDER BY prod_cena;