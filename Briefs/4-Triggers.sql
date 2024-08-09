https://www.w3resource.com/mysql/mysql-triggers.php
"""
    A trigger is a set of actions that are run automatically when a specified change operation
    (INSERT, UPDATE, or DELETE statement) is performed on a specified table.
    Triggers are useful for tasks such as enforcing business rules, validating input data,
    and keeping an audit trail.
"""
"""
    A trigger is a named database object that is associated with a table,
    and it activates when a particular event (e.g. an insert, update or delete)
    occurs for the table. The statement CREATE TRIGGER creates a new trigger in MySQL.
"""
syntax

CREATE     
DEFINER = user | CURRENT_USER     
TRIGGER trigger_name     
trigger_time trigger_event     
ON tbl_name FOR EACH ROW     
trigger_body
trigger_time: BEFORE | AFTER 
trigger_event: INSERT | UPDATE | DELETE 

"""
trigger_name:
    All triggers must have unique names within a schema.
    Triggers in different schemas can have the same name.
trigger_time:
    is the trigger action time. It can be BEFORE or AFTER to indicate that
    the trigger activates before or after each row to be modified.
trigger_event:
    trigger_event indicates the kind of operation that activates the trigger.
    These trigger_event values are permitted:
        -The trigger activates whenever a new row is inserted into the table;
        for example, through INSERT, LOAD DATA, and REPLACE statements.
        -The trigger activates whenever a row is modified; for example, through UPDATE statements.
        -The trigger activates whenever a row is deleted from the table; for example,
        through DELETE and REPLACE statements.
        DROP TABLE and TRUNCATE TABLE statements on the table do not activate this trigger,
        because they do not use DELETE, Dropping a partition does not activate DELETE triggers, either.
tbl_name:
    The trigger becomes associated with the table named tbl_name,
    which must refer to a permanent table. You cannot associate a
    trigger with a TEMPORARY table or a view.
trigger_body:
    trigger_body is the statement to execute when the trigger activates.
    To execute multiple statements, use the BEGIN ... END compound statement construct.
    This also enables you to use the same statements that are permissible within stored routines.
"""
CREATE TRIGGER ins_sum BEFORE INSERT ON account
-> FOR EACH ROW SET @sum = @sum + NEW.amount;
"""
    In the above example, there is new keyword 'NEW' which is a  MySQL extension to triggers.
    There is two MySQL extension to triggers 'OLD' and 'NEW'. OLD and NEW are not case sensitive.
    Within the trigger body, the OLD and NEW keywords enable you to access columns in the rows affected by a trigger
    -In an INSERT trigger, only NEW.col_name can be used.
    -In a UPDATE trigger, you can use OLD.col_name to refer to the columns of a row before it is updated
    and NEW.col_name to refer to the columns of the row after it is updated.
    -In a DELETE trigger, only OLD.col_name can be used; there is no new row
"""
"""
    A column named with OLD is read only. You can refer to it (if you have the SELECT privilege), but not modify it.
    You can refer to a column named with NEW if you have the SELECT privilege for it. In a BEFORE trigger, you can
    also change its value with SET NEW.col_name = value if you have the UPDATE privilege for it. This means you can
    use a trigger to modify the values to be inserted into a new row or used to update a row.
    (Such a SET statement has no effect in an AFTER trigger because the row change will have already occurred.)
"""

example: AFTER INSERT
"""
    In the following example, we have two tables: emp_details and log_emp_details.
    To insert some information into log_emp_details table (which have three fields employee id and salary and edttime)
    every time, when an INSERT happen into emp_details table we have used the following trigger :
"""
CREATE
DEFINER = 'root'@'localhost'
TRIGGER 'hr'.'emp_details_AINS'
AFTER INSERT ON 'hr'.'emp_details'
FOR EACH ROW
BEGIN
INSERT INTO log_emp_details
VALUES (NEW.employee_id, NEW.salary, NOW());
END

Example BEFORE INSERT
"""
    In the following example before insert a new record in emp_details table, a trigger check the column value of
    FIRST_NAME, LAST_NAME, JOB_ID and If there are any space(s) before or after the FIRST_NAME, LAST_NAME, TRIM()
    function will remove those. The value of the JOB_ID will be converted to upper cases by UPPER() function.
"""
CREATE
TRIGGER remove_space
BEFORE INSERT ON 'hr'.'emp_details'
FOR EACH ROW
BEGIN
SET NEW.FIRST_NAME = TRIM(NEW.FIRST_NAME);
SET NEW.LAST_NAME = TRIM(NEW.LAST_NAME);
SET NEW.JOB_ID = UPPER(NEW.JOB_ID);
END;

 Example AFTER UPDATE
 """
    We have two tables student_mast and stu_log. student_mast have three columns STUDENT_ID,
    NAME, ST_CLASS. stu_log table has two columns user_id and description.
    Let we promote all the students in next class i.e. 7 will be 8, 8 will be 9 and so on.
    After updating a single row in student_mast table a new row will be inserted in stu_log table where
    we will store the current user id and a small description regarding the current update.
    Here is the trigger code :
 """
CREATE 
TRIGGER `dbName`.`student_mast_AUPD`
AFTER UPDATE 
ON `dbName`.`student_mast`FOR EACH ROW
BEGIN
INSERT into stu_log VALUES (user(), CONCAT('Update Student Record ',
         OLD.NAME,' Previous Class :',OLD.ST_CLASS,' Present Class ',
         NEW.st_class));
END

"""
Read more examples here
https://www.w3resource.com/mysql/mysql-triggers.php
"""

Delete a MySQL trigger
"""
    To delete or destroy a trigger, use a DROP TRIGGER statement.
    You must specify the schema name if the trigger is not in the default (current) schema
    if you drop a table, any triggers for the table are also dropped.
"""
DROP TRIGGER IF EXISTS schema_name.trigger_name 