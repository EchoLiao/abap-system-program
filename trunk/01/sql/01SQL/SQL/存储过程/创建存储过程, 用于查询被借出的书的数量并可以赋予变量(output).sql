
/* �����洢����, ���ڲ�ѯ�������������������Ը������(output) */
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
	