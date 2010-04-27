
/* 查询选修了2门以上课程的学生学号 */
use st
select sno, count(cno)
from sc
group by sno
having count(cno)>=2
