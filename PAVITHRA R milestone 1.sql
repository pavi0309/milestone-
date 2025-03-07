use hr;
#1.Write a query to display the first name, last name, department name, salary, and the rank of each employee's salary within their department. Use the RANK() window function for this.
SELECT first_name,last_name,department_name,salary,
RANK()OVER(PARTITION BY department_name  ORDER BY salary ) AS RANK_BY_SALARY
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;
#2.Extract the first name, last name of the manager, and the department name they manage.
 SELECT first_name,last_name,department_name
 FROM employees
 JOIN departments
ON employees.department_id= departments.department_id;
#.3)Write a query to display the department name and check if the department has a manager:
#If the manager_id is null, display "No Manager".
#Otherwise, display "Has Manager".
SELECT department_name,
CASE WHEN manager_id IS NULL THEN 'No Manager'ELSE 'Has Manager'END AS manager_status
FROM departments;
#4)	Job Titles with More than 3 Employees and Average Salary Less Than 6,000
SELECT job_id,count(employee_id),avg(salary)
FROM employees
GROUP BY job_id
HAVING avg(salary)<6000;



# 5)Find Employees Who Earn More Than the Average Salary
SELECT employee_id,first_name,last_name,salary 
FROM employees
group by employee_id
having MAX(salary) ;
#6.6)	Find Employees Hired after employee id 103
SELECT first_name,last_name,hire_date
FROM employees
WHERE employee_id >103;
#7.Find the total salary, average salary, and number of employees per department, and include the department name from the departments table.
SELECT departments.department_name,count(employees.employee_id)AS NUMBER_OF_EMPLOYEES,
sum(employees.salary)AS TOTAL_SALARY,
avg(employees.salary)AS AVERAGE_SALARY
FROM employees
JOIN departments
ON departments.department_id = employees.department_id
GROUP BY departments.department_name;
#8.Extract the Top 10 Departments with the Highest Average Salary
SELECT departments.department_name, AVG(employees.salary) AS average_salary
FROM employees employees
JOIN departments departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name
ORDER BY average_salary desc
LIMIT 10;
#9.Ranking Employees by Salary in Each Department
SELECT employees.employee_id,departments.department_id,salary,
rank() OVER(PARTITION BY department_id order by salary)AS RANKING_EMPLOYEE
FROM employees employees
JOIN departments departments
ON employees.department_id = departments.department_id;
#10.Find Employees with Salary in a Range between 5000 and 10000
SELECT first_name,last_name,salary 
FROM employees 
WHERE SALARY BETWEEN '5000' AND '1000';








