
/* ��ѯѧ��ƽ���ɼ���60�����ϵ�ѧ��ѧ�ź�ƽ���ɼ� */


USE ST
if exists(select name from sysobjects where name='SnoGrade' and type='v')
	drop view SnoGrade
go
create view SnoGrade(Sno, avg_Grade) /* ����һ����ͼ */
as
select sno, avg(Grade)
from sc
group by sno
go


select * 
from SnoGrade
where avg_Grade>=60
go


select  sno, avg(Grade)
from sc
group by sno
having avg(Grade)>=60
go