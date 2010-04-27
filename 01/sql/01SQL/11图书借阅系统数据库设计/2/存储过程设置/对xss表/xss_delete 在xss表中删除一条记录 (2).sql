
/* 删除的条件是: 该读者没有借书 */
use xsbookkk
go
create procedure xsss_delete
	@jszh char(8), @flag int output
	as
		if exists(select * from xsss where jszh=@jszh and jsl=0)
			begin
				delete xsss
					from xsss where jszh=@jszh and jsl=0
				set @flag=0
			end
		else 
			set @flag=1
go