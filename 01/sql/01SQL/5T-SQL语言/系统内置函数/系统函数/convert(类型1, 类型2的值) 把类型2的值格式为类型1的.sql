
/* convert(����1, ����2��ֵ) ������2��ֵ��ʽΪ����1�� */
use xsbook
select isbn, ����, �����
	from book
	where convert(char(20),�����) like'_' and �����>2 and �����<50 -- like'_' ��ʲô��˼???????????
go