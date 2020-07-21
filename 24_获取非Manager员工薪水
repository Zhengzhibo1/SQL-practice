/*
获取所有非manager员工当前的薪水情况，给出dept_no、emp_no以及salary ，当前表示to_date='9999-01-01'
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
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
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 多表联查*/
SELECT d.dept_no, e.emp_no, s.salary
FROM dept_emp AS d, employees AS e, salaries AS s
WHERE d.emp_no = e.emp_no
AND e.emp_no = s.emp_no
AND s.to_date = '9999-01-01'
AND e.emp_no NOT IN (SELECT emp_no
                FROM dept_manager);
     
/*方法2 省略employee表，也可以采用内联结*/
SELECT d.dept_no, d.emp_no, s.salary
FROM dept_emp AS d, salaries AS s
WHERE d.emp_no = s.emp_no
AND s.to_date = '9999-01-01'
AND d.emp_no NOT IN (SELECT emp_no
                FROM dept_manager);
