use xsbook
if exists(select name from sysobjects where name='tjy_insert' and type='tr')
	drop trigger tjy_insert
go
create trigger tjy_insert on jy
	for insert 
	as -- �Բ�������ʱ��Ч
	if exists(select *
		from inserted a  /* ��inserted���м�� */
		where a.����֤�� not in(select b.����֤�� from xs b) or
		a.isbn not in(select c.isbn from book c))
		or exists(select * from book where �����<=0)
		begin
			raiserror('Υ�����ݵ�һ����(�Զ��崥����)',16,1)
			rollback transaction
		end
	else
		begin
			update xs
			set ������=������+1
			where xs.����֤�� in(select inserted.����֤�� from inserted)
			update book
			set �����=�����-1
			where book.isbn in(select inserted.isbn from inserted)
		end
go

if exists(select name from sysobjects where name ='JY_Insert' and type='p')
	drop procedure JY_Insert 
go
create procedure JY_Insert  -- ������������¼�Ĵ洢���� 
	@jszh char(8), @isbn char(15), @ssh char(15), @jssj datetime
	as
	insert into jy
	values(@jszh, @isbn, @ssh, @jssj)
go

exec JY_Insert '10000001', '7-332-22200-3', '1000000011','2008-12-22'  -- ������Ϊ0, ����ִ�в��ɹ� 
go