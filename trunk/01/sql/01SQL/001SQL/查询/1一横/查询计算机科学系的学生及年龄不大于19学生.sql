
/* 查询计算机科学系的学生及年龄不大于19学生 */
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

