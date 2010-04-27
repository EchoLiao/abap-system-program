
------------------------------------------ 内嵌表值函数的定义 ----------------------------------------
use xsbook
if exists(select name from sysobjects where name='fn_view1' and type='if')
	drop function fn_view1
go
create function fn_view1(@zhuanyeming char(20)) returns table  -- 返回值为一个表
as
	return 
		(select 姓名, 借书证号, 性别
			from xs
			where 专业名=@zhuanyeming
		)
go


----------------------------------------- 内嵌表值函数的调用 -------------------------------------------------
select * from fn_view1(N'英语')
go