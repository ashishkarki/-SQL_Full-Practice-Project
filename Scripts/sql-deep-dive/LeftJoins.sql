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
 coalesce(t.title, 'No title, Only salary Changed.') as "title"
, coalesce(t.from_date::text, '-') as "title taken on"
from employees e
inner join salaries s on e.emp_no = s.emp_no --2844047
left join titles t on e.emp_no = t.emp_no -- 4638507
and (t.from_date = s.from_date + interval '2 days' or t.from_date = s.from_date) -- 77051
--group by e.emp_no 
order by e.emp_no 

/*
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
select o.customerid, concat(c.firstname, ' ', c.lastname) , o.orderid 
from "Store".public.orders o
inner join customers c using(customerid)
where c.state in ('OH', 'NY', 'OR')
order by o.orderid;

/*
* Question: Show me the inventory for each product
*/
select p.prod_id, p.title, i.quan_in_stock from products p 
inner join inventory i using(prod_id)

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
select e.emp_no, concat(e.first_name, ' ', e.last_name) as "full name", d2.dept_name 
from "Employees".public.employees e 
inner join dept_emp de on e.emp_no = de.emp_no  
inner join departments d2 on de.dept_no = d2.dept_no; 


 