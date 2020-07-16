/*
查找所有员工的last_name和first_name以及对应部门编号dept_no，也包括暂时没有分配具体部门的员工(请注意输出描述里各个列的前后顺序)
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

/*方法1：外联结，
内联结，两边表同时有对应的数据，即任何一边缺失数据就不显示。
左外联结，读取左边数据表的全部数据，即便右边表无对应数。即右表d中dept_no即使为NULL，也会读取左表中的全部emp_no。
*/
SELECT employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees LEFT OUTER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no;
