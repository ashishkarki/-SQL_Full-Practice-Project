-- drop db
drop database mastery;

-- creating database
create database mastery;

-- creating schema
create schema sub_mastery_1;

-- creating a role
create role readonly with login encrypted password 'readonly';

-- creating user