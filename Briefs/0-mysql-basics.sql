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

