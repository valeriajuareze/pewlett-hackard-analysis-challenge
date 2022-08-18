--List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

--List of departments retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--List of relevant information to the Sales team
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO sales_info
FROM current_emp as ce
INNER JOIN dept_employees AS de
ON(ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = ('Sales');

--List of Sales and Development teams
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO sales_devp_info
FROM current_emp as ce
INNER JOIN dept_employees AS de
ON(ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');
