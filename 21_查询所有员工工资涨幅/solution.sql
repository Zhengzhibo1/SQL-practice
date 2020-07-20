/*
查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序
（注:可能有employees表和salaries表里存在记录的员工，有对应的员工编号和涨薪记录，但是已经离职了，离职的员工salaries表的最新的to_date!='9999-01-01'，这样的数据不显示在查找结果里面）
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL, --  '入职时间'
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL, --  '一条薪水记录开始时间'
`to_date` date NOT NULL, --  '一条薪水记录结束时间'
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 利用内联结创建sCurrent表和sStart表*/
SELECT sCurrent.emp_no, (sCurrent.salary - sStart.salary) AS growth
FROM (SELECT e.emp_no, s.salary
     FROM employees AS e INNER JOIN salaries AS s
     ON e.emp_no = s.emp_no
     WHERE s.to_date = '9999-01-01') AS sCurrent
INNER JOIN (SELECT e.emp_no, s.salary
           FROM employees AS e INNER JOIN salaries AS s
           ON e.emp_no = s.emp_no
           WHERE s.from_date = e.hire_date) AS sStart
ON sCurrent.emp_no = sStart.emp_no
ORDER BY growth;

