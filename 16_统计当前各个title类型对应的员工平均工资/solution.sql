/*
统计出当前(titles.to_date='9999-01-01')各个title类型对应的员工当前(salaries.to_date='9999-01-01')薪水对应的平均工资。结果给出title以及平均工资avg。
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);
*/

/* 方法1 内联结*/
SELECT title, AVG(salary) AS avg
FROM salaries INNER JOIN titles
ON salaries.emp_no = titles.emp_no
AND titles.to_date='9999-01-01'
AND salaries.to_date='9999-01-01'
GROUP BY title;

/*方法2 WHERE连接两个表*/
SELECT title, AVG(salary)
FROM salaries, titles
WHERE salaries.emp_no = titles.emp_no
AND titles.to_date='9999-01-01'
AND salaries.to_date='9999-01-01'
GROUP BY title;
注意：AVG(*)是自动命名为avg的，所以不用重命名
