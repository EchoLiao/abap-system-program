--E:\liaocaiyuan\Documents\01SQL\���� Ĭ��ֵ ����������\�ۺ�Ӧ��ѵ��
use xsbook
if exists(select name from sysobjects where name='view3' and type='v')
 	drop view view3
go
create view view3 with schemabinding  -- ����һ���ɽ���֤��,2008����������ɵ���ͼview2  
	as
	select  isbn, count(isbn) as ���Ĵ��� /* count() ����ͳ�������� */
		from [dbo].historytable  /* ����д������, ����ĳ�" from historytable" ȴ������???Ϊʲô?????? */
		where datepart(yyyy, ����ʱ��)='2008'
		group by isbn
go
if exists(select name from sysobjects where name='temptable2' and type='u')
	drop table temptable2
go
select *   -- ������ͼview3������temptable, �Ա㴴������
	into temptable2
	from view3
go

SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
go

alter table temptable2
	add constraint tem_pk2
	primary key clustered (isbn)
go 

create index ind2
	on dbo.temptable2(���Ĵ��� desc) 
go 

select  temptable2.isbn,����,������,���Ĵ���
	from temptable2,book
	--where temptable2.isbn=xs.isbn
	where temptable2.isbn=book.isbn
	--group by temptable2.isbn, ���Ĵ���,����, ������ --��������任����������Ҳ����,Ϊʲô��????
	order by ���Ĵ��� desc
go