
/*  ��ѯ����ϵ�бȼ����ϵĳһѧ������С��ѧ�������������� */
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