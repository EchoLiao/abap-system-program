USE XSBOOK
IF EXISTS(SELECT name from sysobjects where name='birthdate' and type='d')
	begin
		exec sp_unbindefault 'birthday_date' /* ����󶨹�ϵ */
		drop default birthday /* ɾ��Ĭ��ֵ���� */
	end