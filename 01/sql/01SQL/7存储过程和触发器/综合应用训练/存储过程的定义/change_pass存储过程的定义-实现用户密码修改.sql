use xsbook
go
if exists(select name from sysobjects where name='change_pass' and type='p')
	drop procedure change_pass
go
create procedure change_pass
	@username char(8), @oldpass char(10) , @newpass char(10)
	as
	update users
	 	set users.pass=@newpass
		where users.username=@username and users.pass=@oldpass
go