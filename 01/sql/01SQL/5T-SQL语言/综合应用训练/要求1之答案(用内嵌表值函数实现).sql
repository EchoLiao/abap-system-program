
--------------------- ����Ƕ��ֵ����ʵ�� ---------------------------
use xsbook
if exists(select name from sysobjects where name='book_infos' and type='if')
	drop function book_infos  -- ����ȡ��Ϊbook_info, ��Ϊϵͳ���д˺���
go
create function book_infos(@book_name char(26))
	returns table
	as
		return (select isbn, ����, ����, ������, �۸�, ������, �����
				from book 
				where ����=@book_name
			)
go

use xsbook
select * from book_infos(N'�ִ�ѧԭ��')
go