
/* 创建存储过程, 用于查询被借出的书的数量并可以赋予变量(output) */
create procedure LendedBookCount
	@total int output with encryption
	as
	select @total=count(*)
	from jy
go

declare @total int
exec LendedBookCount @total output
select @total
go
	