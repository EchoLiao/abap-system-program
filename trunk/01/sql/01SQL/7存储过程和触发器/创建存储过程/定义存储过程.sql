
/* �����洢����, ���ڲ�ѯ�����ѽ����ͬѧ�Ľ������ */
use xsbook
if exists(select name from sysobjects where name='readers_info' and type='p')
	drop procedure readers_info
go
create procedure readers_info
	as
	select distinct xs.����֤��,����,רҵ��,���� --distinct�ؼ��ֵ���˼���ų��ظ�������, ��ֻ�г�һ��
	from xs,jy,book
	where xs.����֤��=jy.����֤�� and jy.isbn=book.isbn
go

exec readers_info
go