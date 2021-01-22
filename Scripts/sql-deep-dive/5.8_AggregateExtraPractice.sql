
-- What is the average salary for the company?
 select
	avg(salary) as "Avg. Salary"
from
	public.salaries;

-- What year was the youngest person born in the company?
select min(birth_date) as "Youngest Person" from employees e; 