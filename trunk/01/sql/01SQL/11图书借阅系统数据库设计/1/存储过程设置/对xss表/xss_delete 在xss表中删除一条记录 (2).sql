
/* ɾ����������: �ö���û�н��� */
use xsbookk
go
create procedure xss_delete
	@jszh char(8), @flag int output
	as
		if exists(select * from xss where ����֤��=@jszh and ������=0)
			begin
				delete xs
					from xs where ����֤��=@jszh and ������=0
				set @flag=0
			end
		else 
			set @flag=1
go