
/* ��ѯ��"����"��ͬһ��ϵѧϰ��ѧ�� */
 --  ����
use st
select *
from student 
where sdept = (select sdept
	from student
	where Sname='����'
	)
go

select s1.*
from student s1, student s2
where s1.sdept=s2.sdept and s2.sname='����'
go


select s1.*
from student s1
where exists
	(select *
	from student s2
	where s1.sdept=s2.sdept and s2.sname='����'
	)
go
	