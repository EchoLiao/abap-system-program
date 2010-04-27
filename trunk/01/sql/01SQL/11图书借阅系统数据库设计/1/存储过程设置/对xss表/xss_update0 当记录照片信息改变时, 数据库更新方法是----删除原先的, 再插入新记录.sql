
/*  当记录照片信息改变时, 数据库更新方法是: 删除原先的, 再插入新记录 */
use xsbookk
go
create procedure xss_update0
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jss int
	as
	delete xss
		where 借书证号=@jszh
	insert xs(借书证号, 姓名, 专业名, 性别, 出生时间, 借书数)
		values(@jszh, @xm, @zym, @xb, @cssj, @jss)
go
	