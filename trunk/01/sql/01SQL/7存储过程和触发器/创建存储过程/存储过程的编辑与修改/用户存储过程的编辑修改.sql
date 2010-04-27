/*
create procedure readers_info
	as
	select distinct xs.借书证号,姓名,专业名,书名
	from xs,jy,book
	where xs.借书证号=jy.借书证号 and jy.isbn=book.isbn

GO */
alter procedure readers_info
	as
	select distinct xs.借书证号,姓名,专业名,书名 --distinct关键字的意思：排除重复的数据, 即只列出一次.
	from xs,jy,book
	where xs.借书证号=jy.借书证号 and jy.isbn=book.isbn and 专业名='计算机'
go

exec readers_info
go