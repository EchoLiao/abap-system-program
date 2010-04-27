
/* 查询与"刘晨"在同一个系学习的学生 */
 --  三横
use st
select *
from student 
where sdept = (select sdept
	from student
	where Sname='刘晨'
	)
go

select s1.*
from student s1, student s2
where s1.sdept=s2.sdept and s2.sname='刘晨'
go


select s1.*
from student s1
where exists
	(select *
	from student s2
	where s1.sdept=s2.sdept and s2.sname='刘晨'
	)
go
	