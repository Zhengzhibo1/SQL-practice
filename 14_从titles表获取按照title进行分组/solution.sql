/*
从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
注意对于重复的emp_no进行忽略(即emp_no重复的title不计算，title对应的数目t不增加)。
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);
*/

/*方法1 去重计算*/
SELECT title, COUNT(DISTINCT emp_no) AS t
FROM titles
GROUP BY title
HAVING t >= 2;

/*方法2 子查询，先去重再计数*/
SELECT title, COUNT(*) AS t
FROM (SELECT DISTINCT title, emp_no 
     FROM titles)
GROUP BY title
HAVING t >= 2;
