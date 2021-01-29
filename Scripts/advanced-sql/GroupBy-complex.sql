-- how many things sold per year, per month per year and per day per month per year
select 
	extract (year from orderdate) as "year",
	extract (month from orderdate) as "month",
	extract (day from orderdate) as "day",
	sum(o.quantity)
from orderlines o
group by
	rollup (
		extract (year from orderdate),
		extract (month from orderdate),
		extract (day from orderdate)
	)
order by
	"year", "month", "day"