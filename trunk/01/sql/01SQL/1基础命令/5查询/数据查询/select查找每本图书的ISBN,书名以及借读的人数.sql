/* ����ÿ��ͼ���ISBN,�����Լ���������� */
use xsbook
select   jy.isbn, ����,count( jy.isbn)as ������ /* count���� ����ͳ�Ʊ������������������������� */
from jy,book
where book.isbn = jy.isbn       --group by  jy.isbn ,���� /* group by��������: ���зֳɸ�С�Ĳ��� */ 
group by  jy.isbn ,book.���� --�����ִ�и������,���ò�����Ҫ����Ϣ,�ó����ǵѿ����˻�.
                              /* "book.����Ҳ����д�� "����" , ��Ϊ����ֻ���������ݿ������һ������ */
-- union

select ����֤��, count(�����)as ������
	from book, jy
	where jy.isbn=book.isbn and datepart(yyyy, ����ʱ��)='2008'
	group by ����֤��
go
