select distinct last_name
from employees
where last_name like 'Z%'
order by last_name desc
limit 10;