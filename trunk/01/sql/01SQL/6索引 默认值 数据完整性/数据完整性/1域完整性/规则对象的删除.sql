use xsbook
go 
if exists(select name from sysobjects where name='tel_rule' and type='r')
	begin
		exec sp_unbindrule 'telphone' -- �����
		drop rule tel_rule /* д��'tel_rule' �Ǵ�� *//* ɾ��������� */
	end
go