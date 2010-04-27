use xsbook
if exists(select name from sysobjects where name='insert_trigger' and type='tr')
	drop trigger insert_trigger
go
create trigger insert_trigger on users
	for insert 
	as
	if exists(select * from insertd 
			where username not in (select 借书证号 from xs) and grade=2)
	begin
		raiserror('违背数据一致性原则', 16 , 1)
		rollback transaction
	end
go