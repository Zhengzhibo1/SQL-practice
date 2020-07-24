/*
删除emp_no重复的记录，只保留最小的id对应的记录。
CREATE TABLE IF NOT EXISTS titles_test (
id int(11) not null primary key,
emp_no int(11) NOT NULL,
title varchar(50) NOT NULL,
from_date date NOT NULL,
to_date date DEFAULT NULL);

insert into titles_test values ('1', '10001', 'Senior Engineer', '1986-06-26', '9999-01-01'),
('2', '10002', 'Staff', '1996-08-03', '9999-01-01'),
('3', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01'),
('4', '10004', 'Senior Engineer', '1995-12-03', '9999-01-01'),
('5', '10001', 'Senior Engineer', '1986-06-26', '9999-01-01'),
('6', '10002', 'Staff', '1996-08-03', '9999-01-01'),
('7', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01');
*/

/*方法1 WHERE子句嵌套子查询，每准备删一条语句就查询该语句的id是否等于该emp_no的最小id
若不等于，则删除*/
DELETE FROM titles_test AS t1
WHERE t1.id != (SELECT Min(id)
                FROM titles_test AS t2
                WHERE t2.emp_no = t1.emp_no
               );
       
/*方法2 子查询找出各emp_no中的最小id，不在其他的删除*/
DELETE FROM titles_test
WHERE id NOT IN (SELECT Min(id)
                 FROM titles_test
                 GROUP BY emp_no
                );
