/*
构造一个触发器audit_log，在向employees_test表中插入一条数据的时候，触发插入相关的数据到audit中。
CREATE TABLE employees_test(
ID INT PRIMARY KEY NOT NULL,
NAME TEXT NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(50),
SALARY REAL
);
CREATE TABLE audit(
EMP_no INT NOT NULL,
NAME TEXT NOT NULL
);
*/

/*
1、用 CREATE TRIGGER 语句构造触发器，用 BEFORE或AFTER 来指定在执行后面的SQL语句之前或之后来触发TRIGGER
2、触发器执行的内容写出 BEGIN与END 之间,且语句要写分号
3、触发器中可以通过NEW获得触发事件之后对应的tablename的相关列的值，OLD获得触发事件之前对应的tablename的相关列的值
*/

/*方法1 */
CREATE TRIGGER audit_log AFTER INSERT ON employees_test
BEGIN
    INSERT INTO audit(emp_no, name) VALUES (NEW.id, NEW.name);
END;
