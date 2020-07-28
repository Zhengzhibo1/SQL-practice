/*
按照salary的累计和running_total，其中running_total为前N个当前( to_date = '9999-01-01')员工的salary累计和，其他以此类推。 具体结果如下Demo展示。。
CREATE TABLE `salaries` ( `emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 嵌套子查询，对于每个emp_no计算一下running_total*/
SELECT a.emp_no, a.salary, 
(SELECT SUM(b.salary)
 FROM salaries AS b
 WHERE b.emp_no <= a.emp_no
 AND b.to_date = '9999-01-01'
) AS running_total
FROM salaries AS a
WHERE a.to_date = '9999-01-01'
ORDER BY a.emp_no;
