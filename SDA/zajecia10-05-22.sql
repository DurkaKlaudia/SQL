use world;

drop table if exists age_structure;
create table age_structure (
id int auto_increment primary key,
country varchar(50),
young float,
middle float,
old_ppl float);

select * from age_structure;

-- nazwa kraju, rozkład wiekowy, populacja
-- pokaż tylko kraje w których młodzi stanowią więkej niż 30% i populacja > 200 000 000
with 
a as (select * from age_structure),
p as (select Country, Population from population_by_country)
select 
	a.country,
    a.young,
    a.middle,
    a.old_ppl,
    p.population
from a
left join p on a.country = p.country;

with 
a as (select * from age_structure where young > 30),
p as (select Country, population from population_by_country where population > 200000000)
select 
	a.country,
    a.young,
    a.middle,
    a.old_ppl,
    p.population
from a
inner join p on a.country = p.country;

select count(*) from population_by_country;
select count(*) from age_structure;

-- ten sam wynik z uzyciem join
select
	a.country,
    a.young,
    a.middle,
    a.old_ppl,
    p.population 
from age_structure as a
inner join population_by_country as p on a.country = p.country
where young > 30
	and population > 200000000;
    
-- procedury
drop procedure if exists update_country_name;
delimiter //
create procedure update_country_name(
	in old_country_name varchar(50),
    in new_country_name varchar(50))
begin 
	update population_by_country
    set country = new_country_name
    where country = old_country_name;
end //
delimiter ;

-- wywołanie procedury
call update_country_name('China', "China's Republic of People");
select * from population_by_country;

-- tworzymy procedure do zmiany daty na dzisiejsza
alter table population_by_country
add column last_update datetime;

drop procedure if exists update_date;
delimiter //
create procedure update_date (in row_id int)
begin
	update population_by_country
    set last_update = now()
    where id = row_id;
end //
delimiter ;

call update_date(1);
select * from population_by_country;

-- zad 5/1
drop procedure if exists migrant;
delimiter //
create procedure migrant()
begin
	update population_by_country
    set migrants = 
		case 
			when migrants > 0 then 'influx_of_people'
			else 'outflow_of_people'
            end;
end //
delimiter ;

-- zad 5/2
alter table population_by_country
add growth_type varchar(15);

drop procedure if exists update_growth_type;
DELIMITER //
set @average = (select avg(Med_age) from population_by_country);

create procedure update_growth_type()
begin
	update population_by_country
    set growth_type =
		case when Med_age > @average then 'aging'
        else 'gets younger'
        end;
end //
DELIMITER ;

call age_country();
select * from population_by_country;

-- funkcje wbudowane avg, sum, now
delimiter //
create function sum_two_values(s1 int, s2 int)
returns int
deterministic
begin 
	return(s1 + s2);
end //
delimiter ;

select sum_two_values(2,2);
select now();
select curdate();
select curtime();

-- funkcja Hello
delimiter //
create function hello(name varchar(10))
returns varchar(50)
deterministic
begin
	return concat('Hello, ', name, '. Nice to meet you!');
end //
delimiter ;

select hello('Klaudia');

-- funkcja predykcji przyszłej populacji kraju
drop function if exists is_growing;
delimiter $$ 
create function is_growing(country_name varchar(50))
returns char(3) 
deterministic
begin
	set @result = (select case
						when population + (population * yearly_change) > population then 'yes'
                        else 'no'
                        end
					from population_by_country
                    where country = country_name
                    limit 1);
	return(@result);
end $$
delimiter ;

select is_growing('India');
select * from population_by_country;

-- pierwszy Trigger
drop table if exists population_change;
create table population_change(
	id int auto_increment primary key,
    id_pop_by_country int,
    old_population bigint,
    new_population bigint,
    foreign key (id_pop_by_country) references population_by_country(id)
    );
    
select * from population_change;

delimiter $$
create trigger after_update_population
after update 
on population_by_country
for each row 
begin
	if old.population != new.population then
		insert into population_change(id_pop_by_country, old_population, new_population)
        values (old.id, old.population, new.population);
	end if;
end $$
delimiter ;

select * from population_by_country;
select * from population_change;

update population_by_country
set population = 100
where country = 'India';

update population_by_country
set population = population - 100000
where id between 3 and 10;