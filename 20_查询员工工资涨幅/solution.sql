/*
查找员工编号emp_no为10001其自入职以来的薪水salary涨幅(总共涨了多少)growth(可能有多次涨薪，没有降薪)
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

/*方法1 利用ORDER BY 查找第一次、最后一次工资*/
SELECT ((SELECT salary
        FROM salaries
        WHERE emp_no = 10001
        ORDER BY to_date DESC LIMIT 1)
        - (SELECT salary 
           FROM salaries
          WHERE emp_no = 10001
          ORDER BY to_date LIMIT 1)) 
AS growth

/*方法2 利用Max和Min函数找出第一次和最后一次工资*/
SELECT ((SELECT salary
        FROM salaries
        WHERE emp_no = 10001
        AND to_date = (SELECT Max(to_date)
                      FROM salaries
                      WHERE emp_no = 10001))
        - (SELECT salary 
           FROM salaries
           WHERE emp_no = 10001
           AND to_date = (SELECT  Min(to_date)
                                     FROM salaries
                                     WHERE emp_no = 10001))) 
AS growth
