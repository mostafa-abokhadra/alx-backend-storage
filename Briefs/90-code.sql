CREATE table IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255)
);

CREATE table IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
)

SELECT origin, SUM(fans) as nb_fans FROM metal_bands
GROUP BY origin ORDER BY nb_fans DESC;

SELECT name, COALESCE(email, phone, 'No contact information') AS contact_info FROM users;

SELECT band_name, COALESCE(split, 2022) - formed as lifespan FROM metal_bands
WHERE style LIKE '%Glam rock%' ORDER BY lifespan DESC;

CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE name=NEW.item_name;

DELIMITER $$ ;
CREATE TRIGGER resets_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email != OLD.email THEN
		SET NEW.valid_email = 0;
	END IF;
END; $$
DELIMITER ;

DELIMITER $$;
CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT)
BEGIN
    IF NOT EXISTS(SELECT * FROM projects WHERE name = project_name) THEN
        INSERT INTO projects (name)
        VALUES(project_name);
    END IF
    INSERT INTO correction(user_id, project_id, score)
    VALUES (user_id, (SELECT id from projects WHERE name=project_name), score);
END; $$
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id FLOAT)
BEGIN
    UPDATE users
    SET average_score = SELECT AVG(score) FROM corrections
    WHERE corrections.user_id = user_id;
    WHERE id = user_id;
END; $$
DELIMITER ;

CREATE INDEX idx_name_first ON names (name(1))
-- indexing only the first char of name

CREATE INDEX idx_name_first_score
ON names(name(1), score);

DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	RETURN (IF (b = 0, 0, a / b));
END
"""
    script that creates a function SafeDiv
    that divides (and returns) the first
    by the second number or returns 0 if
    the second number is equal to 0.
"""

DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
SELECT name FROM students WHERE score < 80
AND (students.last_meeting IS NULL OR students.last_meeting < DATE_ADD(NOW(), INTERVAL -1 MONTH));
