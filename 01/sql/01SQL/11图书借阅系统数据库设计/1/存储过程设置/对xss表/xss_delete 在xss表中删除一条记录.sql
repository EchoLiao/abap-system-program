use xsbookk
go
create procedure xss_delete
	@jszh char(8), @flag int output
	as
	if exists(select * from xss where 借书证号=@jszh and 借书量=0)
		begin
			delete xss where  借书证号=@jszh and 借书量=0 
			set @flag=0 -- 成功返回0
		end
	else
		set @flag=1 -- 失败返回1
go