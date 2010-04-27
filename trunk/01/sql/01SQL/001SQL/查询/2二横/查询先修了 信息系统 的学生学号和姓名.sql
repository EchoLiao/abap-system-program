
/* 查询先修了"信息系统"的学生学号和姓名 */

use st
select student.sno, sname
from student, course, sc
where student.sno=sc.sno and course.cno=sc.cno
	and course.Cname='信息系统'
go


select sno, sname
from student
where sno in 
	(select sno
	from sc
	where cno in
		(select cno
		from course
		where cname='信息系统'
		)
	)
go
