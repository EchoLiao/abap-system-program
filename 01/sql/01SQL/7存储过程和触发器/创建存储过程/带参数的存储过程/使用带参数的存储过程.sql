use xsbook
if exists(select name from sysobjects where name='reader_info' and type='p')
	drop procedure reader_info
go
create procedure reader_info
	@lib_num varchar(8)='10000001' /* �����ֲ����� */ -- ��Ҫ�ڲ�ѯ��ʹ��ͨ���, �����ʹ��varchar����
	as
	select a.����֤��,a.����, c.����, b.����ʱ��
	from xs a, jy b, book c
	where a.����֤��=b.����֤�� and b.isbn=c.isbn
	 and a.����֤�� like @lib_num
go
exec reader_info @lib_num= '20000005'/* �򻻳������������ */
exec reader_info '20000005'
exec reader_info /* ʹ�ò��� */
exec reader_info '1%'
go