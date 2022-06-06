select * from crime;
select * from population_by_country;
select * from quality;

-- zad 4a
select * 
from crime
order by safety_index desc
limit 5;

-- zad 4b
select country, quality_of_life_index as quality, safety_index
from quality
order by quality
limit 10;

-- zad 4c
select count(country)
from population_by_country;

select count(country)
from quality;

select count(population_by_country.country) as liczba_krajow_w_dwoch_tabelach 
from population_by_country
inner join quality on quality.country = population_by_country.country; 

-- zad 4d
select country, population, world_share, 
	ROUND((Population/(SELECT SUM(Population) FROM population_by_country)*100),  2 ) as srednia
from population_by_country
where population > 500000;

-- zad 4e
select max(quality_of_life_index), 
		min(quality_of_life_index), 
		round(avg(quality_of_life_index), 2), 
        round(sum(safety_index), 2)
from quality;

-- zad 4f
select * 
from quality
where country like 'P%'
order by health_care_index;

-- zad 4g
select population_by_country.Country, quality.quality_of_life_index
from population_by_country, quality
where population is not null
	and quality_of_life_index is null;

-- zad 4h
select country, crime_index, safety_index, crime_index - safety_index as różnica
from crime
order by różnica
limit 3;

-- zad i
start transaction;
update quality
set quality_of_life = 200
where country = 'China';
commit;

-- zad ii
start transaction;
alter table population_by_country
modify Yearly_change text;

update population_by_country 
set Yearly_change = 
	case when Yearly_change > 0 then 'Positive'
    else 'Negative'
    end;
rollback;

-- zad iii
start transaction;
update population_by_country
set Yearly_change = 
	case 
		when Yearly_change < 0 then 'Negative'
        when Yearly_change = 0 then 'Neutral'
        else 'Positive'
        end;
 savepoint after_change_to_text;
 
 delete from population_by_country
 where Country='China';

 rollback to savepoint after_change_to_text;
commit;

-- zad iv
start transaction;
update crime
set safety_index =
	case 
		when safety_index < 50 then 'Not safe'
        when safety_index = 0 then 'Hard to say'
        else 'Safe'
        end;
savepoint after_change_to_text;

-- zad 3/1
select country, (select avg(density) from population_by_country) < density,
	 (select avg(Med_age) from population_by_country) > 30 as warunki
from population_by_country;

-- zad 3/2
select population_by_country. country, Migrants, urban_pop, crime.safety_index, pollution_index
from population_by_country, crime, quality
where population_by_country.Country = crime.country
	and population_by_country.Country = quality.country;
    
select population_by_country. country, Migrants, urban_pop, crime.safety_index, pollution_index
from population_by_country
inner join quality on population_by_country.Country = quality.country
inner join crime on population_by_country.Country = crime.country;

-- zad 3/3
select round((Land_area), 2), round(avg(Yearly_change), 2), count(Country), 
	 (select round(avg(cost_of_living_index), 2) from quality)
from population_by_country;

-- zad 3/4
select country, population
from population_by_country
where country in(select country
				from quality
                where climate_index > 98);
                
select population_by_country.Country, population
from population_by_country
inner join quality on population_by_country.Country = quality.country
where climate_index > 98;