drop database world;
create database world;

use world;

drop table if exists population_by_country;
create table population_by_country(
	id int auto_increment primary key,
	Country varchar(50), 
	Population bigint,
	Yearly_change float,
	Net_change bigint,
	Density int, 
	Land_area bigint, 
	Migrants bigint, 
	Fert_rate float, 
	Med_age int, 
	Urban_pop float, 
	World_share float);
    
    select * from population_by_country
    order by Country
    limit 10;
    
    select * from population_by_country
    where Country like 'Z%'
    union
    select * from population_by_country
    where Country like 'S%';
    
create table quality(
	id int auto_increment primary key,
    country varchar(50),
    quality_of_life_index float,
    purchasing_power_index float,
    safety_index float,
    health_care_index float,
    cost_of_living_index float,
    property_price_to_income_ratio float,
    traffic_commute_time_index float,
    pollution_index float,
    climate_index float);
    
select * from quality;

create table crime(
id int auto_increment primary key,
country varchar(50), 
crime_index float, 
safety_index float);

select * from crime;

select * from crime
order by safety_index desc
limit 5;

select country, quality_of_life_index as Quality, purchasing_power_index 
from quality
order by quality_of_life_index
limit 10;

select * from population_by_country;

select count(country) 
from population_by_country;

select count(country) 
from quality;

select count(population_by_country.country) + count(quality.country) 
from population_by_country, quality
where population_by_country.Country = quality.country;

-- UNION - złącz - wszystkie kolumny muszą być tego samego typu 
SELECT * FROM population_by_country 
WHERE Country LIKE 'Z%'
UNION
SELECT * FROM population_by_country
WHERE Country LIKE 'S%';
​
-- Transakcje 
SELECT @@AUTOCOMMIT;
SELECT @@basedir;
SELECT @@hostname;
​
SET @@AUTOCOMMIT = 0;
​
-- Nie zacommitowane transakcje zostaną utracone w przypadku zamknięcia połączenia do bazy danych
-- START TRANSACTION;
-- DELETE FROM population_by_country 
-- WHERE id >230;
​
SELECT  * FROM population_by_country;
​
USE world;
SELECT * FROM population_by_country 
WHERE id > 230;
-- Transakcja 1
START TRANSACTION;
UPDATE population_by_country
SET Population = 100
WHERE Country = 'China';