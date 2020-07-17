/*
获取所有员工当前的(dept_manager.to_date='9999-01-01')manager，如果员工是manager的话不显示(也就是如果当前的manager是自己的话结果不显示)。输出结果第一列给出当前员工的emp_no,第二列给出其manager对应的emp_no。
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL, -- '所有的员工编号'
`dept_no` char(4) NOT NULL, -- '部门编号'
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL, -- '部门编号'
`emp_no` int(11) NOT NULL, -- '经理编号'
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
*/

/*方法1 WHERE连接两个表，NOT IN */
SELECT dept_emp.emp_no, dept_manager.emp_no
FROM dept_emp, dept_manager
WHERE dept_emp.dept_no = dept_manager.dept_no
AND dept_emp.emp_no NOT IN (dept_manager.emp_no)
AND dept_manager.to_date='9999-01-01'

/*方法2 内联结 + 不等于*/
SELECT dept_emp.emp_no, dept_manager.emp_no
FROM dept_emp INNER JOIN dept_manager
ON dept_emp.dept_no = dept_manager.dept_no
AND dept_emp.emp_no != dept_manager.emp_no
AND dept_manager.to_date='9999-01-01'
