/*
使用含有关键字exists查找未分配具体部门的员工的所有信息。
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
*/

/*方法1 EXISTS*/
SELECT * FROM employees
WHERE NOT EXISTS (SELECT emp_no
                         FROM dept_emp
                         WHERE dept_emp.emp_no = employees.emp_no
                        );

/*方法2 NOT IN*/
SELECT * FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_emp);
