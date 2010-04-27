
/*  查询各门课的选课人数 */
use st
select cno,count(sno)
from sc
group by cno
go
