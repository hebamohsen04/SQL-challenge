CREATE TABLE Departments ( dept_no varchar (5) not null ,
						          dept_name varchar (40) 
								   dept_no serial primary key);
      
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR (5)  NOT NULL);
	
CREATE TABLE dept_manager( dept_no varchar (5) not null ,
                          emp_no INT not null ); 
						  
CREATE TABLE employees (emp_no INT not null ,
					     emp_title_id Varchar (8),
						 birth_date date ,
						 first_name Varchar (50),
						 last_name Varchar (50),
						 sex Varchar (1),
					     hire_date date ,
                      emp_no serial primary key ); 
						 
CREATE TABLE salaries (emp_no INT Not Null ,
					    Salary INT not Null );
					    
						
CREATE TABLE titles ( title_id Varchar (5),
		  title Varchar (40));
		  
					 
--select * from departments
--select *from dept_emp
--select *from dept_manager
--select *from employees
--select *from salaries
--select *from titles

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date ='1986-01-01';

/*--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;*/

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

/*--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
 
select last_name,last_name, sex 
from employees
where first_name = 'Hercules'
and last_name like 'B%';*/

 /*--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no;*/

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
and  departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;



