-- how many customers aren't 55 years in age
 SELECT
	COUNT(AGE)
FROM
	"Store".PUBLIC.CUSTOMERS C
WHERE
	NOT c.AGE = 55
	AND NOT AGE = 20;