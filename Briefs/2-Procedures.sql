"""
    procedures:

    -A procedure (often called a stored procedure) is a subroutine like a subprogram in a regular computing language,
    stored in database, A procedure has a name, a parameter list, and SQL statement(s).
    -All most all relational database system supports stored procedure, MySQL 5.6 supports (routines)
    and there are two kinds of routines:
        1-stored procedures which you call, or
        2-functions whose return values you use in other SQL statements the same way that you use
        pre-installed MySQL functions like pi().
    -The major difference is that UDFs can be used like any other expression within SQL statements,
    whereas stored procedures "must be invoked using the CALL statement".
    -CREATE PROCEDURE and CREATE FUNCTION require the "CREATE ROUTINE privilege".
    -They might also require the SUPER privilege, If binary logging is enabled,
    -CREATE FUNCTION might require the SUPER privilege.
    -By default, MySQL automatically grants the ALTER ROUTINE and EXECUTE privileges to the routine creator.
    This behavior can be changed by disabling the automatic_sp_privileges system variable.

    -pick a delimeter: The delimiter is the character or string of characters which is used to complete an SQL
    statement. By default we use semicolon (;) as a delimiter. But this causes problem in stored procedure because
    a procedure can have many statements, and everyone must end with a semicolon.
    -So for your delimiter, pick a string which is rarely occur within statement or within procedure.
    Here we have used double dollar sign i.e. $$. You can use whatever you want.
    To resume using ; as a delimiter later, say "DELIMITER ; $$"
"""
DELIMITER $$ ;
CREATE PROCEDURE job_data()
-> SELECT * FROM JOBS; $$

CALL JOB_DATA();
"""
    -CREATE PROCEDURE command creates the stored procedure.  
    -Next part is the "procedure name". Here the procedure name is job_data.  
    -Procedure names are not case sensitive, so job_data and JOB_DATA are same.  
    -You cannot use two procedures with the same name in the same database.  
    -You can use qualified names of the form "database-name.procedure-name", for example hr.job_data.  
    -Procedure names can be delimited. If the name is delimited, it can contain spaces.  
    -The maximum name length is 64 characters.  
    -Avoid using names of built-in MySQL functions.  
    -The last part of CREATE PROCEDURE is a pair of parentheses. () holds the parameter(s) list as
    there are no parameters in this procedure, the parameter list is empty.  
    -Next part is SELECT * FROM JOBS; `$$` which is the last statement of the procedure body.
    Here the semicolon (;) is optional as `$$` is a real statement-ender.
    -Stored procedures which do not accept arguments can be invoked without parentheses.
    Therefore CALL job_data() and CALL job_data are equivalent
"""

COMMENT 'string'      
LANGUAGE SQL      
NOT DETERMINISTIC      
CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA     
SQL SECURITY  DEFINER | INVOKER 
"""
    -There are some clauses in CREATE PROCEDURE syntax which describe the characteristics of the procedure.
    The clauses come after the parentheses, but before the body. These clauses are all optional.
    Here are the clauses: -
    -COMMENT characteristic is a MySQL extension. It is used to describe the stored routine and the information
    is displayed by the "SHOW CREATE PROCEDURE statements".
    -LANGUAGE: The LANGUAGE characteristic indicates that the body of the procedure is written in sql
    -NOT DETERMINISTIC: NOT DETERMINISTIC, is informational, a routine is considered deterministic 
    if it always produces the same result for the same input parameters, and not deterministic otherwise.
    -CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA
        -CONTAINS SQL: CONTAINS SQL means there are no statements that read or write data,
        in the routine. For example statements SET @x = 1 or DO RELEASE_LOCK('abc'),
        which execute but neither read nor write data. This is the default if none of these
        characteristics is given explicitly.
        - NO SQL: means routine contains no SQL statements.
        -READS SQL DATA: means the routine contains statements that read data (for example, SELECT),
        but not statements that write data.
        -MODIFIES SQL DATA: means routine contains statements that may write data (for example, INSERT or DELETE).
    -SQL SECURITY DEFINER | INVOKER:  SQL SECURITY, can be defined as either SQL SECURITY DEFINER or
    SQL SECURITY INVOKER to specify the security context; that is, whether the routine executes using the
    privileges of the account named in the routine DEFINER clause or the user who invokes it.
    This account must have permission to access the database with which the routine is associated.
    The default value is DEFINER. The user who invokes the routine must have the EXECUTE privilege for it,
    as must the DEFINER account if the routine executes in definer security context.
    -All the above characteristics clauses have defaults.
"""
CREATE PROCEDURE job_data()
SELECT * FROM JOBS; $$
"""is the same as"""
CREATE PROCEDURE new_job_data()
-> COMMENT ''
-> LANGUAGE SQL
-> NOT DETERMINISTIC
-> CONTAINS SQL
-> SQL SECURITY DEFINER
-> SELECT * FROM JOBS;
-> $$