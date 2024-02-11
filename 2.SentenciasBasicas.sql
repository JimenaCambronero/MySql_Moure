-- SELECT
-- Obtiene todos los datos de la tabla "users"
SELECT * FROM users;

-- Obtiene todos los nombres de la tabla "users"
SELECT name FROM users;

-- Obtiene todos los identificadores y nombres de la tabla "users"
SELECT user_id, name FROM users;


-- DISTINCT
-- Obtiene todos los datos distintos entre sí de la tabla "users"
SELECT DISTINCT * FROM users;

-- Obtiene todos los valores distintos referentes al atributo edad de la tabla "users"
SELECT DISTINCT age FROM users;


-- WHERE
-- Filtra todos los datos de la tabla "users" con edad igual a 22
SELECT * FROM users WHERE age = 22;

-- Filtra todos los nombres de la tabla "users" con edad igual a 23
SELECT name FROM users WHERE age = 23;

-- Filtra todos los nombres distintos de la tabla "users" con edad igual a 23
SELECT DISTINCT name FROM users WHERE age = 23;

-- Filtra todas las edades distintas de la tabla "users" con edad igual a 23
SELECT DISTINCT age FROM users WHERE age = 23;


-- ORDER BY
-- Ordena todos los datos de la tabla "users" por edad (ascendente por defecto)
SELECT * FROM users ORDER BY age;

-- Ordena todos los datos de la tabla "users" por edad de manera ascendente
SELECT * FROM users ORDER BY age ASC;

-- Ordena todos los datos de la tabla "users" por edad de manera descendente
SELECT * FROM users ORDER BY age DESC;

-- Obtiene todos los datos de la tabla "users" con email igual a marcelap@gmail.com y los ordena por edad de manera descendente
SELECT * FROM users WHERE email='marcelap@gmail.com' ORDER BY age DESC;

-- Obtiene todos los nombres de la tabla "users" con email igual a marcelap@gmail.com y los ordena por edad de manera descendente
SELECT name FROM users WHERE email='marcelap@gmail.com' ORDER BY age DESC;


-- LIKE
-- Obtiene todos datos de la tabla "users" que contienen un email con el texto "gmail.com" en su parte final
SELECT * FROM users WHERE email LIKE '%gmail.com';

-- Obtiene todos datos de la tabla "users" que contienen un email con el texto "ju" en su parte inicial
SELECT * FROM users WHERE email LIKE 'ju%';

-- Obtiene todos datos de la tabla "users" que contienen un email una arroba
SELECT * FROM users WHERE email LIKE '%@%';


-- NOT, AND, OR
-- Obtiene todos datos de la tabla "users" con email distinto a sara@gmail.com
SELECT * FROM users WHERE NOT email = 'marcelap@gmail.com';

-- Obtiene todos datos de la tabla "users" con email distinto a sara@gmail.com y edad igual a 15
SELECT * FROM users WHERE NOT email = 'marcelap@gmail.com' AND age = 23;

-- Obtiene todos datos de la tabla "users" con email distinto a sara@gmail.com o edad igual a 15
SELECT * FROM users WHERE NOT email = 'marcelap@gmail.com' OR age = 23;


-- LIMIT
-- Obtiene las 3 primeras filas de la tabla "users"
SELECT * FROM users LIMIT 3;

-- Obtiene las 32 primeras filas de la tabla "users" con email distinto a sara@gmail.com o edad igual a 23
SELECT * FROM users WHERE NOT email = 'marcelap@gmail.com' OR age = 23 LIMIT 2;


-- NULL
-- Obtiene todos datos de la tabla "users" de la tabla "users" con email nulo
SELECT * FROM users WHERE email IS NULL;

-- Obtiene todos datos de la tabla "users" de la tabla "users" con email no nulo
SELECT * FROM users WHERE email IS NOT NULL;

-- Obtiene todos datos de la tabla "users" de la tabla "users" con email no nulo y edad igual a 18
SELECT * FROM users WHERE email IS NOT NULL AND age = 18;


-- IFNULL
-- Obtiene el nombre, apellido y edad de la tabla "users", y si la edad es nula la muestra como 0
SELECT name, surname, IFNULL(age, 0) AS age FROM users;


-- MIN, MAX
-- Obtiene el valor menor del campo edad de la tabla "users"
Select MIN(age) FROM users;

-- Obtiene el valor mayor del campo edad de la tabla "users"
Select MAX(age) FROM users;
 
 
-- COUNT
-- Cuenta cuantas filas contiene la tabla "users"
Select COUNT(*) FROM users;

-- Cuenta cuantas filas contienen un dato no nulo en el campo edad de la tabla "users"
Select COUNT(age) FROM users;


-- SUM
-- Suma todos los valores del campo edad de la tabla "users"
Select SUM(age) FROM users;


-- AVG
-- Obtiene la media de edad de la tabla "users"
Select AVG(age) FROM users;

-- IN
-- Ordena todos los datos de la tabla "users" con nombre igual a brais y sara
SELECT * FROM users WHERE name IN ('Ana', 'Cristian');


-- BETWEEN
-- Ordena todos los datos de la tabla "users" con edad comprendida entre 20 y 30
SELECT * FROM users WHERE age BETWEEN 20 AND 30;


-- ALIAS
-- Establece el alias 'Fecha de inicio en programación' a la columna init_date
SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE name = 'Marcela';

-- Consulta igual que la anterior. Representa la posibilidad de usar comillas dobles para cadenas
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Marcela";


-- CONCAT
-- Concatena en una sola columa los campos nombre y apellido
SELECT CONCAT('Nombre: ', name, ', Apellidos: ', surname) FROM users;

-- Concatena en una sola columa los campos nombre y apellido y le establece el alias 'Nombre completo'
SELECT CONCAT('Nombre: ', name, ', Apellidos: ', surname) AS 'Nombre completo' FROM users;


-- GROUP BY
-- Agrupa los resultados por edad diferente
SELECT MAX(age) FROM users GROUP BY age;

-- Agrupa los resultados por edad diferente y cuenta cuantos registros existen de cada una
SELECT COUNT(age), age FROM users GROUP BY age;

-- Agrupa los resultados por edad diferente, cuenta cuantos registros existen de cada una y los ordena
SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC;

-- Agrupa los resultados por edad diferente mayor de 18, cuenta cuantos registros existen de cada una y los ordena
SELECT COUNT(age), age FROM users WHERE age > 18 GROUP BY age ORDER BY age ASC;


-- HAVING
-- Cuenta cuantas filas contienen un dato no nulo en el campo edad de la tabla "users" mayor que 3
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3;


-- CASE
-- Obtiene todos los datos de la tabla "users" y establece condiciones de visualización de cadenas de texto según el valor de la edad 
SELECT *,
CASE 
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoría de edad'
    ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users;

-- Obtiene todos los datos de la tabla "users" y establece condiciones de visualización de valores booleanos según el valor de la edad 
SELECT *,
CASE 
	WHEN age > 18 THEN True
    ELSE False
END AS '¿Es mayor de edad?'
FROM users;


-- INSERT
-- Inserta un registro con identificador, nombre y apellido en la tabla "users"
INSERT INTO users (user_id, name, surname) VALUES (12, 'María', 'López');


-- UPDATE
-- Establece el valor 21 para la edad del registro de la tabla "users" con identificador igual a 11
UPDATE users SET age = '21' WHERE user_id = 11;

-- Establece el valor 20 para la edad del registro de la tabla "users" con identificador igual a 11
UPDATE users SET age = '20' WHERE user_id = 11;

-- Establece edad y una fecha para registro de la tabla "users" con identificador igual a 11
UPDATE users SET age = 20, init_date = '2020-10-12' WHERE user_id = 11;

-- DELETE
-- Elimina el registro de la tabla "users" con identificador igual a 11
DELETE FROM users WHERE user_id = 11;