
use xsbookk
go
create procedure xss_insert
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime
	as
	insert into xss(借书证号, 姓名, 专业名, 性别, 出生时间)
		values(@jszh, @xm, @zym, @xb, @cssj)
go