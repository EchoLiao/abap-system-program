
/* 查询90分以上的学生的学号及人数(课程号为3) */
use st
select sno 
from sc
where grade>=90 and cno='3'

select count(sno)
from sc
where grade>=90 and cno='3'
