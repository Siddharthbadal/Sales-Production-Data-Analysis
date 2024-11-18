-- total rows in each table
SELECT 
    TABLE_NAME, 
    TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'adventureworks';

-- all the rows in database 
SELECT SUM(TABLE_ROWS) 
     FROM INFORMATION_SCHEMA.TABLES 
     WHERE TABLE_SCHEMA = 'adventureworks';

-- complete details of table     
show table status;

-- tables and total columns 
   SELECT table_name, count(*) AS number_of_columns FROM information_schema.columns
   WHERE TABLE_SCHEMA = 'adventureworks' group by table_name;

select * FROM information_schema.columns
WHERE TABLE_SCHEMA = 'adventureworks';

-- 
select TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
FROM information_schema.columns
WHERE TABLE_SCHEMA = 'adventureworks';