/*
存在actor表，包含如下列信息：
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')));
现在在last_update后面新增加一列名字为create_date, 类型为datetime, NOT NULL，默认值为'0000-00-00 00:00:00'
*/

/*用 ALTER TABLE ... ADD ... 语句向已存在的表插入新字段*/

/*方法1 */
ALTER TABLE actor
ADD create_date datetime NOT NULL DEFAULT('0000-00-00 00:00:00');

/*方法2 */
ALTER TABLE actor
ADD COLUMN create_date datetime DEFAULT('0000-00-00 00:00:00') NOT NULL;

/*区别：COLUMN 可以省略，NOT NULL 与 DEFAULT 可以交换位置*/
