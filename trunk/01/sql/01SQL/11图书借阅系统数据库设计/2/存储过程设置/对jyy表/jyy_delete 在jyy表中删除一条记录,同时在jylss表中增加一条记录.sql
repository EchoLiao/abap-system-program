
use xsbookkk
go
create procedure jyyy_delete
	@ssh char(10), @flag int output
	as
	declare @jszh char(8), @isbn char(16)
	declare @jssj datetime, @hssj datetime
	if exists(select * from jyyy where ssh=@ssh)
		begin
			set @flag=0
			select @jszh=jszh,@isbn=isbn,@jssj=jssj from jyyy where ssh=@ssh
			set @hssj=getdate()
			insert into jylsss  -- 没有参数,则默认为全部都有. /* 借书历史表(jslss)表中增加一条记录 */
				values(@jszh, @isbn, @ssh, @jssj, @hssj)
			
			delete jyyy from jyyy where ssh=@ssh
		end
	else
		set @flag=1
go