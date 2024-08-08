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

JOIN
"""
    it's used to combine data or rows from two tables or more based on common field between them.
    JOIN is a clause used in SQL to link data from one table to another table using one or more data column
    shared between two tables, In other words, we combine data of the two existing tables into one.

    https://tableplus.com/blog/2018/09/a-beginners-guide-to-seven-types-of-sql-joins.html
    https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/
    https://web.csulb.edu/colleges/coe/cecs/dbdesign/dbdesign.php?page=sql/join.php

    it has several types like:
    1-INEER JOIN
        returns only connected rows when there is a matching between both tables 
    2-RIGHT JOIN
        returns each row from the right table even if there is no matching row with the left table,
        if right table has no match with the left table row , it will returns null for all the columns
        in the left table 
    3-LEFT JOIN
        will return each row from the left table even if there is no matching row with the right table,
        if left table row has no match with a right table row it will return null for all the columns in
        the right table
    4-FULL JOIN
        it is combination between right and left joins, it returns every row from the left table and from
        the right table, when they match the rows are connected but when there isn't a match the row is still
        included in the join with nulls from the columns of other table
    5-NATURAL JOIN
"""
SELECT *
FROM martian
INNER JOIN base
ON martian.base_id = base.base_id;


SELECT title, tv_show_genres.genre_id FROM tv_shows
LEFT JOIN tv_show_genres ON id = tv_show_genres.show_id
where tv_show_genres.show_id IS NULL
ORDER BY title, tv_show_genres.genre_id;

SELECT tv_genres.name AS genre, COUNT(tv_show_genres.genre_id) AS number_of_shows FROM tv_genres
INNER JOIN tv_show_genres
ON tv_genres.id = tv_show_genres.genre_id
GROUP BY tv_show_genres.genre_id
ORDER BY number_of_shows DESC;

select s_name, score, status, address_city, email_id, accomplishments from students
inner join marks on s.s_id = m.s_id inner join details d on  d.school_id = m.school_id;

-- create Users
CREATE USER 'user_account'@'hostname' IDENTIFIED BY 'password';
--to allow user account to connect to the database server from any host use '%'
CREATE USER 'username'@'%' IDENTIFIED BY 'password';
DROP 'USER'@'host'; -- delete a user
-- -you can create multiple user with a single create user statement ,
-- and delete multiple users with one drop statement, just separate them with comma
-- user() function returns current user name with it's host name used to connect to the server
SELECT USER();
--to change user pass word
ALTER USER 'username'@'hostname' IDENTIFIED BY 'new_pass';