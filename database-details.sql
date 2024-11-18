-- retrive all database
select SCHEMA_NAME
FROM information_schema.SCHEMATA;

show databases;

-- tables from databse
select TABLE_NAME
from information_schema.TABLES
WHERE TABLE_SCHEMA = 'adventureworks'

show tables;

-- all views in the databse
SELECT TABLE_NAME
FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = 'adventureworks';

-- all users 
SELECT DISTINCT
	USER
FROM
	mysql.user
WHERE
	user <> '' order by user;
    
-- all indexes 
SELECT DISTINCT INDEX_NAME
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'adventureworks';

-- constraints 
SELECT DISTINCT
	CONSTRAINT_NAME
FROM
	information_schema.TABLE_CONSTRAINTS
WHERE
	CONSTRAINT_SCHEMA = 'adventureworks';
    

-- all functions 
SELECT
	ROUTINE_NAME
FROM
	information_schema.ROUTINES
WHERE
	ROUTINE_TYPE = 'FUNCTION' and
	ROUTINE_SCHEMA = 'sample';
    
    
-- procedures 
SELECT
	ROUTINE_NAME
FROM
	information_schema.ROUTINES
WHERE
	ROUTINE_TYPE = 'PROCEDURE' and
	ROUTINE_SCHEMA = 'sample'