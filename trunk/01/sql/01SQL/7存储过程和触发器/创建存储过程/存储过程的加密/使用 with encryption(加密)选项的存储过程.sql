

use xsbook
if exists(select name from sysobjects where name='encryption_this' and type='p')
	drop procedure encryption_this
go
create procedure encryption_this with encryption -- 加上with encryption关键字,目的是为了, 不让别的用户能够看到这此语句.
	as
	select *
	from xs
go

exec sp_helptext encryption_this
go