
/* ��ѯ����ѡ����ѧ��200215122ѡ�޵�ȫ���γ̵�ѧ������ */

use st
/*
select Sno, Sname
from student
where sno in (  */

select distinct Sno
from SC x
where not exists 
	(select *
	from SC y
	where y.Sno='200215122' and 
		not exists
			(select *
			from SC z
			where z.Sno=x.Sno and z.Cno=y.Cno
			)
	) 

	--)
	--and Sno<>'200215122'
go