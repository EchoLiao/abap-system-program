
----------------------------------------- ������ֵ�����Ķ��� -------------------------------------------------
use xsbook
go
if exists(select name from sysobjects where name='book_readers' and type='tf')
	drop function book_readers
go
create function book_readers (@isbn_id char(16)) -- ˵������
	returns @readers_list table -- ˵������ֵ
		(isbn_id char(16),
		 book_name char(26),
		 search_num char(10),
		 readr_num char(8),
		 readr_name char(8)
		)
	as
	begin
		insert @readers_list -- insert����˼��: ��select�󷵻ص����ݷŵ�@readers_list��.
			select jy.isbn,  book.����,  jy.�����,   xs.����֤��, xs.����
				from [dbo].xs, [dbo].jy, [dbo].book
				where  jy.isbn=@isbn_id and jy.isbn=book.isbn and jy.����֤��=xs.����֤�� 
		return 
	end
go


--------------------------------------- ������ֵ�����ĵ��� --------------------------------------------------------------
select * from book_readers('5-332-22200-1')
go