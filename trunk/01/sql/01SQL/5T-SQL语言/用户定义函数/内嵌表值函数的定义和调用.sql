
------------------------------------------ ��Ƕ��ֵ�����Ķ��� ----------------------------------------
use xsbook
if exists(select name from sysobjects where name='fn_view1' and type='if')
	drop function fn_view1
go
create function fn_view1(@zhuanyeming char(20)) returns table  -- ����ֵΪһ����
as
	return 
		(select ����, ����֤��, �Ա�
			from xs
			where רҵ��=@zhuanyeming
		)
go


----------------------------------------- ��Ƕ��ֵ�����ĵ��� -------------------------------------------------
select * from fn_view1(N'Ӣ��')
go