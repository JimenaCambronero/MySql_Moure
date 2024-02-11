-- INDEX


-- Crea un índice llamado "idx_name" en la tabla "users" asociado al campo "name"
CREATE INDEX idx_name ON users(name);
CREATE UNIQUE INDEX idx_name ON users(name,surname);

SELECT * FROM users
WHERE name = 'Marcela';

-- Crea un índice único llamado "idx_name" en la tabla "users" asociado al campo "name"
CREATE UNIQUE INDEX idx_name ON users(name);

-- Crea un índice llamado "idx_name_surname" en la tabla "users" asociado a los campos "name" y "surname"
CREATE UNIQUE INDEX idx_name_surname ON users(name,surname);

-- Elimina el índice llamado "idx_name"
DROP INDEX idx_name ON users;

-- TRIGGERS
-- Crea una tabla de historial para usar en el ejemplo
drop table email_history;


CREATE TABLE email_history (
email_history_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
email VARCHAR(100) NULL,
UNIQUE INDEX  email_history_id_UNIQUE (email_history_id ASC) VISIBLE);

-- Crea un trigger llamado "tg_email" que guarda el email previo en la tabla "email_history" siempre que se actualiza el campo "email" en la tabla "users"
-- DELIMITER es una directiva que sirve para cambiar el delimitador de instrucciones SQL, que por defecto es ; Se utiliza cuando se define un bloque de código como un procedimiento donde se requieren múltiples instrucciones SQL terminadas con punto y coma dentro de un mismo bloque.

delimiter |
CREATE TRIGGER tg_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email <> NEW.email THEN
		INSERT INTO email_history(user_id, email)
		VALUES (OLD.user_id, OLD.email);
	END IF;
END
|
delimiter ;


-- Actualiza el campo "email" del usuario 1 la tabla "users" para probar el trigger
UPDATE users SET email = 'emailparatrigger@gmail.com' WHERE user_id = 7;

-- Elimina el trigger llamado "tg_email"
-- DROP TRIGGER tg_email;

-- VIEW
-- Crea unaa vista llamada "v_adult_users" con los nombres y edades de usuarios de la table "users" que tienen una edad igual o mayor a 30 años.

CREATE VIEW V_adult_users AS
SELECT name, age
FROM users
WHERE age >= 30;

SELECT * FROM V_adult_users;

-- Elimina la vista llamada "v_adult_users"
DROP VIEW v_adult_users;
