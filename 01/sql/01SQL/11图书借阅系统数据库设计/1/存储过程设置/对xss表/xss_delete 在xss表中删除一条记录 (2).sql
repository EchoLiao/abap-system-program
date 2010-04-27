
/* 删除的条件是: 该读者没有借书 */
use xsbookk
go
create procedure xss_delete
	@jszh char(8), @flag int output
	as
		if exists(select * from xss where 借书证号=@jszh and 借书量=0)
			begin
				delete xs
					from xs where 借书证号=@jszh and 借书量=0
				set @flag=0
			end
		else 
			set @flag=1
go