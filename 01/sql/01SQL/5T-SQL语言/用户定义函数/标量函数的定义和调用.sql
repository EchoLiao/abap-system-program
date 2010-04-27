
/* 标量函数的定义 */
-- 定义一个函数求当前读者的平均年龄 
use xsbook -- 创建视图, 用于计算平均年龄
go
if exists(select name from sysobjects where name='view_avg' and type='v')
	drop view view_avg
go
create view view_avg
	as
	select 借书证号, 性别, datepart(yyyy,getdate())-datepart(yyyy,出生时间) as 年龄
	from xs
go




use xsbook
go 
if exists(select name from sysobjects where name='aver_avg' and type='fn')
	drop function aver_avg
go

------------------------------------------- 定义标量函数 ---------------------------------------------
create function aver_avg(@sex bit) returns int --是returns而不是return
as
	begin	
		declare @aver int
		select @aver=
			(select avg(年龄) -- 调用avg()函数求平均值. select语句只select一个内容,所以可将它赋给(=)某个变量.
				from view_avg
				where 性别=@sex
			)
		return @aver
	end
go

------------------------------------------- 标量函数的调用(用select) -----------------------------------
use xsbook
declare @sex bit
declare @aver int
select @sex=1 -- 给局部变量赋值, 用set也可以
select @aver=dbo.aver_avg(@sex) -- 调用用户自定义函数, 记得传递参数
select @aver as 女读者的平均年龄 -- 写成 '女读者的平均年龄' 也对(即加单引号).
------------------------------------------　标量函数的调用(用exec) ---------------------------------------
use xsbook
declare @aver2 int
exec @aver2=dbo.aver_avg @sex=0  -- 用exec执行(要记得给其传递参数)
select @aver2 as 男读者的平均年龄
go