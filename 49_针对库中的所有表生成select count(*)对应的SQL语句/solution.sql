/*
针对库中的所有表生成select count(*)对应的SQL语句，如数据库里有以下表，
(注:在 SQLite 中用 “||” 符号连接字符串，无法使用concat函数)
employees
departments
dept_emp
dept_manage
salaries
titles
emp_bonus
*/

/*方法1 sqlite*/
SELECT "SELECT count(*) FROM " || name || ";" AS cnts
FROM sqlite_master
WHERE type = "table";
/*在 SQLite 系统表 sqlite_master 中可以获得所有表的索引，其中字段 name 是所有表的名字，而且对于自己创建的表而言，字段 type 永远是 'table'，*/

/*方法2 mysql*/
SELECT CONCAT("SELECT count(*) FROM ",table_name,";") AS cnts
FROM (SELECT table_name FROM information_schema.tables);
