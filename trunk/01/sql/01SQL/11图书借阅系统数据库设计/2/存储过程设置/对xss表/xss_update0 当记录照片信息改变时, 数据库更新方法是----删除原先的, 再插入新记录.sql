
/*  ����¼��Ƭ��Ϣ�ı�ʱ, ���ݿ���·�����: ɾ��ԭ�ȵ�, �ٲ����¼�¼ */
use xsbookkk
go
create procedure xsss_update0
	@jszh char(8), @xm char(12), @zym char(20), @xb bit, @cssj datetime, @jsl int
	as
	delete xsss
		where jszh=@jszh
	insert xsss(jszh, xm, zym, xb, cssj, jsl)
		values(@jszh, @xm, @zym, @xb, @cssj, @jsl)
go
	