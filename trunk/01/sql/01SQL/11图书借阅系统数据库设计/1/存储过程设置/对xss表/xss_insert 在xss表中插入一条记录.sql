
use xsbookk
go
create procedure xss_insert
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime
	as
	insert into xss(����֤��, ����, רҵ��, �Ա�, ����ʱ��)
		values(@jszh, @xm, @zym, @xb, @cssj)
go