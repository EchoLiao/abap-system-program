
begin transaction
use xsbook

insert into book
	values('3-02-222222-x', '���ݽṹ����', '���', '�廪��ѧ������',23,20,20)
save tran my_save

delete from book
	where isbn='3-02-222222-x'
rollback tran my_save -- ���ص�ɾ��ǰ, ���Ե���û��ɾ��.
commit tran
go