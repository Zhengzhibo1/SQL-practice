/*
存在如下的视图：
create view emp_v as select * from employees where emp_no >10005;
如何获取emp_v和employees有相同的数据？
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
(你能不用 select * from employees where emp_no >10005完成吗，挑战一下自己对视图的理解吧)
输出格式:
*/

/*方法1 视图的数据来源于employees，所以直接输出视图即可*/
SELECT * FROM emp_v;

/*方法2 两表联查*/
SELECT employees.*
FROM employees, emp_v
WHERE employees.emp_no = emp_v.emp_no;

/*方法3 用 INTERSECT 关键字求 employees 和 emp_v 的交集*/
SELECT * FROM employees
INTERSECT
SELECT * FROM emp_v;
