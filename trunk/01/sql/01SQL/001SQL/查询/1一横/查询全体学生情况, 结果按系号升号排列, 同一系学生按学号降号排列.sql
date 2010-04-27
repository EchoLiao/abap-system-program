
/* 查询全体学生情况, 结果按系号升号排列, 同一系学生按学号降号排列 */
use st
select *
from student
order by sdept asc, sno desc
go