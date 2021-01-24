-- know every salary raise and also know which ones were a promotion
select * from titles order by emp_no;
SELECT * from salaries order by emp_no;

select s.emp_no, s.salary, s.from_date , s.to_date , t.title, t.from_date , t.to_date
from salaries s
left join titles t on
s.emp_no = t.emp_no
where (s.from_date = t.from_date - interval '2 days ago')
or (s.from_date = t.from_date)
order by s.emp_no

select
-- count(e.emp_no)
e.emp_no , 
 s.salary,
 t.title 
from employees e
inner join salaries s on e.emp_no = s.emp_no --2844047
left join titles t on e.emp_no = t.emp_no -- 4638507
and (t.from_date = s.from_date + interval '2 days' or t.from_date = s.from_date) -- 77051
--group by e.emp_no 
order by e.emp_no 