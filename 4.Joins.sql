-- JOIN

-- Obtiene los datos de los usuarios que tienen un dni (JOIN es lo mismo que INNER JOIN)
SELECT * FROM users
INNER JOIN dni
ON users.user_id = dni.user_id;

-- Obtiene el nombre y el dni de los usuarios que tienen un dni y los ordena por edad
SELECT name,age, dni_number FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age;

-- Obtiene los datos de los usuarios que tienen empresa
SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

-- Obtiene los datos de las empresas que tienen usuarios
SELECT * FROM companies
JOIN users
ON companies.company_id = users.company_id;

-- Obtiene el nombre de las empresas junto al nombre de sus usuarios
SELECT companies.name, CONCAT (users.name, ' ', users.surname) AS empleado FROM companies
JOIN users
ON companies.company_id = users.company_id;

-- Obtiene los nombres de usuarios junto a los lenguajes que conocen (JOIN 3 tables)
SELECT users.name, languages.name FROM users_languages
JOIN users 
ON users_languages.user_id = users.user_id
JOIN languages 
ON users_languages.language_id = languages.language_id;

-- LEFT JOIN
-- Obtiene los datos de todos los usuarios junto a su dni (lo tenga o no)

SELECT name, dni_number FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
ORDER BY name;

-- Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
SELECT name, dni_number FROM dni
LEFT JOIN users
ON users.user_id = dni.user_id
ORDER BY name;

-- Obtiene el nombre de todos los usuarios junto a sus lenguajes (los tenga o no)
SELECT users.name, languages.name FROM users
LEFT JOIN users_languages
ON users.user_id = users_languages.user_id 
LEFT JOIN languages 
ON users_languages.language_id = languages.language_id;

-- RIGHT JOIN
-- Obtiene todos los dni junto a su usuario (lo tenga o no)
SELECT * FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id;

-- Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
SELECT name, dni_number FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id;

-- Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
SELECT name, dni_number FROM dni
RIGHT JOIN users
ON users.user_id = dni.user_id;

-- Obtiene el nombre de todos los lenguajes junto a sus usuarios (los tenga o no)
SELECT users.name,languages.name FROM users
RIGHT JOIN users_languages
ON users.user_id = users_languages.user_id
RIGHT JOIN languages
ON users_languages.language_id = languages.language_id;

-- UNION (FULL JOIN)
-- UNION elimina duplicados

-- Obtiene todos los id de usuarios de las tablas dni y usuarios (exista o no relación)
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id 
FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
UNION ALL
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id 
FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id
 