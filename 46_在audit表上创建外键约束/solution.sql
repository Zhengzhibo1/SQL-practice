/*
在audit表上创建外键约束，其emp_no对应employees_test表的主键id。
(audit已经创建，需要先drop)
CREATE TABLE employees_test(
ID INT PRIMARY KEY NOT NULL,
NAME TEXT NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(50),
SALARY REAL
);

CREATE TABLE audit(
EMP_no INT NOT NULL,
create_date datetime NOT NULL
);
(注：创建表的时候，字段的顺序不要改变)
*/

/*方法1 sqlite只能在创建表的过程中指定外键，所以要删除已经存在的表*/
DROP TABLE audit;
CREATE TABLE audit(
  EMP_no INT NOT NULL,
  create_date datetime NOT NULL,
  FOREIGN KEY(EMP_no) REFERENCES employees_test(ID));
  
/*方法2 mysql可以针对存在的表增加外键*/
ALTER TABLE audit
ADD FOREIGN KEY(EMP_no) REFERENCES employees_test(ID);
 
