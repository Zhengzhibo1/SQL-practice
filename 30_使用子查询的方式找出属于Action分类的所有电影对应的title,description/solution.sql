/*
CREATE TABLE IF NOT EXISTS film (
film_id smallint(5)  NOT NULL DEFAULT '0',
title varchar(255) NOT NULL,
description text,
PRIMARY KEY (film_id));

CREATE TABLE category  (
category_id  tinyint(3)  NOT NULL ,
name  varchar(25) NOT NULL, `last_update` timestamp,
PRIMARY KEY ( category_id ));

CREATE TABLE film_category  (
film_id  smallint(5)  NOT NULL,
category_id  tinyint(3)  NOT NULL, `last_update` timestamp);

你能使用子查询的方式找出属于Action分类的所有电影对应的title,description吗
*/

/*方法1 子查询创建Action分类电影ID表，然后两表联查*/
SELECT f.title, f.description
FROM film AS f, 
(SELECT fc.film_id
 FROM film_category AS fc 
 INNER JOIN category AS c
 ON fc.category_id = c.category_id
 WHERE c.name = 'Action'
) AS a
WHERE f.film_id = a.film_id;

/*方法2 将方法1中的子查询放到WHERE子句中*/
SELECT f.title, f.description
FROM film AS f
WHERE f.film_id IN (SELECT fc.film_id
                    FROM film_category AS fc 
                    INNER JOIN category AS c
                    ON fc.category_id = c.category_id
                    WHERE c.name = 'Action'
                   );
