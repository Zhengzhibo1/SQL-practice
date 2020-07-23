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

查找描述信息(film.description)中包含robot的电影对应的分类名称(category.name)以及电影数目(count(film.film_id))，
而且还需要该分类包含电影总数量(count(film_category.category_id))>=5部
*/

/*方法1 先查出film_category分类下电影数大于5部的分类电影表，然后多表联查*/
SELECT c.name, COUNT(f.film_id)
FROM category AS c, film_category AS fc, film AS f,
(SELECT category_id
 FROM film_category
 GROUP BY category_id
 HAVING COUNT(film_id) >= 5
) AS c5
WHERE f.description LIKE '%robot%'
AND c.category_id = fc.category_id
AND fc.film_id = f.film_id
AND c.category_id = c5.category_id
GROUP BY c.category_id;

/*方法2 将方法1中的子查询放到WHERE语句中*/
SELECT c.name, COUNT(f.film_id)
FROM category AS c, film_category AS fc, film AS f
WHERE f.description LIKE '%robot%'
AND c.category_id = fc.category_id
AND fc.film_id = f.film_id
AND c.category_id IN (SELECT category_id
                      FROM film_category
                      GROUP BY category_id
                      HAVING COUNT(film_id) >= 5
                     )
GROUP BY c.category_id;
