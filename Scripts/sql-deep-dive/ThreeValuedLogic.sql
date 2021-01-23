/*
* Question: adjust the following query to display the null values as "No Address"
*/
 select COALESCE(address2, 'No Address') as "Address-2" from customers;

/*
* Question: Fix the following query to apply proper 3VL
*/
SELECT *
FROM customers
WHERE address2 IS NOT NULL;

/*
* Question: Fix the following query to apply proper 3VL
*/
select coalesce(lastName, 'Empty'), *
from customers
where age is null;