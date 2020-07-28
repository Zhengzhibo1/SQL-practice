/*
存在如下的视图：
create view emp_v as select * from employees where emp_no >10005;
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
获取employees中的行数据，且这些行也存在于emp_v中。注意不能使用intersect关键字。
(你能不用select * from employees where emp_no >10005 这条语句完成吗，挑战一下自己对视图的理解)
*/

/*方法1 直接获取视图数据*/
SELECT * FROM emp_v;

/*方法2 两表联查，内联结*/
SELECT employees.*
FROM employees INNER JOIN emp_v
ON employees.emp_no = emp_v.emp_no;
