/*
针对actor表创建视图actor_name_view，只包含first_name以及last_name两列，并对这两列重新命名，first_name为first_name_v，last_name修改为last_name_v：
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')))
*/

/*方法1 第一个 AS 是创建视图语法中的一部分，而后面的两个 AS 只是为字段创建别名*/
CREATE VIEW actor_name_view AS
SELECT first_name AS first_name_v, last_name AS last_name_v
FROM actor;

/*方法2 在视图名后面的括号中创建视图字段名*/
CREATE VIEW actor_name_view(first_name_v, last_name_v) AS
SELECT first_name, last_name
FROM actor;
