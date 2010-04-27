
/* 计算个人的平均成绩 */
use st
select sno, avg(grade)
from sc
group by sno
go