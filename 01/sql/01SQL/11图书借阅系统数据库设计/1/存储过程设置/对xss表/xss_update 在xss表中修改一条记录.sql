
use xsbookk
go
create procedure xss_update
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jss int
	as
	update xss
		set ����=@xm, רҵ��=@zym, �Ա�=@xb, ����ʱ��=@cssj, ������=@jss
go