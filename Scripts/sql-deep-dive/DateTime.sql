-- get current date
SELECT now()::date;
SELECT CURRENT_DATE;

-- format date
SELECT to_char( CURRENT_DATE, 'mm/dd/yyyy' ) AS "Date in mm/dd/yyyy";

-- date difference: subtraction returns the difference in terms of days and some hours, minutes...
select now() - '2010/01/20';

-- cast a string to date
select date '2010/01/20';

-- get age from a Date (not string but a date type)
 select age(date '2010/01/20'); 
 select age(date '2010-01-20');

-- find age between two dates
select age(now()::date , date '2010/01/20') 

-- extract day/month... from a date
select extract(day from date '2010/01/20') as "day-part";
select extract(month from date '2010/01/20') as "month-part";

-- round a date
select date_trunc('year', date '2010/02/20')  as "nearest year"; -- truncate to first month, first day of that year
select date_trunc('month', date '2010/02/20')  as "nearest month"; -- truncate to first day of that month 

-- Interval: find all orders at most 30 days before today
select * from orders
where purchaseDate <= now() - interval '30 days'; -- interval can be years, months, days, hours, minutes

-- these intervals can be added or subtracted to other dates
select interval '2 years 3 months 4 days';
select interval '2 weeks ago';
select interval '1 years 5 hours 30 minutes';
select interval '1 years 5 hours 30 minutes ago';

/*
* Question: Get me all the employees above 60, use the appropriate date functions
*/
select emp_no , concat(first_name, ' ', last_name), birth_date, 
extract(year from age(birth_date)) as "age (in years)"
from employees
where extract(year from age(birth_date)) > 60;

/*
* Question: How many employees where hired in February?
*/
SELECT count(emp_no) as "employees where hired in February" FROM employees where extract (month from hire_date) = 2;

/*
* Question: How many employees were born in november?
*/
SELECT count(emp_no) as "num employees born in nov." FROM employees where extract(month from birth_date) = 11;

/*
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/
select 
-- emp_no , 
--concat(first_name, ' ', last_name) as "employee full name", 
max(age(birth_date)) as "max age"
from employees e;
--group by emp_no
--limit 1;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/
SELECT count(orderid) FROM orders where date_trunc('month', orderdate) = '2004-01-01' ;