/*
create procedure readers_info
	as
	select distinct xs.����֤��,����,רҵ��,����
	from xs,jy,book
	where xs.����֤��=jy.����֤�� and jy.isbn=book.isbn

GO */
alter procedure readers_info
	as
	select distinct xs.����֤��,����,רҵ��,���� --distinct�ؼ��ֵ���˼���ų��ظ�������, ��ֻ�г�һ��.
	from xs,jy,book
	where xs.����֤��=jy.����֤�� and jy.isbn=book.isbn and רҵ��='�����'
go

exec readers_info
go