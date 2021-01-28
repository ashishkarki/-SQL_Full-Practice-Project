-- number the current row within the partition starting from 1 
-- regardless of framing

-- find out where my product is positioned in given category by price
select 
	prod_id 
	, category 
	, price
	, row_number() over(
		partition by category 
		order by price
	) as "position in given category ordered by price"
from 
products p 
--where category = 2
order by "position in given category ordered by price" asc  