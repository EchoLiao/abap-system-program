
/* ɾ���������ѧϵ����ѧ����ѡ�μ�¼ */
use st
delete sc
where sno in
	(select sno
	from student 
	where sdept='cs'
	)
go

delete sc
where 'cs'=
	(select sdept
	from student
	where sc.sno=student.sno
	)
go