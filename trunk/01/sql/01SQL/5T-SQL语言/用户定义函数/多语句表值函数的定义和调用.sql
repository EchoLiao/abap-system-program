
----------------------------------------- 多语句表值函数的定义 -------------------------------------------------
use xsbook
go
if exists(select name from sysobjects where name='book_readers' and type='tf')
	drop function book_readers
go
create function book_readers (@isbn_id char(16)) -- 说明参数
	returns @readers_list table -- 说明返回值
		(isbn_id char(16),
		 book_name char(26),
		 search_num char(10),
		 readr_num char(8),
		 readr_name char(8)
		)
	as
	begin
		insert @readers_list -- insert的意思是: 把select后返回的数据放到@readers_list中.
			select jy.isbn,  book.书名,  jy.索书号,   xs.借书证号, xs.姓名
				from [dbo].xs, [dbo].jy, [dbo].book
				where  jy.isbn=@isbn_id and jy.isbn=book.isbn and jy.借书证号=xs.借书证号 
		return 
	end
go


--------------------------------------- 多语句表值函数的调用 --------------------------------------------------------------
select * from book_readers('5-332-22200-1')
go