-- E:\liaocaiyuan\Documents\01SQL\10��������\����

declare @trans_name varchar(20)
set @trans_name='mytrans1' -- �������������һ������

begin transaction @trans_name  -- ����ʼ
go
use xsbook
go
update  book
	set ������=������+4
	where ������='�廪��ѧ������'
go
--declare @trans_name varchar(20)
commit transaction @trans_name -- �����ύ --Ϊʲô�д�???????????????????????
go
