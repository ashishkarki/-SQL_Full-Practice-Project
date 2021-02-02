-- ALL COMMANDS BELOW TESTED AND MORE SPECIFIC TO POSTGRES

-- connecting to postgres from cmd line
> psql -U postgres [-d <db-name>]
-- if db-name is not provided, postgres tries to connect to the same
-- DB as the Username provided (in this case a DB named "postgres")

-- get connection info including DB name
> \conninfo

-- show all the schemas
> \dn

-- create new schema
> create schema <schema-name>

-- connect to a DB
> \c <db-name>

-- show all the tables in the connected DB
> \dt

-- There are two general types of DBs: (1) Regular (2) Template
-- TEMPLATE DATABASES: in postgres, there are two template DBs
-- Template0 (creates Template1, NEVER CHANGE IT) and 
-- Template1 (Default template, any change to this template is automatically applied to all new DBs)

-- ROLES IN POSTGRES
-- 1. roles can be at individual or group level
-- 2. one role can grant membership to another role
-- 3. Roles have (a) attributes (like superuser, createdb..) and (b) privileges (like create, update..)

-- view a list of available roles
> \du

-- common data types in postgres
-- 1. Boolean (true/false, 1/0, y/n) 2. Character (char, varchar and text)
-- 3. Numeric (integers (smallint, int, bigint) and floats (float4, float8, decimal))
-- 4. Array (group of elements of Same Type)

