

use xsbook
if exists(select name from sysobjects where name='book_infos2' and type='tf')
	drop function book_infos2
go
create function book_infos2(@book_name char(26))
	returns @infos_list table
		(isbn char(16),
		 书名 char(26),
		 作者 char(8),
		 出版社 char(20),
		 价格 float,
		 复本量 int,
		 库存量 int
		)
	as 
	begin
	insert @infos_list
		select isbn, 书名, 作者, 出版社, 价格, 复本量, 库存量
			from book 
			where 书名=@book_name
	return -- 不要忘了写.
	end
go

select * from book_infos2('现代学原理')
