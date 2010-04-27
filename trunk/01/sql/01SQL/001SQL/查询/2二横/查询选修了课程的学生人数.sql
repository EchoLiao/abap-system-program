
/* 查询选修了课程的学生人数 */

use st
select count(sname)
from student

select count(*)
from sc

select count(distinct sno) /* 正确答案 */
from sc


select count(sno)
from sc
go