/*
查找当前薪水(to_date='9999-01-01')排名第二多的员工编号emp_no、薪水salary、last_name以及first_name，你可以不使用order by完成吗
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 Max*/
SELECT employees.emp_no, salaries.salary, employees.last_name, employees.first_name
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE to_date='9999-01-01'
AND salary = (SELECT Max(salary)
               FROM salaries
               WHERE to_date='9999-01-01'
               AND salary < (SELECT Max(salary)
                              FROM salaries
                              WHERE to_date='9999-01-01')
               );
/*方法2 自联结和<=号配合COUNT函数*/
SELECT employees.emp_no, salaries.salary, employees.last_name, employees.first_name
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE to_date='9999-01-01'
AND salary = (SELECT s1.salary
             FROM salaries AS s1 INNER JOIN salaries AS s2
             ON s1.to_date='9999-01-01'
             AND s1.to_date='9999-01-01'
             WHERE s1.salary <= s2.salary           /*举例：假设工资1、2、3、4、5， 以<= ,s1分组有 1（1，2，3，4，5），2（2，3，4，5），3（3，4，5）*/
             GROUP BY s1.salary                     /*4（4，5），5（5），故以s1分组后计算不同s2的数量为2，即为第二高工资。若用<，则不同s2数量为1时，工资第二高*/
             HAVING COUNT(DISTINCT s2.salary) = 2);
