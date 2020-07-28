/*
分页查询employees表，每5行一页，返回第2页的数据
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*根据题意，每行5页，返回第2页的数据，即返回第6~10条记录。*/

/*方法1 LIMIT + OFFSET*/
SELECT *
FROM employees
LIMIT 5 OFFSET 5;
/*LIMIT 后的数字代表返回几条记录，OFFSET 后的数字代表从第几条记录开始返回（第一条记录序号为0），也可理解为跳过多少条记录后开始返回。*/

/*方法2 LIMIT*/
SELECT *
FROM employees
LIMIT 5,5;
/*在 LIMIT X,Y 中，Y代表返回几条记录，X代表从第几条记录开始返回（第一条记录序号为0）。*/
