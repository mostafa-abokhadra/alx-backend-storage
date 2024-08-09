""" 
    Indexing:

    https://www.youtube.com/watch?v=lYh6LrSIDvY
    https://www.youtube.com/watch?v=YuRO9-rOgv4
    Indexes are used to find rows with specific column values quickly.
    Without an index, MySQL must begin with the first row and then read
    through the entire table to find the relevant rows. The larger the table,
    the more this costs. If the table has an index for the columns in question,
    MySQL can quickly determine the position to seek to in the middle of the
    data file without having to look at all the data. This is much faster than 
    searching every row sequentially.
"""

"""to list the existing indexes in a table"""
show INDEX from table_name
"""
    creating indexes:

    Index creation has a simple syntax.
    The difficulty is in determining what columns need indexing and whether enforcing uniqueness is necessary.
    Below we will illustrate how to create indexes with and without a PRIMARY KEY and UNIQUE constraints.
    tables can have multiple indexes. Multiple indexing is useful for creating indexes attuned to
    the queries required by your application or website. The default settings allow for up to 16 indexes per table,
    increase this number but is generally more than is necessary. Indexes can be created during a table's
    creation or added on to the table as additional indexes later on. We will go over both methods below.
"""
CREATE TABLE table_name (
	ID INT PRIMARY KEY UNIQUE,
	INDEX (ID)
)
"""to add index to existing table"""
create index index_name on table_name(ID)
create unique index index_name on tableName(columnONe, columnTwo)
CREATE INDEX idx_lastname ON Persons (LastName);
"""
If you want to create an index on a combination of columns,
you can list the column names within the parentheses, separated by commas:
"""
CREATE INDEX idx_pname ON Persons (LastName, FirstName);

"""drop index"""
drop index index_name on table_name """or"""
ALTER TABLE table_name DROP INDEX index_name;