
/* ������Ϣϵѧ������ͼ, ��Ҫ������޸ĺͲ����ɾ������ʱ���豣֤����ͼֻ����Ϣϵ��ѧ�� */

use st
if exists(select name from sysobjects where name='IS_Student' and type='v')
	drop view IS_Student
go  
create view IS_Student  -- 'CREATE VIEW' ����������ѯ�еĵ�һ����䡣
as
select *
from student 
where sdept='IS' 
with check option  -- �����޸ĺͲ����ɾ������ʱ���豣֤����ͼֻ����Ϣϵ��ѧ��
go