SELECT DISTINCT title
FROM titles
GROUP BY title ASC;

SELECT DISTINCT first_name, last_name 
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
GROUP BY first_name, last_name ASC;

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';