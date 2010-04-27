
-- 要求:  2. 编写一个函数, 按性别统计年平均读书量. 并调用测试
use xsbook
go
if exists(select name from sysobjects where name='aver_stat' and type='fn')
	drop function aver_stat
go
create function aver_stat(@sex bit, @year datetime)
	returns int
	as
	begin
		declare @sum1 int, @sum2 int, @aver int
		select @sum1=(select count(索书号) -- 第一个select换成set也可以.
				from historytable ,xs
				where datepart(yy, 借书时间)=datepart(yy,@year) 
					and historytable.借书证号=xs.借书证号
					and xs.性别=@sex
			)
		set @sum2=(select count(distinct historytable.借书证号)
				from historytable, xs
				where datepart(yy, 借书时间)=datepart(yy,@year)
					and historytable.借书证号=xs.借书证号 
					and xs.性别=@sex
			)
	select @aver=@sum1/@sum2
	return @aver
	end
go 





use xsbook
go
declare @ave int
select @ave=[dbo].aver_stat(1,'2008') -- 为什么要[dbo]??????????????????????????????????????????????????????
select @ave
					