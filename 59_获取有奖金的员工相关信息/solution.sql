/*
获取有奖金的员工相关信息。
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
create table emp_bonus(
emp_no int not null,
received datetime not null,
btype smallint not null);
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL, PRIMARY KEY (`emp_no`,`from_date`));
给出emp_no、first_name、last_name、奖金类型btype、对应的当前薪水情况salary以及奖金金额bonus。 
bonus类型btype为1其奖金为薪水salary的10%，btype为2其奖金为薪水的20%，其他类型均为薪水的30%。 
当前薪水表示to_date='9999-01-01'
*/

/*方法1 多表联查，可用内联结代替，此处使用WHERE*/
SELECT em.emp_no, em.first_name, em.last_name, eb.btype, s.salary, s.salary / 10.0 * eb.btype AS bonus
FROM employees AS em, emp_bonus AS eb, salaries AS s
WHERE em.emp_no = eb.emp_no
AND em.emp_no = s.emp_no
AND s.to_date = '9999-01-01';

/*方法2 CASE表达式，同样多表联查，可用内联结代替*/
SELECT em.emp_no, em.first_name, em.last_name, eb.btype, s.salary, 
(CASE eb.btype
 WHEN 1 THEN s.salary * 0.1
 WHEN 2 THEN s.salary * 0.2
 ELSE s.salary * 0.3 END
) AS bonus
FROM employees AS em, emp_bonus AS eb, salaries AS s
WHERE em.emp_no = eb.emp_no
AND em.emp_no = s.emp_no
AND s.to_date = '9999-01-01';
