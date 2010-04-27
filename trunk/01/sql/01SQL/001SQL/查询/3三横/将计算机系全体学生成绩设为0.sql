
/* 将计算机系全体学生成绩设为0 */
--  三横
use st
update sc
	set Grade=0
	where sno in 
		(select sno
		from student 
		where sdept='cs'
		)
go

update sc
	set Grade=32
	where 'cs'=
		(select sdept
		from student
		where sno=sc.sno
		)
go