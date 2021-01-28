-- Indexs spped up querying but slow down inserts and updates a bit
-- types of indexes:
-- 1. single-column 2. multi-column 3. unique (like using a primary key column)
-- 4. partial 5. implicit (those created by the DBMS automatically)

-- Creating Index
--create [unique] index <index_name>
--on <table_name> (col1, col2, ...)

-- drop/delete index
-- drop index <index_name>

-- when to index
-- 1. Always index Foreign Keys
-- 2. Always index Primary Keys and Unique columns
-- 3. Index on columns that end up a lot in 
--          "the Order By or Where clauses"

-- 1. before indexing
explain analyze 
select 
 "name", district, countrycode 
from city c 
where countrycode  in ('TUN', 'BE', 'NL');

-- 2. creating index on countrycode column
create index idx_countrycode
on city (countrycode);