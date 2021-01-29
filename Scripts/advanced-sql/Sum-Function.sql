-- how much cumulatively has a customer ordered from our store
select
	orderid
	, customerid 
	, netamount 
	, sum(customerid) over(
		partition by customerid
		order by orderid -- order by within over() causes cumulative sum to happen
	) as "cumulative sum"
from orders o
where customerid = 13
order by customerid 