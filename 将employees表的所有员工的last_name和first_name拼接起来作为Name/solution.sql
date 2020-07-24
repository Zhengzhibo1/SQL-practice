/*
将employees表的所有员工的last_name和first_name拼接起来作为Name，中间以一个空格区分
(注：该数据库系统是sqlite,字符串拼接为 || 符号，不支持concat函数)
CREATE TABLE `employees` ( `emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*方法1 sqlite写法*/
SELECT last_name || " " || first_name
FROM employees;

/*方法2 mysql写法*/
SELECT Concat(last_name, ' ', first_name)
FROM employees;
