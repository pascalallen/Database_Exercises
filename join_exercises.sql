create database join_test_db;

use join_test_db;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null),
('pascal', 'pascal@example.com', null),
('letty', 'letty@example.com', 2),
('mk', 'mk@example.com', 2),
('craig', 'craig@example.com', 2);

select *
from users as u
join roles as r on r.id = u.role_id;

select *
from users as u
left join roles as r on r.id = u.role_id;

select *
from users as u
right join roles as r on r.id = u.role_id;

select r.name, count(u.role_id) as 'users_with_roles'
from users as u
right join roles as r on r.id = u.role_id
group by r.id;

use employees;

select d.dept_name as 'department', concat(e.first_name, ' ', e.last_name) as 'manager'
from departments as d
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
where dm.to_date > now();

select d.dept_name as 'department', concat(e.first_name, ' ', e.last_name) as 'manager'
from departments as d
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
where e.gender = 'F' and dm.to_date > now();

select t.title as 'Title', count(de.emp_no) as 'Count'
from titles as t
join dept_emp as de on de.emp_no = t.emp_no
join departments as d on d.dept_no = de.dept_no
where dept_name = 'Customer Service' and t.to_date > now() and de.to_date > now()
group by t.title;

select d.dept_name as 'department', concat(e.first_name, ' ', e.last_name) as 'manager', s.salary as 'salary'
from departments as d
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
join salaries as s on dm.emp_no = s.emp_no
where dm.to_date > now() and s.to_date > now();

select concat(e.first_name, ' ', e.last_name) as 'current_employees', d.dept_name as 'department', concat(managers.first_name, ' ', managers.last_name) as 'manager'
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as managers on dm.emp_no = managers.emp_no
where de.to_date > now() and dm.to_date > now();

USE employees;

select first_name, last_name
from employees
where hire_date in (
	select hire_date
	from employees
	where emp_no = 101010
);

select concat(first_name, ' ', last_name) as 'Employee', 
       d.dept_name as 'Department', 
       (select concat(first_name, ' ', last_name)
        from employees e1
        where e1.emp_no = dm.emp_no) as 'Manager'
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no 
join dept_manager as dm on d.dept_no = dm.dept_no
where de.to_date > now()
and dm.to_date > now();



