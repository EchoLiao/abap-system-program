
/* �����洢����, ���ڲ�ѯ�ѽ����ͬѧ�Ľ������ */ 

use xsbook
if exists(select name from sysobjects where name='history_info' and type='p')
	drop procedure history_info
go
create procedure history_info
	as
	select a.����֤��, a.����,b.isbn, c.����
	from xs a inner join historytable b on a.����֤��=b.����֤�� 
		inner join book c on b.isbn=c.isbn /* inner join ����: ����������еļ�¼��ֻҪ�ڹ����ֶ�֮���������ֵ */
				/* �﷨: FROM table1 INNER JOIN table2 ON table1.field1 compopr table2.field2 */


go
/*exec*/ history_info
go