
/* ��ѯû�вμ��κ���������ְ���ź����� */
use jigongshetuan
select jghao, xming
from jgong
where jghao not in (select jghao
	from cjia )
go

select *
from jgong
