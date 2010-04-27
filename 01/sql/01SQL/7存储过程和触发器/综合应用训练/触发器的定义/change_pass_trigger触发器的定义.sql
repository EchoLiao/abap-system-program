use xsbook
if exists(select name from sysobjects where name='pass_trigger' and  type='tr')
	drop trigger pass_trigger
go                                                             
create trigger pass_trigger on users
	for update 
	as
	if exists(select username from users where username='liao')
		begin
			select username from users --where username='liao'
		end
go