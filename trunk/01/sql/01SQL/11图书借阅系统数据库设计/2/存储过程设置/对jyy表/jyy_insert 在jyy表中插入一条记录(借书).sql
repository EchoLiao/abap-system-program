-- jyy_insert 在jyy表中插入一条记录(借书)

use xsbookkk
go
create procedure jyyy_insert
	@jszh char(8), @isbn char(16), @ssh char(10), @jssj datetime, @flag int output
	as
	set @flag=(select kcl from bookkk where isbn=@isbn)
	if @flag>0
		begin	
			insert into jyyy(jszh, isbn, ssh, jssj)
				values(@jszh, @isbn, @ssh, @jssj)
		end
	else
		set @flag=0
go
	