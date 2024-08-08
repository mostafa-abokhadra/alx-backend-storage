"""mysql cheatsheet"""
https://intranet.alxswe.com/rltoken/8w9di_hk19DIMSBEV3EayQ

"""to check mysql version"""
SELECT VERSION();

"""
    sql key words can be written in upper or lower case and the code will work just fine,
    but the best practice is to write key words in UPPERCASE so you can differentiate between
    other words and mysql key words:
"""
SELECT name, email FROM data_base_name WHERE== id=73

"""
another good syntax is to write the key word in one line and it's attributes in the next line:
"""
SELECT
    name, email
FROM
	data_base_name 
WHERE
	id=73

"""to start, stop or restart, check status of sql service"""
sudo service mysql stop
sudo service mysql start
sudo service mysql restart
sudo service mysql status

-- to change prompt
prompt @; --will change the prompt from mysql> to @

--to log in to sql shell
mysql -u 'root' -p (then you will be asked to write your password "mostafa")

-- DB
CREATE database IF NOT EXISTS dbName;
SHOW databases;
DROP database IF EXISTS dbName;
USE dbName
SHOW tables FROM dbName;

--tables
CREATE TABLE IF NOT EXISTS table_name (
	id INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(256)
);

DESCRIBE table_name; --will show table rows and columns
EXPLAIN table_name --do the same as above
SHOW CREATE TABLE table_name --will show full description of the table
DELETE FROM table_name; -- delete the whole table
TRUNCATE TABLE table_name; --removes all rows from a table, but the table structure and its columns,
                            --constraints, indexes, and so on, remain
ALTER TABLE table_name RENAME TO new_name;
ALTER TABLE table_name RENAME COLUMN old_name To new_name;
ALTER TABLE table_name ADD column_name data_type;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name MODIFY column_name column_data_type;
ALTER TABLE `first_table` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- insertion
INSERT INTO personal_data (name, call_number)
VALUES ('mostafa', '01154199659'), ("name", "0123456789");

-- retrieve
SELECT * FROM personal_data;
SELECT name, call_number, another_attr FROM personl_data;
SELECT id, score FROM table_name order by score;
SELECT score, name FROM second_table ORDER BY score DESC;
--this will show from greatest to smallest, ,you can change DESC= key word to ASC
SELECT score, name FROM table_name WHER score >=10 ORDER BY score DESC;

-- update
update personal_data set name = 'ahmed' where name = 'mostafa';

-- delete row
DELETE FROM personal_data where name = 'ahmed';
-- if you didn't specify where, then every row of the table will be delelted

-- to get the number of rows in your table:
SELECT COUNT(*) FROM personal_data;

-- to get the number of specified value in your table
SELECT COUNT(*) FROM personal_data where name = 'mostafa';

"""
    In database management an aggregate function is a function where the values of multiple rows
    are grouped together as input on certain criteria to form a single value of more significant meaning.
"""
count(), sum(), avg(), min(), max()
SELECT avg(score) FROM second_table;
SELECT sum(sales) FROM table_name;
SELECT score AS nums FROM second_table; --nums will be the name of the results
SELECT MAX(score) AS winner FROM table_name;
SELECT SUM(distinct score) FROM table_name -- here replicated score values will not be summed up
SELECT score, count(score) AS number FROM second_table group by score ORDER BY score DESC;
SELECT score, name FROM second_table WHERE name!='' ORDER BY score DESC;
