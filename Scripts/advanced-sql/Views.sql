-- is the storage of results of a previous query
-- there are two types of views: materialized and non-materialized
-- (a) materialized view: stores the resultant data physically and 
-- periodically updates it when tables change
-- (b) non-materialized view: doesn't store the result of the query and 
-- that query gets re-run each time the view is called on

-- creating a view
-- create view <view_name> as <query>;

-- updating a view
-- create or replace <view_name> as <query>;

-- rename a view
-- alter view <view_name> rename to <new_view_name>;

-- deleting a view
-- drop view [if exists] <view_name>

-- find the last salary change of each employee into a view
create or replace view last_sal_change as
select
	e.emp_no,
	max(s.from_date) --as "last salary change date"
from salaries s
join employees e using(emp_no)
join dept_emp de using(emp_no)
join departments d using(dept_no)
group by e.emp_no
order by e.emp_no;

-- change the name of max salary change column
alter view last_sal_change rename column max to "last salary change date";

-- now query this view: get same info back
select * from last_sal_change; 

-- join with salaries table to find latest/current salary
select 
	s.emp_no,
	s.salary,
	s.from_date,
	s.to_date 
from salaries s 
join last_sal_change as lsc using (emp_no)
where s.from_date = lsc."last salary change date"
order by s.emp_no 
