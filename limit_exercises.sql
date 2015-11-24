SELECT * 
FROM employees
WHERE birth_date LIKE '%12-25%' 
	AND(
		hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	)
ORDER BY birth_date ASC, hire_date DESC
limit 5 offset 45