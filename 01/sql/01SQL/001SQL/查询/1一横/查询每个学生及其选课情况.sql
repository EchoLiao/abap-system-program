-- E:\liaocaiyuan\Documents\001SQL\查询\1一横

/* 查询每个学生及其选课情况 */
use st
select student.*, sc.*
from student, sc
where student.sno=sc.sno
go

select student.sno, sname, ssex, sage, sdept, cno, grade 
from student , sc
where student.sno=sc.sno
go


select student.sno, sname, ssex, sage, sdept, cno, grade
from student right  join sc /* 右连接,   右表数据全部输出 */
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, cno, grade
from student left  join  sc  /* 左连接,   左表数据全部输出 */ 
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, cno, grade
from student full join  sc  /* 全连接,  全部输出 */ 
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, course.cno, grade,cname, cpno, ccredit
from student left  join  sc   
on student.sno=sc.sno  
right join course   /* 全部输出的取决于最后这条语句 */
on sc.cno=course.cno
go