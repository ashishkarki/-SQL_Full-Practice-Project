
-- How many female customers do we have from the state of Oregon (OR)?
 select
	COUNT(GENDER)
from
	"Store".PUBLIC.CUSTOMERS C
where
	c.GENDER = 'F'
	and c.STATE = 'OR'
	and age > 20;
	
-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
 select
--	concat( firstname, ' ', lastname ) as "Person Name",
--	age,
--	INCOME
count(FIRSTNAME)
from
	customers c
where
	c.AGE > 44
	and INCOME >= 100000; 
	
-- Who between the ages of 30 and 50 has an income of less than 50 000?
 select
	COUNT(FIRSTNAME)
	--	concat( firstname, ' ', lastname ) as "Person Name",
	--	age,
	--	INCOME
	from CUSTOMERS C
where
	(age > 30 and age < 50)
	and INCOME < 50000;
	
-- What is the average income between the ages of 20 and 50?
 select
	avg(income)
from
	customers c
where
	age > 20 and  age < 50;  