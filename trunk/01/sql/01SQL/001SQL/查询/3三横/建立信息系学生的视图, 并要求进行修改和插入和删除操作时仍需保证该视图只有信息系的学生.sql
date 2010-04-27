
/* 建立信息系学生的视图, 并要求进行修改和插入和删除操作时仍需保证该视图只有信息系的学生 */

use st
if exists(select name from sysobjects where name='IS_Student' and type='v')
	drop view IS_Student
go  
create view IS_Student  -- 'CREATE VIEW' 必须是批查询中的第一条语句。
as
select *
from student 
where sdept='IS' 
with check option  -- 进行修改和插入和删除操作时仍需保证该视图只有信息系的学生
go