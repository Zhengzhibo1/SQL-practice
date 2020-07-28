/*
查找排除最大、最小salary之后的当前(to_date = '9999-01-01' )员工的平均工资avg_salary。
CREATE TABLE `salaries` ( `emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
如：
INSERT INTO salaries VALUES(10001,85097,'2001-06-22','2002-06-22');
INSERT INTO salaries VALUES(10001,88958,'2002-06-22','9999-01-01');
INSERT INTO salaries VALUES(10002,72527,'2001-08-02','9999-01-01');
INSERT INTO salaries VALUES(10003,43699,'2000-12-01','2001-12-01');
INSERT INTO salaries VALUES(10003,43311,'2001-12-01','9999-01-01');
INSERT INTO salaries VALUES(10004,70698,'2000-11-27','2001-11-27');
INSERT INTO salaries VALUES(10004,74057,'2001-11-27','9999-01-01');
*/

/*方法1 */
SELECT AVG(salary) AS avg_salary
FROM salaries
WHERE salary != (SELECT Max(salary) FROM salaries WHERE to_date = '9999-01-01')
AND salary != (SELECT Min(salary) FROM salaries WHERE to_date = '9999-01-01')
AND to_date = '9999-01-01' ;
/*注意筛选出当前日期的最大最小工资*/
