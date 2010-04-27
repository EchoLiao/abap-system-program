use xsbook
if exists(select name from sysobjects where name='book_info' and type='p')
	drop procedure book_info
go
create procedure book_info
	@bname varchar(30)='%计算机%'
	as 
	select b.isbn, a.姓名, c.书名
	from xs a, historytable b, book c
	where a.借书证号=b.借书证号 and b.isbn=c.isbn
	and 书名 like @bname
go
exec book_info  /* 使用默认参数 */
go
exec book_info 'W%'
go
exec book_info'%'
go
exec book_info '**'
go
exec book_info '%[计]%'
go
