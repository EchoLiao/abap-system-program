
use xsbookkk
go
if exists(select name from sysobjects where name='xsss_update' and type='p')
	drop procedure xsss_update
go
create procedure xsss_update
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jsl int
	as
	update xsss
		set xm=@xm, zym=@zym, xb=@xb, cssj=@cssj, jsl=@jsl
	where xsss.jszh=@jszh
go