use xsbook
if exists(select name from sysobjects where name='view2' and type='v')
 	drop view view2
go
create view view2 with schemabinding  -- ����һ���ɽ���֤��,2008����������ɵ���ͼview2  
	as
	select  ����֤��, count(isbn) as ������ /* count() ����ͳ�������� */
		from [dbo].historytable  /* ����д������, ����ĳ�" from historytable" ȴ������???Ϊʲô?????? */
		where datepart(yyyy, ����ʱ��)='2008'
		group by ����֤�� 
go
if exists(select name from sysobjects where name='temptable' and type='u')
	drop table temptable
go
select *   -- ������ͼview2������temptable, �Ա㴴������
	into temptable
	from view2
go

SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
go

alter table temptable
	add constraint tem_pk
	primary key clustered (����֤��)
go 

create index ind1
	on dbo.temptable(������ desc) 
go 

select  temptable.����֤��,����, רҵ��,������
	from temptable, xs
	where temptable.����֤��=xs.����֤��
	group by temptable.����֤��, ����, ������ ,רҵ��
	--order by ������ desc
go