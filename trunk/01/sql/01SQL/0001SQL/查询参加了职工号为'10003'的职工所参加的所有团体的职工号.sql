
/* ��ѯ�μ���ְ����Ϊ'10003'��ְ�����μӵ����������ְ���� */
use jigongshetuan
select distinct jghao
from cjia a
where not exists(select *
	from cjia b
	where b.jghao='10003' and not exists(select *
		from cjia c
		where a.jghao=c.jghao and b.bhao=c.bhao))
go

select *
from jgong
where jghao in 
(select distinct jghao
from cjia a
where not exists(select *
	from cjia b
	where b.jghao='10003' and not exists(select *
		from cjia c
		where a.jghao=c.jghao and b.bhao=c.bhao))
)