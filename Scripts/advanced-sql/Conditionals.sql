-- CASE statements
-- simple usage
select
	a,
	case 
		when a = 1 then 'one'
		when a = 2 then 'two'
		else 'other'
	end 

-- example: rendering cutom row data
select
	orderid 
	, customerid 
	, case
		when customerid = 1 then 'my first customer'
		else 'not my first customer'
	  end
	, netamount 
from orders 
order by customerid  

-- example Usage in aggregate functions
select 
	sum(netamount) as "normal total"
	, sum(
		case 
			when netamount < 100 then -100
			else netamount 
		end
	) as "artificial returns"
from orders o 

--===============================
---------NULLIF--------------- => return null if lhs = rhs, otherwise return lhs
select nullif(0, 0);
select nullif('abc', 'def'); -- 'abc'
select nullif('abc', null); -- 'abc'

