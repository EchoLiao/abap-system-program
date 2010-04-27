use xsbook
if exists(select name from sysobjects where name='user_delete' and type='p')
	drop procedure user_delete
go
create procedure user_delete 
	@uname1 char(8), @uname2 char(8)
	as 
	if exists(select * from users where username=@uname1 and grade=1)
		delete
			from users
			where username=@uname2
go