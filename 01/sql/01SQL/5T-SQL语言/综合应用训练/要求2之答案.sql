
-- Ҫ��:  2. ��дһ������, ���Ա�ͳ����ƽ��������. �����ò���
use xsbook
go
if exists(select name from sysobjects where name='aver_stat' and type='fn')
	drop function aver_stat
go
create function aver_stat(@sex bit, @year datetime)
	returns int
	as
	begin
		declare @sum1 int, @sum2 int, @aver int
		select @sum1=(select count(�����) -- ��һ��select����setҲ����.
				from historytable ,xs
				where datepart(yy, ����ʱ��)=datepart(yy,@year) 
					and historytable.����֤��=xs.����֤��
					and xs.�Ա�=@sex
			)
		set @sum2=(select count(distinct historytable.����֤��)
				from historytable, xs
				where datepart(yy, ����ʱ��)=datepart(yy,@year)
					and historytable.����֤��=xs.����֤�� 
					and xs.�Ա�=@sex
			)
	select @aver=@sum1/@sum2
	return @aver
	end
go 





use xsbook
go
declare @ave int
select @ave=[dbo].aver_stat(1,'2008') -- ΪʲôҪ[dbo]??????????????????????????????????????????????????????
select @ave
					