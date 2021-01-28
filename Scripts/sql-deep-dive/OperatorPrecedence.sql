-- Select people either under 30 or over 50 with an income above 50000 that are from either Japan or Australia
 select firstname, lastname, age, country, income
from customers
where (age < 30
or age >= 50)
and income > 50000
and (country = 'Australia'
or country = 'Japan');
	
-- What was our total sales in June of 2004 for orders over 100 dollars?
select sum(totalamount)
from orders o
where totalamount > 100 (
and orderdate >= '2004-06-01'
and orderdate <= '2004-06-30'); 