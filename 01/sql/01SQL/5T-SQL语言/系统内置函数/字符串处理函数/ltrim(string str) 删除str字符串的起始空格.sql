
/* ltrim(string str) ɾ��str�ַ�������ʼ�ո� */
declare @string varchar(50)
set @string='    �й�,  һ�����ϵĶ�ΰ��Ĺ���  ' 
select ltrim(@string) -- ɾ���ַ�����ʼ�Ŀո� 
go