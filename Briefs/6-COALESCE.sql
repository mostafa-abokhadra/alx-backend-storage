"""
    -The COALESCE function in SQL is used to return the first non-null expression among its arguments.
    It allows you to handle NULL values effectively by providing a default value or fallback mechanism
    when a NULL value is encountered.
    -The word coalesce itself means to come together or merge into one body or mass
    -The COALESCE function merges multiple expressions or values into a single result,
    returning the first non-NULL value it encounters. This aligns with its dictionary meaning
    of bringing things together into a unified whole.
"""
syntax
COALESCE(expression1, expression2, ..., expressionN)
"""
    expression1, expression2, ..., expressionN: These are the expressions or values
    that COALESCE evaluates in order. It returns the value of the first expression that is not NULL.
    -COALESCE returns NULL if all its arguments are NULL.
    -It returns the value of the first non-NULL expression found from left to right.
    -Often used to handle cases where a column might contain NULL values that need to be
    replaced with a default or meaningful value.
"""
SELECT COALESCE(column_name, 'Default Value') AS column_alias FROM table_name;
-- In this example, if column_name is NULL, the COALESCE function will return 'Default Value'.
SELECT COALESCE(price, 0) AS price_with_default FROM products;
-- to set default values for calculations or comparisons
SELECT COALESCE(col1, col2, col3, 'No Value') AS first_non_null_value  FROM table_name;
--Can handle multiple columns or expressions to return the first non-NULL value among them.
SELECT name, COALESCE(email, phone, 'No contact information') AS contact_info FROM users;
--If email is NULL but phone is not, COALESCE will return the phone number.
--If both email and phone are NULL, it will return 'No contact information'.

SELECT band_name, COALESCE(split, 2022) - formed as lifespan FROM metal_bands
WHERE style LIKE '%Glam rock%' ORDER BY lifespan DESC;
"""
    COALESCE(split, 2022): COALESCE is a function that returns the first non-null value in a list of arguments.
    In this case: split: It checks if the split column of the band exists and is not null.
    2022: If split is null, it defaults to the year 2022
    formed: This subtracts the formed column (presumably the year the band was formed)
    from the result of COALESCE(split, 2022).
"""