
/*  ��ѯѡ����ȫ���γ̵�ѧ������ */

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