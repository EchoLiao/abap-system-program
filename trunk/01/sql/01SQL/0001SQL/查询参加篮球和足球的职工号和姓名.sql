
use jigongshetuan
/* ��ѯ�μ�����������ְ���ź����� */

select jghao,xming
from cjrqkuang
where stmcheng='����' and 
	jghao in (select jghao
		from cjrqkuang
		where stmcheng='����')
go

select cjia.jghao, xming
from jgong ,shtti,cjia
where jgong.jghao=cjia.jghao and shtti.bhao=cjia.bhao
	and mcheng='����'
	and cjia.jghao in (select cjia.jghao
		from shtti, cjia
		where cjia.bhao=shtti.bhao and mcheng='����' )
go