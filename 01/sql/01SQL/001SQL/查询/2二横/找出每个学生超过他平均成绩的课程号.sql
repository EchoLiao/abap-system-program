
/* 找出每个学生超过他平均成绩的课程号 */

use st
select sno, cno 课程号
from sc x
where Grade>  -- 必须保证子查询返回的只有一条记录, 才能在这运用比较符 
	(select avg(Grade)  
	from sc y
	where y.sno=x.sno
	--group by sno
	)
go
