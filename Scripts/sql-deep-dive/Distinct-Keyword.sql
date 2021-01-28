/*
* Question: What unique titles do we have?
*/
select distinct title as "Distinct Titles"
from titles t;

/*
* Question: How many unique birth dates are there?
*/
SELECT count(distinct  birth_date) FROM employees;

/*
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/
select distinct lifeexpectancy
from "World".public.country c
where lifeexpectancy is not null
order by lifeexpectancy; 
