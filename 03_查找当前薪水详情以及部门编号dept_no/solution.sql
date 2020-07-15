/*
查找各个部门当前(dept_manager.to_date='9999-01-01')领导当前(salaries.to_date='9999-01-01')薪水详情以及其对应部门编号dept_no
(注:请以salaries表为主表进行查询，输出结果以salaries.emp_no升序排序，并且请注意输出结果里面dept_no列是最后一列)
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL, -- '员工编号',
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL, -- '部门编号'
`emp_no` int(11) NOT NULL, --  '员工编号'
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
*/

/*方法1：使用where连接两个表*/
SELECT salaries.emp_no,salaries.salary,salaries.from_date,salaries.to_date,dept_manager.dept_no
FROM salaries, dept_manager
WHERE salaries.emp_no = dept_manager.emp_no 
AND dept_manager.to_date = '9999-01-01'
AND salaries.to_date = '9999-01-01'
ORDER BY salaries.emp_no;

/*方法2：使用内联结*/
SELECT salaries.emp_no,salaries.salary,salaries.from_date,salaries.to_date,dept_manager.dept_no
FROM salaries INNER JOIN dept_manager
ON salaries.emp_no = dept_manager.emp_no 
WHERE dept_manager.to_date = '9999-01-01'
AND salaries.to_date = '9999-01-01'
ORDER BY salaries.emp_no;
/*可以用salaries.*代替salaries.emp_no,salaries.salary,salaries.from_date,salaries.to_date*/
