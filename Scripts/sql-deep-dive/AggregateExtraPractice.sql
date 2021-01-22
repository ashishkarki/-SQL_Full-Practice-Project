
-- What is the average salary for the company?
 SELECT
	avg(salary) AS "Avg. Salary"
FROM
	public.salaries;
-- What year was the youngest person born in the company?
 SELECT
	max(birth_date) AS "Youngest Person"
FROM
	employees e;
-- How many towns are there in france?
 SELECT
	COUNT("name")
FROM
	"France".PUBLIC.TOWNS T;
-- How many official languages are there?
 SELECT
	count("language")
FROM
	"countrylanguage"
WHERE
	ISOFFICIAL = TRUE;
-- What is the average life expectancy in the world?
 SELECT
	AVG(lifeexpectancy)
FROM
	"World".PUBLIC.COUNTRY C;
-- What is the average population for cities in the netherlands?
 SELECT
	AVG(CITY.POPULATION) AS "Netherlands Avg Pop"
FROM
	CITY city
WHERE
	CITY.COUNTRYCODE = (
	SELECT
		CODE
	FROM
		COUNTRY C2
	WHERE
		C2."name" = 'Netherlands')
