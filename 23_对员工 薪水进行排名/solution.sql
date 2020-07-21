/*
对所有员工的当前(to_date='9999-01-01')薪水按照salary进行按照1-N的排名，相同salary并列且按照emp_no升序排列
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 嵌套子查询，对每一个emp_no，查询一个排名*/
SELECT s1.emp_no, s1.salary, (SELECT COUNT(DISTINCT s2.salary)
                             FROM salaries AS s2
                             WHERE s2.to_date = '9999-01-01'
                             AND s2.salary >= s1.salary) AS rank
FROM salaries AS s1
WHERE s1.to_date = '9999-01-01'
ORDER BY s1.salary DESC, s1.emp_no;

/*方法2 先创建排名表，再内联结*/
SELECT s.emp_no, s.salary, b.rank
FROM salaries AS s INNER JOIN (SELECT s1.emp_no, COUNT(DISTINCT s2.salary) AS rank
                              FROM salaries AS s1, salaries AS s2
                              WHERE s2.salary >= s1.salary
                               AND s1.to_date = '9999-01-01'
                               AND s2.to_date = '9999-01-01'
                              GROUP BY s1.emp_no) AS b
ON s.emp_no = b.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC, s.emp_no;
