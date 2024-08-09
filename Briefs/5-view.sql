"""
    View is a data object which does not contain any data.
    Contents of the view are the resultant of a base table.
    They are operated just like base table but they don't contain any data of their own.
    The difference between a view and a table is that views are definitions built on top of other tables (or views).
    If data is changed in the underlying table, the same change is reflected in the view.
    A view can be built on top of a single or multiple tables.
"""
"""
The CREATE VIEW statement requires the CREATE VIEW privilege for the view
and some privilege foreach column selected by the SELECT statement
"""
"""
    Following statements create a view. By default, a view is associated with the default database
    (currently used the database). To associate the view with a given database, specify the name as
    database_name.view_name when you create it. Here is the complete syntax :
"""
CREATE
OR REPLACE
ALGORITHM = UNDEFINED | MERGE | TEMPTABLE
DEFINER =  user | CURRENT_USER 
SQL SECURITY DEFINER | INVOKER 
VIEW view_name (column_list)
AS select_statement
WITH CASCADED | LOCAL CHECK OPTION 

"""
    -view_name: view_name is the name of the view. A view always belongs to a database.
    By default, a new view is created in the currently used database. The view name may
    also be used with the database name, as database_name.view_name, but it is unnecessary
    if database_name is the default database.
    -select_statement: The select_statement is a SELECT statement and provides the definition
    of the view. select_statement can select data from base tables or other views.
"""
CREATE VIEW my_v1 AS SELECT * FROM user_details;
"""
    column_list: The column_list part is optional. It provides a list of names for the view's
    columns right after the view name where the names must be unique. "The number of names in
    column_list must be the same as the number of columns retrieved by the SELECT statement".
    If you want to give your view columns a different name, you can do so by adding an [AS name]
    clause in the select list.
"""
CREATE VIEW my_v3 AS SELECT userid AS User_ID, password AS Password, name AS Name  FROM user;
"""
    -OR REPLACE: If the optional OR REPLACE clause is added with CREATE VIEW statement, the CREATE VIEW statement
    replaces an existing view and create a new one. If the view does not exist, CREATE VIEW is the same as CREATE
    OR REPLACE VIEW
    -ALGORITHM : The ALGORITHM clause is optional, it affects how  MySQL processes the view.
    ALGORITHM takes three values: MERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED.
"""
"""
Restrictions on View definition

The SELECT statement cannot contain a subquery in the FROM clause.
The SELECT statement cannot refer to system or user variables.
Within a stored program, the definition cannot refer to program parameters or local variables.
The SELECT statement cannot refer to prepared statement parameters.
Any table or view referred to in the definition must exist.
The definition cannot refer to a TEMPORARY table, and you cannot create a TEMPORARY view.
Any tables named in the view definition must exist at definition time.
You cannot associate a trigger with a view.
Aliases for column names in the SELECT statement are checked against the maximum column length of 64
characters (not the maximum alias length of 256 characters).
"""
"""
    ALTER VIEW statement changes the definition of an existing view.
    The syntax of the statement is similar to CREATE VIEW.
"""
ALTER 
[OR REPLACE]
[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
[DEFINER = { user | CURRENT_USER }]
[SQL SECURITY { DEFINER | INVOKER }]
VIEW view_name [(column_list)]
AS select_statement
[WITH [CASCADED | LOCAL] CHECK OPTION]

"""
    drop a view
"""
DROP VIEW [IF EXISTS]      
view_name [, view_name] ...      
[RESTRICT | CASCADE]

CREATE VIEW view_author 
AS SELECT * 
FROM author 
WHERE country='USA'
"""
    The above  MySQL statement will create a view 'view_author' taking records (for all columns)
    of author table if those records contain the value 'USA' for country column.
"""
CREATE VIEW view_publisher 
AS SELECT pub_name,pub_city,country
FROM publisher	
WHERE (country='USA' AND pub_city='New York')
OR 	(country='India' AND pub_city='Mumbai');

CREATE VIEW view_bookmast
AS SELECT pub_lang, count(*)
FROM book_mast 
GROUP BY pub_lang

CREATE VIEW view_bookmast
AS SELECT pub_lang,count(*) 
FROM book_mast 
GROUP BY pub_lang 	ORDER BY pub_lang;

CREATE VIEW view_bookmast
AS SELECT *
FROM book_mast
WHERE book_name BETWEEN 'A' AND 'G' 
AND no_page IN(165,250,350,400,510);

CREATE VIEW view_author 
AS SELECT *
FROM author
WHERE aut_name  
NOT LIKE 'T%' AND aut_name NOT LIKE 'W%';

"""
    The above  MySQL statement will create a view 'view_author' taking all the records
    of author table if (A)name of the author (aut_name) does not start with 'T' and (B)
    name of the author (aut_name) does not start with 'W'.
"""
CREATE VIEW view_purchase 
AS SELECT invoice_no,book_name,cate_id 
FROM purchase	
WHERE cate_id = (SELECT cate_id FROM book_mast WHERE no_page=201);

CREATE VIEW view_purchase 	
AS SELECT a.cate_id,a.cate_descrip, b.invoice_no,
b.invoice_dt,b.book_name        
FROM category a,purchase b 
WHERE a.cate_id=b.cate_id;