/* E:\liaocaiyuan\Documents\01SQL\�洢���̺ʹ����� */
/* �ò�����ȷ��,Ϊʲô?????????????*/
use xsbook
if exists(select name from sysobjects where name='havereader_info' and type='p')
	drop procedure havereader_info
go
create procedure havereader_info
	@bname char(26),@startdate datetime, @enddate datetime, @total int output
	as
	select @total=count(b.isbn)
	from historytable a , book b
	where a.isbn=b.isbn and ���� like @bname and ����ʱ��>=@startdate and ����ʱ��<=@enddate
go

declare @book_na  char(24),@tot  int /* �ڴ������ʹ��output����ʱ, �������output�������ж��� */
set @book_na='WEB�������'
exec havereader_info @book_na ,'2008-01-01','2008-12-12',@tot 
select @book_na  as ����,   @tot  as ���Ĵ���
go 