/*
获取所有非manager的员工emp_no
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
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

/*方法1 NOT IN + 子查询*/
SELECT emp_no
FROM employees
WHERE emp_no NOT IN (
SELECT emp_no FROM dept_manager
);

/*方法2 外联结 LEFT*/
SELECT employees.emp_no
FROM employees LEFT OUTER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
WHERE dept_no IS NULL;
