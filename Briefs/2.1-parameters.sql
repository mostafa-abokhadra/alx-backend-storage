"""https://www.w3resource.com/mysql/mysql-procedure.php"""

prerequisite
"""
    compound statements

    A compound statement is a block that can contain other blocks; declarations for variables,
    condition handlers, and cursors; and flow control constructs such as loops and conditional tests
    mysql has the following compound statements
    - BEGIN ... END Compound-Statement
    - Statement Label
    - DECLARE
    - Variables in Stored Programs
    - Flow Control Statements
    - Cursors
    - Condition Handling
"""

BEGIN ... END Compound-Statement Syntax
"""
    is used to write compound statements, i.e. when you need more than one statement within stored programs
    e.g. stored procedures, functions, triggers, and events
"""

Declare Statement
"""
    is used to define various items local to a program, for example local variables, conditions and handlers,
    cursors. DECLARE is used only inside a BEGIN ... END compound statement and must be at its start,
    before any other statements. Declarations follow the following order:
    - Cursor declarations must appear before handler declarations.
    - Variable and condition declarations must appear before cursor or handler declarations.
"""

Variables in Stored Programs
"""
    System variables and user-defined variables can be used in stored programs,
    just as they can be used outside stored-program context. Stored programs
    use DECLARE to define local variables, and stored routines (procedures and functions)
    can be declared to take parameters that communicate values between the routine and its caller.
"""

Local variables
"""
    local variables are declared within stored procedures and are only valid within the BEGIN…END block where
    they are declared. Local variables can have any SQL data type
"""

DELIMITER $$
CREATE PROCEDURE my_procedure_Local_Variables()
BEGIN   /* declare local variables */   
    DECLARE a INT DEFAULT 10;   
    DECLARE b, c INT;  /* using the local variables */   
    SET a = a + 100; -- 110  
    SET b = 2;   
    SET c = a + b;   --112 
    BEGIN  /* local variable in nested block */      
        DECLARE c INT;             
        SET c = 5;  /* local variable c takes precedence over the one of the
                        same name declared in the enclosing block. */       
        SELECT a, b, c;   
    END;    
SELECT a, b, c;
END$$
-- Now execute the procedure 
CALL my_procedure_Local_Variables();
+------+------+------+
| a    | b    | c    |
+------+------+------+
|  110 |    2 |    5 |
+------+------+------+
+------+------+------+
| a    | b    | c    |
+------+------+------+
|  110 |    2 |  112 |
+------+------+------+

User variables
"""
    variables that you can define and use within your SQL statements.
    They provide a way to store and manipulate values temporarily during the execution of a query
    User variables are prefixed with the @ symbol followed by the variable name.
    They are assigned values using the SET statement or within a query.
    User variables have session scope. This means they persist until the end of
    the session or until they are explicitly unset.
"""

DELIMITER $$
CREATE PROCEDURE my_procedure_User_Variables()
BEGIN 
    SET @x = 15;
    SET @y = 10;
    SELECT @x, @y, @x-@y;
END$$
-- Now execute the procedure :
CALL my_procedure_User_Variables() ;
+------+------+-------+
| @x   | @y   | @x-@y |
+------+------+-------+
|   15 |   10 |     5 |
+------+------+-------+

-- parameters

CREATE PROCEDURE sp_name () ...  
CREATE PROCEDURE sp_name (IN param_name type)...  
CREATE PROCEDURE sp_name (OUT param_name type)...  
CREATE PROCEDURE sp_name (INOUT param_name type)...
"""
    -In the first example, the parameter list is empty.
    -In the second example an IN parameter passes a value into a procedure.
    The procedure might modify the value, but the modification is not visible to the caller when the procedure returns.   
    -In the third example, an OUT parameter passes a value from the procedure back to the caller.
    Its initial value is NULL within the procedure, and its value is visible to the caller when the procedure returns.
    -In the fourth example, an INOUT parameter is initialized by the caller, can be modified by the procedure,
    and any change made by the procedure is visible to the caller when the procedure returns.
    -In a procedure, each parameter is an IN parameter by default. To specify otherwise for a parameter,
    use the keyword OUT or INOUT before the parameter name.
"""

"""
    In the following procedure, we have used a IN parameter 'var1' (type integer)
    which accept a number from the user. Within the body of the procedure,
    there is a SELECT statement which fetches rows from 'jobs' table and the number of rows
    will be supplied by the user. Here is the procedure :
"""

-- IN
CREATE PROCEDURE my_proc_IN (IN var1 INT)
-> BEGIN
-> SELECT * FROM jobs LIMIT var1;
-> END$$  
CALL my_proc_in(2)$$


"""
    In the body of the procedure, the parameter will get the highest salary from MAX_SALARY column.
    After calling the procedure the word OUT tells the DBMS that the value goes out from the procedure.
    Here highest_salary is the name of the output parameter and we have passed its value to a session
    variable named @M, in the CALL statement.
"""
--OUT
CREATE PROCEDURE my_proc_OUT (OUT highest_salary INT)
-> BEGIN
-> SELECT MAX(MAX_SALARY) INTO highest_salary FROM JOBS;
-> END$$

CALL my_proc_OUT(@M)$$
SELECT @M$$

--INOUT
CREATE PROCEDURE my_proc_INOUT (INOUT mfgender INT, IN emp_gender CHAR(1))
-> BEGIN
-> SELECT COUNT(gender) INTO mfgender FROM user_details WHERE gender = emp_gender;
-> END$$
CALL my_proc_INOUT(@C,'M')$$
SELECT @C$$