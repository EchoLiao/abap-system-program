
use xsbookkk
go
create procedure xsss_insert
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime
	as
	insert into xsss(jszh, xm, zym, xb, cssj)
		values(@jszh, @xm, @zym, @xb, @cssj)
go