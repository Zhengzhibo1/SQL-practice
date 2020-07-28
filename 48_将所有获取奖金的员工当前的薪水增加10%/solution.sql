/*
请你写出更新语句，将所有获取奖金的员工当前的(salaries.to_date='9999-01-01')薪水增加10%。(emp_bonus里面的emp_no都是当前获奖的所有员工)
create table emp_bonus(
emp_no int not null,
btype smallint not null);
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL, PRIMARY KEY (`emp_no`,`from_date`));
如：
INSERT INTO emp_bonus VALUES (10001,1);
INSERT INTO salaries VALUES(10001,85097,'2001-06-22','2002-06-22');
INSERT INTO salaries VALUES(10001,88958,'2002-06-22','9999-01-01');
*/

/*方法1 子查询*/
UPDATE salaries
SET salary = salary * 1.1
WHERE emp_no IN (SELECT emp_no FROM emp_bonus)
AND to_date = '9999-01-01';
