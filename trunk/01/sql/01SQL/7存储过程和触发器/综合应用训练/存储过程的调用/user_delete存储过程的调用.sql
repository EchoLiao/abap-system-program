use xsbook
select *
	from users
go
exec user_delete 'liao', 'liao'
go
select *
	from users
go