-- drop db
drop database mastery;

-- creating database
create database mastery;

-- creating schema
create schema sub_mastery_1;

-- creating a role
create role readonly with login encrypted password 'readonly';

-- creating user
create user test_user_with_login with encrypted password 'password';

-- Granting Privileges
grant all privileges on <table-name> to <user>;
grant all on all tables [in schema <schema-name>] to <user>;
grant [select, update, insert, ...] on <table> 
	[in schema <schema-name>] to <user>;