/*
找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照逆序显示
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 DISTINCT与ORDER BY的使用*/
SELECT DISTINCT salary 
FROM salaries
WHERE to_date = '9999-01-01'
ORDER BY salary DESC;

/*方法2 GROUP BY与ORDER BY的使用
WHERE语句在GROUP BY语句之前，SQL会在分组之前计算WHERE语句。HAVING语句在GROUP BY语句之后，SQL会在分组之后计算HAVING语句。
*/
SELECT salary
FROM salaries
WHERE to_date = '9999-01-01'
GROUP BY salary
ORDER BY salary DESC

/*说明：
对于DISTINCT与GROUP BY的使用：
1.当对系统的性能高并且数据量大时使用GROUP BY
2.当对系统的性能不高时或者使用数据量少时两者借口
3.尽量使用GROUP BY
*/
