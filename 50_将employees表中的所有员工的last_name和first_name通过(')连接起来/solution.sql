/*
将employees表中的所有员工的last_name和first_name通过(')连接起来。(不支持concat，请用||实现)
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*方法1 sqlite*/
SELECT last_name || "'" || first_name AS name
FROM employees;

/*方法2 mysql*/
SELECT concat(last_name, "'", first_name) AS name
FROM employees;
