

use xsbook
declare @name char(20), @st_id char(2)

declare readers_cursor cursor --����һ���α�           --Ĭ��Ϊֻ���α�
	for
	select ����֤��, ����
		from xs
	
open readers_cursor -- ���α�
-- fetch next from readers_cursor into @name, @st_id
          -- fetch next  ��ȡ��ǰ�е���һ��, ��������Ϊ��ǰ��. ����ǵ�һ�ζ�ȡ,���ȡ���ǵ�һ��.
fetch  next from readers_cursor --into @name, @st_id  -- fetch Ĭ��Ϊ fetch next
--select @name, @st_id  

while @@fetch_status=0 -- ����fetch���ִ�е��α�״̬,����ҪӦ��@@fetch_status,֮ǰ��������ִ�й�һ��fetch���
	begin 	
		fetch from readers_cursor
		--select @name, @st_id
	end 
         -- ֮ǰ��ȡ����, �Ͳ�������, Ҳ�Ͳ����ٶ�ȡ��.
while @@fetch_status=0  
	begin 	
		fetch from readers_cursor
		--select @name, @st_id
	end  
close readers_cursor  -- �ر��α�
deallocate readers_cursor  -- ɾ���α�
	