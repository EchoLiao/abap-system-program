use xsbookk
go
create procedure xss_delete
	@jszh char(8), @flag int output
	as
	if exists(select * from xss where ����֤��=@jszh and ������=0)
		begin
			delete xss where  ����֤��=@jszh and ������=0 
			set @flag=0 -- �ɹ�����0
		end
	else
		set @flag=1 -- ʧ�ܷ���1
go