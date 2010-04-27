

use xsbook
if exists(select name from sysobjects where name='book_infos2' and type='tf')
	drop function book_infos2
go
create function book_infos2(@book_name char(26))
	returns @infos_list table
		(isbn char(16),
		 ���� char(26),
		 ���� char(8),
		 ������ char(20),
		 �۸� float,
		 ������ int,
		 ����� int
		)
	as 
	begin
	insert @infos_list
		select isbn, ����, ����, ������, �۸�, ������, �����
			from book 
			where ����=@book_name
	return -- ��Ҫ����д.
	end
go

select * from book_infos2('�ִ�ѧԭ��')
