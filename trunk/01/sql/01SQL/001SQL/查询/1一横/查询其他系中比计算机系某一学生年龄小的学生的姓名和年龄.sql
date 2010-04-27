
/*  查询其他系中比计算机系某一学生年龄小的学生的姓名和年龄 */
use st
select Sname, Sage
from student 
where Sage < any
	(select sage
	from student	
	where sdept='cs'
	)
	and sdept<>'cs'
go

select sname, sage
from student
where sage < 
	(select max(sage)
	from student
	where sdept='cs'
	)
	and sdept<>'cs'
go