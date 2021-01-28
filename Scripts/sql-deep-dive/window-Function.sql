-- window function using partition by
select 
	--*,
	-- distinct 
	d.dept_name, 
	avg(salary) over(
		partition by d.dept_name 
	) 
from salaries s
--limit 100 -- limit does work with the window function above
--where salary < 100000 -- where clause works with window fxn
join dept_emp de using(emp_no)
join departments d using(dept_no)

-- window function using order by
select 
	-- distinct 
	emp_no,
	count(salary) over(
		partition by emp_no -- this will cause the order by below to look at only one partition at a time
		order by emp_no -- order by here acts like a cummulative function
	) 
from salaries s 
order by emp_no 

-- find the price of each item and compare each with the cheapest price in that item's category
select 
	prod_id,
	category,
	price, 
	-- now minimum price in each category
	min(price) over(partition by category) as "cheapest in this category"
from products
where category > 8

-- last_value: return a value evaulated against the last row within its partition
select 
	prod_id,
	price,
	category, 
	last_value(price) over(
		partition by category
		order by price
		range between unbounded preceding and unbounded following 
	) 
	as "last/most expensive in this category"
from products p 
-- where category < 2

-- alternate of above
select 
	prod_id,
	price,
	category, 
	max(price) over(
		partition by category
	) 
	as "last/most expensive in this category"
from products p 
where category < 2