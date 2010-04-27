 

/* 先创建临时备份设置, 然后备份在这个设置上 */
backup database xsbook to
	disk='f:\temp\xsbookup.bak' with differential
go