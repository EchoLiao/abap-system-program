
use st

declare ageSecond cursor scroll 
	for
	select Sage
	from student
	order by Sage desc
go
--set  ageSecond = cursor dynamic

open ageSecond
fetch absolute 2 from ageSecond;
fetch absolute 2 from ageSecond;
fetch next from ageSecond;
fetch first from ageSecond; 
fetch last from ageSecond;
fetch relative -3 from ageSecond;
fetch absolute 3 from ageSecond;
/* fetch absolute {n|@nvar} nΪ��,��ȡ���α꿪ʼ�ĵ�n�в�����ȡ���б���µĵ�ǰ��; n��Ϊ����,���ȡ�α�β֮ǰ�ĵ�n�в�����ȡ���б�ɵ�ǰ��; ��nΪ0,��û�з���.
 * fetch relative {n|@nvar} nΪ��,��ȡ�ӵ�ǰ�к�ĵ�n�в�����ȡ���б���µĵ�ǰ��; n��Ϊ����,���ȡ��ǰ��֮ǰ�ĵ�n�в�����ȡ������ɵ�ǰ��; ��nΪ0,�򷵻ص�ǰ��;
		��nΪ0�������Ƕ��α�ĵ�һ�ζ�ȡ,��û�з���.
 * fetch next  ��ȡ��ǰ�е���һ��,������ȡ���б���µĵ�ǰ��; ���ǵ�һ�ζ��α��ȡ,�򷵻ص�һ��. �����α�Ĭ�ϵ�ѡ��.
 * fetch prior ��ȡ��ǰ�е�ǰһ��,������ȡ���б���µĵ�ǰ��; ���ǵ�һ�ζ��α��ȡ,��û�з���,���α����ڵ�һ��֮ǰ.
 * fetch first ��ȡ�α��еĵ�һ��,��������Ϊ��ǰ��.
 * fetch last  ��ȡ�α��е����һ��,��������Ϊ��ǰ��.
 */
close ageSecond
deallocate ageSecond
go