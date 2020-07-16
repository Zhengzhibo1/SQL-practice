/*
获取所有部门当前(dept_manager.to_date='9999-01-01')manager的当前(salaries.to_date='9999-01-01')薪水情况，给出dept_no, emp_no以及salary(请注意，同一个人可能有多条薪水情况记录)
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 WHERE*/
SELECT dept_manager.dept_no, dept_manager.emp_no, salaries.salary
FROM dept_manager, salaries
WHERE dept_manager.emp_no = salaries.emp_no
AND dept_manager.to_date = salaries.to_date
AND dept_manager.to_date = '9999-01-01';

/*方法2 内联结*/
SELECT dept_manager.dept_no, dept_manager.emp_no, salaries.salary
FROM dept_manager INNER JOIN salaries
ON dept_manager.emp_no = salaries.emp_no
AND dept_manager.to_date = salaries.to_date
WHERE salaries.to_date = '9999-01-01';
