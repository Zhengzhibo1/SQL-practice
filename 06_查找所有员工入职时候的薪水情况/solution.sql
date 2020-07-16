/*
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

/*因为员工可能存在涨薪情况，故薪水表中可能存在一个员工多条记录，题目意思取员工刚入职时的薪水状况
故需要取hire_date = from_date的情况，或者同一个员工中from_date最小的适合。
*/

/*方法1 在salaries中对员工工号进行分组，然后取其他from_date最小值时的薪水*/
SELECT emp_no, salary 
FROM salaries
GROUP BY emp_no
HAVING Min(from_date)
ORDER BY emp_no DESC;

/*方法2 用WHERE连接两个表，取hire_date = from_date*/
SELECT employees.emp_no, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no
AND employees.hire_date = salaries.from_date
ORDER BY employees.emp_no DESC;

/*方法3 内联结*/
SELECT employees.emp_no, salaries.salary
FROM employees INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no
AND employees.hire_date = salaries.from_date
ORDER BY employees.emp_no DESC;
