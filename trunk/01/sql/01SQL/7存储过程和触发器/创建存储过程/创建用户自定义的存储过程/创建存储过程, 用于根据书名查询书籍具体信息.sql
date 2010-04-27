
/* 创建存储过程, 用于根据书名查询书籍具体信息 */
use xsbook
if exists(select name from sysobjects where name='BookInfoFromName' and type='p')
	drop procedure BookInfoFromName
go
create procedure BookInfoFromName 
	@name varchar(20)='C%'
	as
	select *
	from book
	where 书名 like @name
go

exec BookInfoFromName  's%'
