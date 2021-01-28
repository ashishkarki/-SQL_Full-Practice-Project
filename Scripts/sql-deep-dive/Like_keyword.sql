/*
* Question: Find the age of all employees who's name starts with M.
*/
select concat(first_name, ' ', last_name) , extract (year
from AGE(birth_date)) as "age"
from employees
where first_name ilike 'M%';

-- How many people's name start with A and end with R ?
select count(emp_no) from employees e where first_name ilike 'A%R';

-- Question: How many people's zipcode have a 2 in it?.
 select count(customerid)
from customers c
where zip::text like '%2%'; 

-- * Question: How many people's zipcode start with 2 with the 3rd character being a 1.
-- Expected output: 109 
 select count(customerid)
from customers c
where zip::text like '2_1%'; 


-- Question: Which states have phone numbers starting with 302?
-- Replace null values with "No State"                                                  
 select coalesce(state, 'No State') as "State"
from customers c
where phone::text like '302%'