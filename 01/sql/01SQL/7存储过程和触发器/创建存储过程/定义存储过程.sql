
/* 创建存储过程, 用于查询各个已借书的同学的借书情况 */
use xsbook
if exists(select name from sysobjects where name='readers_info' and type='p')
	drop procedure readers_info
go
create procedure readers_info
	as
	select distinct xs.借书证号,姓名,专业名,书名 --distinct关键字的意思：排除重复的数据, 即只列出一次
	from xs,jy,book
	where xs.借书证号=jy.借书证号 and jy.isbn=book.isbn
go

exec readers_info
go