

use master
exec sp_addumpdevice 'disk', 'test1', 'f:\temp\test1.bak' /* ������������ */
go
backup database xsbook to test1 /* �������ݿ�xsbook */
go