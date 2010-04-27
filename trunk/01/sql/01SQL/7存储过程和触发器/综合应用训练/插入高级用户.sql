use xsbook
select *
	from users
go
insert into users(username, pass, grade)
	values('liao', 'liao', 1)
go
insert into users(username, pass, grade)
	values('liao2', 'liao', 1)
go
insert into users(username, pass, grade)
	values('liao3', 'liao', 1)
select *
	from users
go