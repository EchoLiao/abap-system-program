use xsbook
if exists(select name from sysobjects where name='insert_trigger' and type='tr')
	drop trigger insert_trigger
go
create trigger insert_trigger on users
	for insert 
	as
	if exists(select * from insertd 
			where username not in (select ����֤�� from xs) and grade=2)
	begin
		raiserror('Υ������һ����ԭ��', 16 , 1)
		rollback transaction
	end
go