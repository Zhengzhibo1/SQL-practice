/*
获取员工其当前的薪水比其manager当前薪水还高的相关信息，当前表示to_date='9999-01-01',
结果第一列给出员工的emp_no，
第二列给出其manager的manager_no，
第三列给出该员工当前的薪水emp_salary,
第四列给该员工对应的manager当前的薪水manager_salary
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
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 构建员工工资表和管理工资表，然后两表联查*/
SELECT a.emp_no, b.manager_no, a.emp_salary, b.manager_salary
FROM (SELECT dept_emp.emp_no, dept_emp.dept_no, salaries.salary AS emp_salary
      FROM dept_emp, salaries
      WHERE dept_emp.emp_no = salaries.emp_no
      AND salaries.to_date = '9999-01-01'
     ) AS a
INNER JOIN 
(SELECT dept_manager.emp_no AS manager_no, dept_manager.dept_no, salaries.salary AS manager_salary
                        FROM dept_manager, salaries
                        WHERE dept_manager.emp_no = salaries.emp_no
                        AND salaries.to_date = '9999-01-01'
                       ) AS b
ON a.dept_no = b.dept_no
WHERE a.emp_salary > b.manager_salary;
