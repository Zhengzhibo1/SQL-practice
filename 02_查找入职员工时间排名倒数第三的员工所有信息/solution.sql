/*
查找入职员工时间排名倒数第三的员工所有信息，为了减轻入门难度，目前所有的数据里员工入职的日期都不是同一天
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*方法1：考虑重复情况，利用distinct关键字去重*/
SELECT * FROM employees WHERE hire_date = (SELECT DISTINCT hire_date FROM employees ORDER BY hire_date DESC LIMIT 2,1);
/*方法2：不考虑重复情况
其中LIMIT 带1个参数表示，从头开始取几条记录
LIMIT 带2个参数表示，从第一个参数的位置起，往后取第二参数条记录
LIMIT 与 OFFSET 一起用，表示从OFFSET的位置开始取第一个参数条记录*/
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 2,1;
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 1 OFFSET 2;
