use xsbook
select  ����,count(b.isbn) as ���Ĵ���
	from historytable a , book b
	where a.isbn=b.isbn and ���� like 'WEB�������' and ����ʱ��>='2008-01-01' and ����ʱ��<='2008-12-12'
	group by ����
go