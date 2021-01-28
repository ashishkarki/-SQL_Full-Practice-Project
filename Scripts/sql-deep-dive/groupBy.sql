select dept_no, count(emp_no) 
from dept_emp de
group by dept_no
order by count(emp_no) desc ; 

/*
*  How many people were hired on any given hire date?
*/

select hire_date, count(e.emp_no) as "hires"  
from employees as e
group by hire_date
order by "hires" desc ;

/*
*  Show me all the employees, hired after 1991 and count the amount of positions they've had
*/
--SELECT e.emp_no, concat(first_name, ' ', last_name) as "full name", hire_date
--FROM employees as e
--where hire_date > '1991-12-31'
--order by hire_date 

select emp_no, count(t.title) as "Num positions"
from employees e
inner join titles t
	using (emp_no)
where extract (year from e.hire_date) > 1991
group by e.emp_no
order by e.emp_no

-- Show total orders and then total orders per prod_id
--select NULL as "prod_id", sum(o.quantity) 
--from orderlines o
--
--UNION

select prod_id as "prod_id", sum(o.quantity) 
from orderlines o
group by 
	grouping sets ( -- grouping sets are similar to Union
		(),
		(prod_id)
	)
order by prod_id desc; 
