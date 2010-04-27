-- E:\liaocaiyuan\Documents\01SQL\11图书借阅系统数据库设计\触发器设置

use xsbookk
go
create trigger tjyy_delete on jyy
	for delete -------------------
	as
	begin
		update xss  -- 列前缀 'xs' 与查询中所用的表名或别名不匹配。????????????????????????
			set 借书量=借书量-1
				where xs.借书证号 in (select deleted.借书证号 from deleted)
		update bookk
			set 库存量=库存量+1
				where bookk.isbn in (select deleted.isbn from deleted)
	end
go