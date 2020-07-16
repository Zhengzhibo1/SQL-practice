/*
查找所有已经分配部门的员工的last_name和first_name以及dept_no(请注意输出描述里各个列的前后顺序)
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

/*方法1：where关键字连接两个表*/
SELECT employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees, dept_emp
WHERE employees.emp_no = dept_emp.emp_no;

/*方法2：内联结*/
SELECT employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;
