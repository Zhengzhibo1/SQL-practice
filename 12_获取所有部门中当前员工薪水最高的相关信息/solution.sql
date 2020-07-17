/*
获取所有部门中当前(dept_emp.to_date = '9999-01-01')员工当前(salaries.to_date='9999-01-01')薪水最高的相关信息，给出dept_no, emp_no以及其对应的salary
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
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

/*方法1 关联子查询*/

SELECT d1.dept_no, d1.emp_no, s1.salary
FROM dept_emp AS d1 INNER JOIN salaries AS s1
ON d1.emp_no = s1.emp_no
AND d1.to_date = '9999-01-01'
AND s1.to_date = '9999-01-01'
WHERE s1.salary = (SELECT Max(s2.salary)
              FROM dept_emp AS d2 INNER JOIN salaries AS s2
              ON d2.emp_no = s2.emp_no
              AND d2.to_date = '9999-01-01'
              AND s2.to_date = '9999-01-01'
              AND d2.dept_no = d1.dept_no)
ORDER BY d1.dept_no
