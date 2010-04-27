
use xsbookk
go
create procedure xss_update
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jss int
	as
	update xss
		set 姓名=@xm, 专业名=@zym, 性别=@xb, 出生时间=@cssj, 借书量=@jss
go