-- jyy_insert ��jyy���в���һ����¼(����)

use xsbookk
go
create procedure jyy_insert
	@jszh char(8), @isbn char(16), @ssh char(10), @jssj datetime, @flag int output
	as
	set @flag=(select ����� from bookk where isbn=@isbn)
	if @flag>0
		begin	
			insert into jyy(����֤��, isbn, �����, ����ʱ��)
				values(@jszh, @isbn, @ssh, @jssj)
		end
	else
		set @flag=0
go
	