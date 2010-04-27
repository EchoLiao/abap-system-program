
use xsbookk
go
create procedure jyy_delete
	@ssh char(10), @flag int output
	as
	declare @jszh char(8), @isbn char(16)
	declare @jssj datetime, @hssj datetime
	if exists(select * from jyy where 索书号=@ssh)
		begin
			set @flag=0
			select @jszh=借书证号,@isbn=isbn,@jssj=借书时间 from jyy where 索书号=@ssh
			set @hssj=getdate()
			insert into jylss  -- 没有参数,则默认为全部都有. /* 借书历史表(jslss)表中增加一条记录 */
				values(@jszh, @isbn, @ssh, @jssj, @hssj)
			
			delete jyy from jyy where 索书号=@ssh
		end
	else
		set @flag=1
go