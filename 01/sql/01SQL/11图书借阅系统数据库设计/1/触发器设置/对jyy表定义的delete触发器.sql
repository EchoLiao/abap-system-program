-- E:\liaocaiyuan\Documents\01SQL\11ͼ�����ϵͳ���ݿ����\����������

use xsbookk
go
create trigger tjyy_delete on jyy
	for delete -------------------
	as
	begin
		update xss  -- ��ǰ׺ 'xs' ���ѯ�����õı����������ƥ�䡣????????????????????????
			set ������=������-1
				where xs.����֤�� in (select deleted.����֤�� from deleted)
		update bookk
			set �����=�����+1
				where bookk.isbn in (select deleted.isbn from deleted)
	end
go