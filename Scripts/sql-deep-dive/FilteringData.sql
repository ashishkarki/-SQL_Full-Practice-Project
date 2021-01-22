SELECT
	COUNT(CUSTOMERID)
FROM
	public.customers c
WHERE
	c.GENDER = 'F'
	AND (c.STATE = 'NY'
	OR c.STATE = 'OR');