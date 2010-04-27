
/* 删除计算机科学系所有学生的选课记录 */
use st
delete sc
where sno in
	(select sno
	from student 
	where sdept='cs'
	)
go

delete sc
where 'cs'=
	(select sdept
	from student
	where sc.sno=student.sno
	)
go