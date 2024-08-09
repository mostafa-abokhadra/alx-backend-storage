-- date types of date and time
DATE --Stores date values without time. Format: YYYY-MM-DD
TIME -- Stores time values without date. Format: HH:MM:SS
DATETIME or TIMESTAMP -- Stores both date and time. Format: YYYY-MM-DD HH:MM:SS
YEAR -- Stores a year in four digits. Format: YYYY

NOW() -- Returns the current date and time.
CURDATE() -- Returns the current date.
CURTIME() -- Returns the current time.

-- to extract specific value from the date or time
YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND()
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());

-- adding and subtracting time intervals
DATE_ADD(date, INTERVAL expr unit) -- Adds a time interval to a date.
DATE_SUB(date, INTERVAL expr unit) -- Subtracts a time interval from a date.

SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);

DATE_FORMAT(date, format) -- formating date and time
"""
    Here are some common format specifiers used in DATE_FORMAT():

    %Y: Year, four digits (e.g., 2024)
    %y: Year, two digits (e.g., 24)
    %m: Month, two digits (01 to 12)
    %b: Abbreviated month name (e.g., Jan)
    %M: Full month name (e.g., January)
    %d: Day of the month, two digits (01 to 31)
    %H: Hour (00 to 23)
    %i: Minutes (00 to 59)
    %s: Seconds (00 to 59)
    %W: Weekday name (e.g., Sunday)
    %w: Day of the week (0=Sunday, 6=Saturday)
"""
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');

"""
    You can compare date and time values using standard
    comparison operators (<, >, =, <=, >=, !=).
"""
SELECT * FROM events WHERE event_date > '2024-08-09 15:00:00';

-- calculating difference between two dates
TIMESTAMPDIFF(unit, datetime1, datetime2) --Returns the difference between
                                          -- two date-time values in the specified unit.
SELECT TIMESTAMPDIFF(DAY, '2024-08-01', NOW());

-- time zone
-- Handling time zones is essential when working with global applications.
CONVERT_TZ(datetime, from_tz, to_tz) -- Converts a date-time from one time zone to another.
SELECT CONVERT_TZ(NOW(), '+00:00', '+08:00');