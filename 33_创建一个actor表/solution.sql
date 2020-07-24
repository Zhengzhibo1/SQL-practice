/*
创建一个actor表，包含如下列信息(注：sqlite获取系统默认时间是datetime('now','localtime'))
列表	      类型	        是否为NULL	   含义
actor_id	  smallint(5)	  not null	   主键id
first_name	varchar(45)	  not null	   名字
last_name	  varchar(45)	  not null	   姓氏
last_update	timestamp	    not null	   最后更新时间，默认是系统的当前时间
*/

/*方法1 */
CREATE TABLE actor
(
    actor_id smallint(5) NOT NULL,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')),
    PRIMARY KEY (actor_id)
)
