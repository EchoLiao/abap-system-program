

use xsbookk
go
create trigger tjyy_insert on jyy
	for insert -- ������������ʱ, insert����������ִ��
	as
	begin
		update xss
			set ������=������+1
				where xs.����֤�� in (select insertd.����֤�� from insertd)
		update bookk
			set �����=�����-1
				where book.isbn in (select insertd.isbn from insertd)
	end
go