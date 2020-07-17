/*
查找所有员工的last_name和first_name以及对应的dept_name，也包括暂时没有分配部门的员工
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*方法1 dept_emp内联结departments*/
SELECT employees.last_name, employees.first_name, b.dept_name
FROM employees LEFT OUTER JOIN (SELECT * FROM dept_emp INNER JOIN departments
                               ON dept_emp.dept_no = departments.dept_no) AS b
ON employees.emp_no = b.emp_no;

/*方法2 连续两个外联结*/
SELECT last_name, first_name, dept_name
FROM employees LEFT OUTER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT OUTER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

/*方法3 两个外联结嵌套*/
SELECT last_name, first_name, dept_name
FROM (SELECT * FROM employees LEFT OUTER JOIN dept_emp
     ON employees.emp_no = dept_emp.emp_no) AS a
LEFT OUTER JOIN departments
ON a.dept_no = departments.dept_no;
