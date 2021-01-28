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
