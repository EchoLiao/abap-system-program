
/*  当记录照片信息改变时, 数据库更新方法是: 删除原先的, 再插入新记录 */
use xsbookkk
go
create procedure xsss_update0
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jsl int
	as
	delete xsss
		where jszh=@jszh
	insert xsss(jszh, xm, zym, xb, cssj, jsl)
		values(@jszh, @xm, @zym, @xb, @cssj, @jsl)
go
	