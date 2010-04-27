
--------------------- 用内嵌表值函数实现 ---------------------------
use xsbook
if exists(select name from sysobjects where name='book_infos' and type='if')
	drop function book_infos  -- 不能取名为book_info, 因为系统已有此函数
go
create function book_infos(@book_name char(26))
	returns table
	as
		return (select isbn, 书名, 作者, 出版社, 价格, 复本量, 库存量
				from book 
				where 书名=@book_name
			)
go

use xsbook
select * from book_infos(N'现代学原理')
go