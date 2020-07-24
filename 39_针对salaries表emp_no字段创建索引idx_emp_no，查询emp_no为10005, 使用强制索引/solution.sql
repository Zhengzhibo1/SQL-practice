/*
针对salaries表emp_no字段创建索引idx_emp_no，查询emp_no为10005, 使用强制索引。
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
create index idx_emp_no on salaries(emp_no);
*/

/*注：题目默认已经创建好索引，索引创建语句如下*/
CREATE INDEX idx_emp_no ON salaries(emp_no);

/*方法1 sqlite中的强制索引 INDEXED BY*/
SELECT * 
FROM salaries 
INDEXED BY idx_emp_no 
WHERE emp_no = 10005;

/*方法2 mysql中的强制索引 FORCE INDEX*/
SELECT * 
FROM salaries 
FORCE INDEX idx_emp_no 
WHERE emp_no = 10005;
