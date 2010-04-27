
use xsbookk
go
create procedure bookk_delete @isbn char(16), @flag int output
	as
	if exists(select * from bookk where isbn=@isbn and ∏¥±æ¡ø=ø‚¥Ê¡ø)
		begin	
			delete bookk from bookk where isbn=@isbn
			set @flag=0
		end
	else
		set @flag=1
go
