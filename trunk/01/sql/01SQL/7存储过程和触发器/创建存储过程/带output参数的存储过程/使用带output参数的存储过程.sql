use xsbook
if exists(select name from sysobjects where name='havereader_info' and type='p')
	drop procedure havereader_info
go
create procedure havereader_info
	@bname char(26),@startdate datetime, @enddate datetime, @total int output
	as
	select @total=count(b.isbn)
	from historytable a , book b
	where a.isbn=b.isbn and 书名 like @bname and 借书时间>=@startdate and 借书时间<=@enddate
go

declare @book_na  char(24),@tot  int 
set @book_na='WEB程序设计'
exec havereader_info @book_na ,'2008-01-01','2008-12-12',@tot output   /* 在创建表和使用output变量时, 都必须对output变量进行定义 */
select @book_na  as 书名,   @tot  as 借阅次数
go 