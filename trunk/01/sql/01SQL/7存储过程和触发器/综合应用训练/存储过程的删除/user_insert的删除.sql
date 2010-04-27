use xsbook
if exists(select name from sysobjects where name='user_insert' and type='p')
	drop procedure user_insert
go