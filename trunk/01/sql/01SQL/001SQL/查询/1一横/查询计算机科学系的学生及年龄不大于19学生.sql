
/* ��ѯ�������ѧϵ��ѧ�������䲻����19ѧ�� */
select *
from student
where sdept='cs' or sage<=19
go

select *
from student
where sdept='cs'
union --all
select *
from student 
where sage<=19
go

