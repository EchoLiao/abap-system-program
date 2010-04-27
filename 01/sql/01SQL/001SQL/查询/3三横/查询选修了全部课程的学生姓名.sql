
/*  查询选修了全部课程的学生姓名 */

use st
select Sname
from Student 
where not exists
	(select *
	from Course
	where not exists
		(select *
		from SC
		where Sno=Student.Sno and Cno=Course.Cno
		)
	)
go