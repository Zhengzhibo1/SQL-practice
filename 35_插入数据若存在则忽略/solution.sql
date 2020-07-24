/*
对于表actor批量插入如下数据,如果数据已经存在，请忽略(不支持使用replace操作)
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')))

actor_id	first_name	last_name   	last_update
'3'     	'ED'	      'CHASE'     	'2006-02-15 12:34:33'
*/

/*方法1 sqlite*/
INSERT OR IGNORE INTO actor(
    actor_id,
    first_name,
    last_name,
    last_update)
VALUES(
    '3',
    'ED',
    'CHASE',
    '2006-02-15 12:34:33'
);

/*方法2 mysql 区别：无OR*/
INSERT IGNORE INTO actor(
    actor_id,
    first_name,
    last_name,
    last_update)
VALUES(
    '3',
    'ED',
    'CHASE',
    '2006-02-15 12:34:33'
);
