
/* ��ѯ������"��Ϣϵͳ"��ѧ��ѧ�ź����� */

use st
select student.sno, sname
from student, course, sc
where student.sno=sc.sno and course.cno=sc.cno
	and course.Cname='��Ϣϵͳ'
go


select sno, sname
from student
where sno in 
	(select sno
	from sc
	where cno in
		(select cno
		from course
		where cname='��Ϣϵͳ'
		)
	)
go
