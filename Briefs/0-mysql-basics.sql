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
                            
-- insertion
INSERT INTO personal_data (name, call_number)
VALUES ('mostafa', '01154199659'), ("name", "0123456789");

-- retrieve
SELECT * FROM personal_data;

-- update
update personal_data set name = 'ahmed' where name = 'mostafa';

-- delete row
DELETE FROM personal_data where name = 'ahmed';
-- if you didn't specify where, then every row of the table will be delelted