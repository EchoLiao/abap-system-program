

use xsbookk
go
create trigger tjyy_insert on jyy
	for insert -- 当向表插入数据时, insert触发器触发执行
	as
	begin
		update xss
			set 借书量=借书量+1
				where xs.借书证号 in (select insertd.借书证号 from insertd)
		update bookk
			set 库存量=库存量-1
				where book.isbn in (select insertd.isbn from insertd)
	end
go