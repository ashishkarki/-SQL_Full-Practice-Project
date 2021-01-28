-- SELECT
--   *
-- FROM
--   employees ;

-- SELECT count( * ) as numDepts from "public"."departments";

-- SELECT
-- 	emp_no, count( emp_no ) - 1 AS raises
-- FROM "public"."salaries"
-- WHERE emp_no = 10001
-- GROUP BY emp_no;

-- SELECT
-- 	*
-- FROM "public"."employees";

SELECT
  emp_no AS "employee number",
  title
FROM
  "public"."titles"
WHERE emp_no = 10006;