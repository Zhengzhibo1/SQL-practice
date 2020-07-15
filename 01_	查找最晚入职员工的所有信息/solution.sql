/*
查找最晚入职员工的所有信息，为了减轻入门难度，目前所有的数据里员工入职的日期都不是同一天(sqlite里面的注释为--,mysql为comment)
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,  -- '员工编号'
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

/*
方法1：
MAX 取最大值
先获取所有最晚的 hire_date，然后把与其相等的记录取出来，这个可以取多条，因此必定是正确的。
*/
SELECT * FROM employees WHERE hire_date = (SELECT Max(hire_date) FROM employees);
/*
方法2：
利用排序与LIMIT结合，仅能取一条记录，其中DESC表示逆序
*/
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 1;
/*LIMIT(m, n) 从第 m + 1 行开始取 n 条记录*/
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 0,1;
/*offset关键字*/
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 1 OFFSET 0;
