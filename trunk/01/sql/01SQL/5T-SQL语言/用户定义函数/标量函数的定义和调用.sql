
/* ���������Ķ��� */
-- ����һ��������ǰ���ߵ�ƽ������ 
use xsbook -- ������ͼ, ���ڼ���ƽ������
go
if exists(select name from sysobjects where name='view_avg' and type='v')
	drop view view_avg
go
create view view_avg
	as
	select ����֤��, �Ա�, datepart(yyyy,getdate())-datepart(yyyy,����ʱ��) as ����
	from xs
go




use xsbook
go 
if exists(select name from sysobjects where name='aver_avg' and type='fn')
	drop function aver_avg
go

------------------------------------------- ����������� ---------------------------------------------
create function aver_avg(@sex bit) returns int --��returns������return
as
	begin	
		declare @aver int
		select @aver=
			(select avg(����) -- ����avg()������ƽ��ֵ. select���ֻselectһ������,���Կɽ�������(=)ĳ������.
				from view_avg
				where �Ա�=@sex
			)
		return @aver
	end
go

------------------------------------------- ���������ĵ���(��select) -----------------------------------
use xsbook
declare @sex bit
declare @aver int
select @sex=1 -- ���ֲ�������ֵ, ��setҲ����
select @aver=dbo.aver_avg(@sex) -- �����û��Զ��庯��, �ǵô��ݲ���
select @aver as Ů���ߵ�ƽ������ -- д�� 'Ů���ߵ�ƽ������' Ҳ��(���ӵ�����).
------------------------------------------�����������ĵ���(��exec) ---------------------------------------
use xsbook
declare @aver2 int
exec @aver2=dbo.aver_avg @sex=0  -- ��execִ��(Ҫ�ǵø��䴫�ݲ���)
select @aver2 as �ж��ߵ�ƽ������
go