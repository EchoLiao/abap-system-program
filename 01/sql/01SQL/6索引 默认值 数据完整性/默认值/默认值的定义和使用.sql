USE XSBOOK
go
/* ����������Ϊ��һ�����������go֮�� */
CREATE DEFAULT jss_default AS 0 /* Ĭ��ֵ���� */
go
EXEC sp_bindefault 'jss_default', 'xs.������'  /* Ĭ��ֵʹ�� */
go