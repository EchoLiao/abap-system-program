
/* 原先创建目的: 创建存储过程, 用于根据书名查询书籍具体信息 */ 
/* 修改BookInfoFromName: 用于根据出版社进行查询 */

alter procedure BookInfoFromName  
	@name varchar(23) with encryption -- 加密存储过程 
	as
	select *
	from book
	where 出版社 like @name
go
exec BookinfoFromName '电子%'
go
