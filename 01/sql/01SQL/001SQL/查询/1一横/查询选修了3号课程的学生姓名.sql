
/* 查询选修了3号课程的学生姓名 */
use st
select sname
from student, sc
where student.sno=sc.sno
	and sc.cno='3'

select sname
from student 
where sno in
	(select sno
	from sc
	where cno='3'
	)
go

select Sname
from student 
where exists
	(select *
	from sc 	
	where student.sno=sc.sno
		and cno='3'
	)
go