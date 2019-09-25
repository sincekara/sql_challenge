-- retreiving date from the tables
-- note: to make sure that each table has correctly constructed and 
-- the data has been imported properly the queries has been realised to 
-- retreive the data from them. All queries have been made successfully. 

select * from dept_emp
select * from dept_manager
select * from departments
select * from employees
select * from titles
select * from salaries

-- Data analysis of 8 quiries

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- note: the related columns were sellected from related tables and merged on "emp_no" which is the common column for the both.

select salaries.salary, employees.emp_no, employees.last_name, employees.first_name, employees.gender from employees
join salaries on employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1987.
-- note: since the first and last name exist in employees, these coluns have been taken from employees table.
-- To limint the date "where" "between" "and" functions have been used.

select first_name, last_name, hire_date from employees
where hire_date between '1987-01-01' and '1988-01-01';

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.
-- note: here, the two merges conducted, because related data are located in three data sets including daparments, 
-- employees and dept_managers

select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- note: in this query, the info regarding emp no, last and first name were taken from employees data set while department name was from departments. 

select employees.emp_no, employees.last_name, employees.first_name,departments.dept_name fro departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no

-- 5. List all employees whose first name is "Duangkaew" and last names begin with "P."
-- note: the most difficult part in this query was to limit the query in terms of last names starting with P. "and" and "like 'P%'"
-- function is used to get it. 

select employees.first_name, employees.last_name from employees
where first_name = 'Duangkaew' and last_name like 'P%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- here, the most of the data came from employees data set. to limit the employees to sales department 
-- "where tablename.relatedcolumn = "Sales" function was used

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
-- note: the main difference between item 6 and 7 was adding the development department to the quiry. To do that I have used
-- "and" function first but it did not work. Than I found out that the right function was "or" instead of "and".

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8. In ascending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
-- This was the most difficult query for me. First, I have selected the last name, counted it and insert it to the table as
-- a new column called frequency_count, then grouped them by the last name reorder, recount and put it in descending order
-- with the function "desc"

select last_name, count(last_name) as "frequency_count" from employees
group by last_name
order by
count(last_name) desc;






