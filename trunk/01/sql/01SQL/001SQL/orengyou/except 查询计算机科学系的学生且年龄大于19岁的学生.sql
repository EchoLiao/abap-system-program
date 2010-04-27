
/* except 查询计算机科学系的学生且年龄大于19岁的学生 */
use st
select *
from student
where sdept='cs' and sage>19
go

select *
from student 
where sdept='cs'
except  -- 求差集     为什么会有错???????????????????????
select *
from student
where sage<=19
go