
use xsbookk
go
create procedure jyy_delete
	@ssh char(10), @flag int output
	as
	declare @jszh char(8), @isbn char(16)
	declare @jssj datetime, @hssj datetime
	if exists(select * from jyy where �����=@ssh)
		begin
			set @flag=0
			select @jszh=����֤��,@isbn=isbn,@jssj=����ʱ�� from jyy where �����=@ssh
			set @hssj=getdate()
			insert into jylss  -- û�в���,��Ĭ��Ϊȫ������. /* ������ʷ��(jslss)��������һ����¼ */
				values(@jszh, @isbn, @ssh, @jssj, @hssj)
			
			delete jyy from jyy where �����=@ssh
		end
	else
		set @flag=1
go