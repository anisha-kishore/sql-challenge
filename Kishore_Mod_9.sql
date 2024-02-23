--Help creating tables from Riley Taylor, Klaus Smit, and Michael Schell

--List the employee number, last name, first name, sex, and salary of each employee
--Help from ChatGPT
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
--Help from Monika DesLauriers  on the hire_date
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name
Select em.emp_no, em.last_name, em.first_name, d.dept_no, d.dept_name, dm.emp_no
FROM employees as em
JOIN dept_manager as dm ON em.emp_no=dm.emp_no
JOIN departments as d on dm.dept_no=d.dept_no;

--List the department number for each employee along with that employee's employee number, last name, first name, and department name
Select emp.emp_no, emp.last_name, emp.first_name, demp.dept_no, de.dept_name
FROM employees as emp
JOIN dept_emp as demp ON demp.emp_no=emp.emp_no
JOIN departments as de on demp.dept_no=de.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
--Last name from ChatGPT
Select last_name, first_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
Select  empl.emp_no, empl.last_name, empl.first_name
FROM employees as empl
JOIN dept_emp as dempl ON dempl.emp_no=empl.emp_no
JOIN departments as dept on dempl.dept_no=dept.dept_no
WHERE dept.dept_name ='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
Select deptm.dept_name, emplo.emp_no, emplo.last_name, emplo.first_name
FROM employees as emplo
JOIN dept_emp as demplo ON demplo.emp_no=emplo.emp_no
JOIN departments as deptm on demplo.dept_no=deptm.dept_no
WHERE deptm.dept_name ='Sales' OR deptm.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
Select last_name, COUNT(last_name) AS "count last name"
FROM employees
GROUP BY last_name
ORDER BY "count last name" DESC
;
