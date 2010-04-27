
/* 查询每门课程的间接先修课 */
use st
select c1.cno, c2.Cpno
from course c1, course c2 
where c1.Cpno=c2.cno  

select *
from course
