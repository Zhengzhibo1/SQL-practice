/*
获取当前（to_date='9999-01-01'）薪水第二多的员工的emp_no以及其对应的薪水salary
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 DISTINCT + 子查询*/
SELECT emp_no, salary
FROM salaries
WHERE to_date='9999-01-01'
AND salary = (SELECT DISTINCT salary
               FROM salaries
               ORDER BY salary DESC
               LIMIT 1,1);
              
/*方法2 GROUP BY + 子查询*/
SELECT emp_no, salary
FROM salaries
WHERE to_date='9999-01-01'
AND salary = (SELECT salary
               FROM salaries
               GROUP BY salary
               ORDER BY salary DESC
               LIMIT 1 OFFSET 1);
