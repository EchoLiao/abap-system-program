/* ��jy���ϴ���һ��������, ���Խ���֤�ź�isbn���޸�, ����ʾ��Ϣ, ��ȡ���޸� */
--����1
use xsbook
go
create trigger update_trigger1
	on jy
	for update
	as
	if update(����֤��) or update(isbn)
	begin 
		raiserror('Υ������һ����',16,1)
		rollback transaction
	END
GO

--����2
go
create trigger update_trigger2
	on jy
	for update
	as
	--if update(����֤��) or update(isbn)
	if(columns_updated() & 3)>0 -- ����columns_updated����, ����Ƿ��ѱ��޸�, �����޸���ȡ���޸�
	begin 
		raiserror('Υ������һ����',16,1)
		rollback transaction
	END
GO