/*
汇总各个部门当前员工的title类型的分配数目，即结果给出部门编号dept_no、dept_name、其部门下所有的当前(dept_emp.to_date = '9999-01-01')员工的当前(titles.to_date = '9999-01-01')title以及该类型title对应的数目count
(注：因为员工可能有离职，所有dept_emp里面to_date不为'9999-01-01'就已经离职了，不计入统计，而且员工可能有晋升，所以如果titles.to_date 不为 '9999-01-01'，那么这个可能是员工之前的职位信息，也不计入统计)
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);
*/

/*方法1 嵌套子查询，得到一个dept_no和title时，联合查找数量，但本题无法通过*/
SELECT DISTINCT d.dept_no, d.dept_name, t.title,
(SELECT COUNT(*)
 FROM dept_emp AS de2
 INNER JOIN titles AS t2
 ON de2.emp_no = t2.emp_no
 WHERE de2.to_date = '9999-01-01'
 AND t2.to_date = '9999-01-01'
 AND de2.dept_no = d.dept_no
 AND t2.title = t.title
) AS 'count'
FROM departments AS d, dept_emp AS de, titles AS t
WHERE d.dept_no = de.dept_no
AND de.emp_no = t.emp_no
AND de.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
ORDER BY d.dept_no;

/*方法2 GROUP BY 对dept_no和title进行分组*/
SELECT d.dept_no, d.dept_name, t.title, COUNT(*) AS 'count'
FROM departments AS d, dept_emp AS de, titles AS t
WHERE d.dept_no = de.dept_no
AND de.emp_no = t.emp_no
AND de.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
GROUP BY d.dept_no,t.title;
