
use xsbookk
go
create procedure bookk_update
	@isbn char(16), @sm char(26), @zz char(8), @cbs char(20), @jg float, @fbl smallint, @kcl smallint
	as 
	update bookk set
	 	����=@sm, ����=@zz, ������=@cbs, �۸�=@jg, ������=@fbl, �����=@kcl
		where isbn=@isbn
go
