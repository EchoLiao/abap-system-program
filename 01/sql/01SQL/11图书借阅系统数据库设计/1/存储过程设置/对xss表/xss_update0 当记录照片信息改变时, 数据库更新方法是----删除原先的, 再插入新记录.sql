
/*  ����¼��Ƭ��Ϣ�ı�ʱ, ���ݿ���·�����: ɾ��ԭ�ȵ�, �ٲ����¼�¼ */
use xsbookk
go
create procedure xss_update0
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jss int
	as
	delete xss
		where ����֤��=@jszh
	insert xs(����֤��, ����, רҵ��, �Ա�, ����ʱ��, ������)
		values(@jszh, @xm, @zym, @xb, @cssj, @jss)
go
	