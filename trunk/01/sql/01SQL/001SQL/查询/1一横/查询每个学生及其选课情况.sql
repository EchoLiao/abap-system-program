-- E:\liaocaiyuan\Documents\001SQL\��ѯ\1һ��

/* ��ѯÿ��ѧ������ѡ����� */
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
from student right  join sc /* ������,   �ұ�����ȫ����� */
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, cno, grade
from student left  join  sc  /* ������,   �������ȫ����� */ 
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, cno, grade
from student full join  sc  /* ȫ����,  ȫ����� */ 
on student.sno=sc.sno  
go

select student.sno, sname, ssex, sage, sdept, course.cno, grade,cname, cpno, ccredit
from student left  join  sc   
on student.sno=sc.sno  
right join course   /* ȫ�������ȡ�������������� */
on sc.cno=course.cno
go