USE XSBOOK
go
/* ����������Ϊ��һ�����������go֮�� */
CREATE DEFAULT startbord AS getdate() /* Ĭ��ֵ���� */
go
EXEC sp_bindefault 'startbord', 'xs4.[��������]'  /* Ĭ��ֵʹ�� */
go