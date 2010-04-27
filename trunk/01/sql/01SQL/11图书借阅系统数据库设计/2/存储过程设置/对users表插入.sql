use xsbookkk
go
create procedure users_insert
	@username char(8) , @passwd char(10), @grade smallint
	as
	insert into users(username, passwd, grade)
		values(@username , @passwd, @grade)
go