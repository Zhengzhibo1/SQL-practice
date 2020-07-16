/*
查找薪水变动超过15次的员工号emp_no以及其对应的变动次数t
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 分组，然后统计次数*/
SELECT emp_no, Count(*) AS t 
FROM salaries
GROUP BY emp_no HAVING t > 15;
