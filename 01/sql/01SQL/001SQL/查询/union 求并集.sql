use st
select  *
from student 
where sdept='cs'

union  /* 用于求并集 */

select *
from student 
where Sage<=19
go