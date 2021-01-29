-- Correlated subquery: subquery has reference to outer query
select 
 emp_no, salary, from_date 
from salaries s
where from_date = (
	select max(s2.from_date) as max_date
	from salaries s2 
	where s2.emp_no = s.emp_no 
)
order by emp_no 

-- Question: show all employees older than the avg. age
select 
	emp_no,
	concat(first_name, ' ', last_name), 
	extract(year from age(e.birth_date)) as "age" 
from employees e 
where
	extract(year from age(e.birth_date)) >
	(select 
		avg(extract(year from age(birth_date))) as "avg age"
	from employees e)
	
-- question: show the title by salary for each employee
select 
	emp_no,
	salary,
	from_date,
	(select 
		coalesce(title, 'no title change') as title
		from titles t 
		where
			t.emp_no = s.emp_no and
			t.from_date = s.from_date 
	)
from salaries s
order by emp_no 

-- question: show the most recent employee salary
--create index idx_from_date
--on salaries (from_date)

explain analyze -- Execution Time: 5840.955 ms
select 
	emp_no ,
	salary as "most recent salary", 
	from_date
from salaries s
where from_date = (
		select max(from_date)
		from salaries s2 
		where s.emp_no = s2.emp_no 
	)
order by emp_no

-- faster option of above
--explain analyse 
select 
	emp_no ,
	salary as "most recent salary", 
	from_date
from salaries s
join (
		select emp_no, max(from_date) as "max"
		from salaries s2 
		group by emp_no 
	) as ls using(emp_no)
where ls.max = s.from_date 

-- subquery operators: exists, any, some, all, in, single-value
-- any example
select prod_id
from products
where category = ANY (
	select 
	 category 
	from categories
	where categoryname in ('Comedy', 'Family', 'Classics')
)

-- all example
select 
	*
from products
join inventory i using (prod_id)
where i.sales > ALL ( 
-- each i.sales should be > every avg. sales from subquery
	select -- returns one row for each category 
		avg(sales) 
	from inventory i2 
	join products p using (prod_id)
	group by p.category 
);

/*
* Question: Get all orders from customers who live in Ohio (OH), 
* New York (NY) or Oregon (OR) state ordered by orderid
*/
-- 1. using joins first
explain analyze -- Execution Time: 5.049 ms
select 
	o.orderdate, o.customerid, o.totalamount 
from orders o
join customers c on c.customerid = o.customerid
where c.state in ('OH', 'NY', 'OR')

-- 2. using subquery
explain analyze -- Execution Time: 9.958 ms
select 
	o.orderdate, o.customerid, o.totalamount 
from orders o
where o.customerid in (
	select customerid 
	from customers c
	where c.state in ('OH', 'NY', 'OR')
)

explain analyze -- Execution Time: 4.640 ms
SELECT c.firstname, c.lastname, o.orderid 
FROM orders AS o, (
    SELECT customerid, state, firstname, lastname
    FROM customers
) AS c
WHERE  o.customerid = c.customerid AND 
c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
-- using joins
explain analyze -- Execution Time: 113.514 ms
select 
	e.emp_no,
	concat(first_name, ' ', last_name) as "employee name",
	--d.dept_name,
	dm.emp_no as "manager id"
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join dept_manager dm on de.dept_no = dm.dept_no 
where dm.emp_no = 110183
order by e.emp_no ; 

-- alternative using subquery
explain analyze -- Execution Time: 60.498 ms
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM dept_manager
        WHERE emp_no = 110183
    )
)
ORDER BY emp_no