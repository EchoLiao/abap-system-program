
/* except ��ѯ�������ѧϵ��ѧ�����������19���ѧ�� */
use st
select *
from student
where sdept='cs' and sage>19
go

select *
from student 
where sdept='cs'
except  -- ��     Ϊʲô���д�???????????????????????
select *
from student
where sage<=19
go