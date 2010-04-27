
use xsbookkk
go
create procedure bookkk_delete @isbn char(16), @flag int output
	as
	if exists(select * from bookkk where isbn=@isbn and fbl=kcl)
		begin	
			delete bookkk from bookkk where isbn=@isbn
			set @flag=0
		end
	else
		set @flag=1
go
