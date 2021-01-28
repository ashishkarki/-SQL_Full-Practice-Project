-- is the storage of results of a previous query
-- there are two types of views: materialized and non-materialized
-- (a) materialized view: stores the resultant data physically and 
-- periodically updates it when tables change
-- (b) non-materialized view: doesn't store the result of the query and 
-- that query gets re-run each time the view is called on

-- creating a view
-- create view <view_name> as <query>;

-- updating a view
-- create or replace <view_name> as <query>;

-- rename a view
-- alter view <view_name> rename to <new_view_name>;

-- deleting a view
-- drop view [if exists] <view_name>