
/* 查询学生平均成绩在60分以上的学生学号和平均成绩 */


USE ST
if exists(select name from sysobjects where name='SnoGrade' and type='v')
	drop view SnoGrade
go
create view SnoGrade(Sno, avg_Grade) /* 定义一个视图 */
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