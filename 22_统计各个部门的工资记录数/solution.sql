/*
统计各个部门的工资记录数，给出部门编码dept_no、部门名称dept_name以及部门在salaries表里面有多少条记录sum
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
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

/*方法1 三表联查 WHERE过滤*/
SELECT d.dept_no, d.dept_name, Count(*)
FROM departments AS d, dept_emp AS de, salaries AS s
WHERE s.emp_no = de.emp_no
AND de.dept_no = d.dept_no
GROUP BY d.dept_no;

/*方法2 嵌套查询，查出一个dept_no，就进行子查询的到对应COUNT()*/
SELECT dept_no, dept_name, (SELECT Count()
                           FROM dept_emp INNER JOIN salaries
                           ON dept_emp.emp_no = salaries.emp_no
                           WHERE dept_emp.dept_no = departments.dept_no) AS sum
FROM departments;

/*方法2 先进行两次内联结，再通过GROUP BY查询*/
SELECT d.dept_no, d.dept_name, Count(*)
FROM (dept_emp INNER JOIN departments
     ON dept_emp.dept_no = departments.dept_no) AS d
INNER JOIN salaries
ON d.emp_no = salaries.emp_no
GROUP BY d.dept_no;

/*
注意 这里GROUP BY聚合dept_no,而dept_name看上去不是聚合列(应该不能放进SELECT语句内)，
由于dept_no是主键，所以一个dept_no只会对应一个dept_name，所以可以认为dept_name是可聚合的。
要注意的是，如果dept_no不是主键，而是联合主键之一或者别的情况，
总之dept_no不能唯一确定dept_name，那么即使在表中看上去dept_no和dept_name是一一对应的，
也不能将dept_name放进SELECT中，强行放进去，在mysql中也会报错(当然在题库中不会报错)。
*/
