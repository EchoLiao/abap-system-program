use xsbook
if exists(select name from sysobjects where name='book_info' and type='p')
	drop procedure book_info
go
create procedure book_info
	@bname varchar(30)='%�����%'
	as 
	select b.isbn, a.����, c.����
	from xs a, historytable b, book c
	where a.����֤��=b.����֤�� and b.isbn=c.isbn
	and ���� like @bname
go
exec book_info  /* ʹ��Ĭ�ϲ��� */
go
exec book_info 'W%'
go
exec book_info'%'
go
exec book_info '**'
go
exec book_info '%[��]%'
go
