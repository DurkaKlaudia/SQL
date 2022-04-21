-- FILTROWANIE ZA POMOCĄ ZNAKÓW WIELOZNACZNYCH

SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_nazwa 
LIKE 'rybka%';

SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_nazwa 
LIKE '%szmacianka%';

SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_nazwa 
LIKE 'p%m';

-- ZNAK WIELOZNACZNY _
-- oznacza on dokładnie jedno wystąpenie dowolnego znaku, można stosować go kilka razy obok siebie jak w przykładzie poniżej
SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_nazwa LIKE 
'Pluszowy miś __ cm';

/* polecenie poniżej daje dokładnie ten sam wynik co wyżej, ale nie byłoby tak gdyby w bazie występowały misie o długości 
		której nie dałoby się zapisać dwoma cyframi */
SELECT prod_id, prod_nazwa 
FROM produkty 
WHERE prod_nazwa 
LIKE 'Pluszowy miś % cm';

-- ZNAK WIELOZNACZY []
-- niestety MySQL go nie obsługuje - Microsoft SQL Server już tak, dlatego też poniższe polecenie nie zadziała
-- polecenie ma za zadanie wyszukac wszystkie kontakty zaczynajace sie na litere j lub m
select kl_kontakt 
from klienci 
where kl_kontakt 
like '[jm]%' order by kl_kontakt; 

-- negacja polecenia powyzej w dwóch formach:
-- oznacza ze zostana wyszukani wszystkie kontakty poza tymi zaczynajacymi sie na j lub m
select kl_kontakt 
from klienci 
where kl_kontakt 
like '[^jm]%' 
order by kl_kontakt; 

select kl_kontakt 
from klienci 
where not kl_kontakt 
like '[jm]%' 
order by kl_kontakt; 

-- PRACA DOMOWA
-- Zadanie 1
SELECT prod_nazwa, prod_opis 
FROM produkty 
WHERE prod_nazwa 
like '%szmacianka%';

-- Zadanie 2
SELECT prod_nazwa, prod_opis 
FROM produkty 
WHERE NOT prod_nazwa 
like '%szmacianka%' 
ORDER BY prod_nazwa;

-- Zadanie 3
SELECT prod_nazwa, prod_opis 
FROM produkty 
WHERE prod_opis 
like '%szmacianka%' and prod_opis 
like '%rybka%';

-- Zadanie 4
SELECT prod_nazwa, prod_opis 
FROM produkty 
WHERE prod_opis 
like '%rybka%szmacianka%';