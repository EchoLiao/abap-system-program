ALTER DATABASE DB1
	MODIFY FILE
	(NAME=DB1_DATA,
	FILEGROWTH=4MB,  /* �ı��������ļ�������ʽ */
	MAXSIZE=UNLIMITED) /* ���������ļ�����С��Ϊ������ */
GO