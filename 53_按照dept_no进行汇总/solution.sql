/*
按照dept_no进行汇总，属于同一个部门的emp_no按照逗号进行连接，结果给出dept_no以及连接出的结果employees
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
*/

/*本题要用到SQLite的聚合函数group_concat(X,Y)，其中X是要连接的字段，Y是连接时用的符号，可省略，默认为逗号。
此函数必须与 GROUP BY 配合使用。此题以 dept_no 作为分组，将每个分组中不同的emp_no用逗号连接起来（即可省略Y）*/

/*方法1 sqlite*/
SELECT dept_no, group_concat(emp_no, ',') AS employees
FROM dept_emp
GROUP BY dept_no;

/*方法2 mysql*/
SELECT dept_no, group_concat(emp_no SEPARATOR ',') AS employees
FROM dept_emp
GROUP BY dept_no;
