
/*  ִ��������־�ָ������ڽ�����ȫ���ݿ�ָ��Ժ� */

restore database xsbook2 /* ����ȫ�ָ����ݿ� */
	from test1 
	with norecovery

restore log xsbook2 /* Ȼ���ٻָ�������־ */
	from xslogbk
