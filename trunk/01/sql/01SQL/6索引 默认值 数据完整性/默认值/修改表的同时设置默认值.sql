USE XSBOOK
ALTER TABLE XS
	ADD ��֤���� SMALLDATETIME NULL
		CONSTRAINT AddDateDflt  /* ����Ĭ��ֵԼ���� */
		DEFAULT  getdate() WITH VALUES  /* ����Ĭ��ֵ */
