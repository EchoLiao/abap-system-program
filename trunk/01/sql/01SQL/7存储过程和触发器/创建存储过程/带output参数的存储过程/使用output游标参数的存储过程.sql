
/* ��xsbook���ݿ��xs������������һ���α� */
use xsbook
if exists(select name from sysobjects where name='reader_cursor' and type='p')
	drop procedure reader_cursor
go
create procedure reader_cursor 
	@reader_cur cursor varying output
	as
	set @reader_cur=cursor forward_only static /* �����α�: ֻ����ǰ, ��̬ */
	for -- ���Ҫ(����)ִ�еĲ��� ��д��:for update of ���� , ��˼��Ϊ: ���Զ��������޸�.
	select ����֤��, ����, רҵ��, ����ʱ��
		from xs
	open @reader_cur
go

declare @mycursor cursor   -- ����һ���ֲ��α�
exec reader_cursor @mycursor output /* �ڴ������ʹ��output����ʱ, �������output�������ж��� */
fetch next from @mycursor -- ���α��ж�ȡ����
while(@@fetch_status=0) -- �����ȡ�ɹ�, �򷵻�0, ���򷵻�-1��ʾ��ȡ���в��ڽ������, -2��ʾҪ��ȡ�����Ѳ����� .
  begin
	fetch next from @mycursor -- ���α��ж�ȡ����
	--select @@cursor_rows
  end 
close @mycursor  /* �ر��α� */
deallocate @mycursor /* ɾ���α� */
go
select @@cursor_rows
go


