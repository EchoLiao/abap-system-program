-- jyy_insert 在jyy表中插入一条记录(借书)

use xsbookk
go
create procedure jyy_insert
	@jszh char(8), @isbn char(16), @ssh char(10), @jssj datetime, @flag int output
	as
	set @flag=(select 库存量 from bookk where isbn=@isbn)
	if @flag>0
		begin	
			insert into jyy(借书证号, isbn, 索书号, 借书时间)
				values(@jszh, @isbn, @ssh, @jssj)
		end
	else
		set @flag=0
go
	