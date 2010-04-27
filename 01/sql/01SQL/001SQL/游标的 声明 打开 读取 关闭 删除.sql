
declare cursor_name cursor
	[local | global]  				/* �α�������� */
	[forward_only | scroll] 			/* �α��ƶ����� */
	[static | keyset | dynamic | fast_forward ]	/* �α����� */
	[read_only | scroll_locks | optimistic]		/* �������� */
	[type_warning]					/* ����ת��������Ϣ */
	FOR��select_statement				/* select��ѯ��� */
	[FOR update OF [column_name [,...n]]] 		/* ���޸ĵ��� */




open {{[globl]cursor_name} | cursor_varialbe_name}




fetch
	[[next | prior | first | last | absolute {n|@nvar} | relative{n|@nvar}]
	FROM ]
	{{[global] cursor_name} | @cursor_variable_name}
	[INTO @variable_name[,...n]]
/* fetch absolute {n|@nvar} nΪ��,��ȡ���α꿪ʼ�ĵ�n�в�����ȡ���б���µĵ�ǰ��; n��Ϊ����,���ȡ�α�β֮ǰ�ĵ�n�в�����ȡ���б�ɵ�ǰ��; ��nΪ0,��û�з���.
 * fetch relative {n|@nvar} nΪ��,��ȡ�ӵ�ǰ�к�ĵ�n�в�����ȡ���б���µĵ�ǰ��; n��Ϊ����,���ȡ��ǰ��֮ǰ�ĵ�n�в�����ȡ������ɵ�ǰ��; ��nΪ0,�򷵻ص�ǰ��;
		��nΪ0�������Ƕ��α�ĵ�һ�ζ�ȡ,��û�з���.
 * fetch next  ��ȡ��ǰ�е���һ��,������ȡ���б���µĵ�ǰ��; ���ǵ�һ�ζ��α��ȡ,�򷵻ص�һ��. �����α�Ĭ�ϵ�ѡ��.
 * fetch prior ��ȡ��ǰ�е�ǰһ��,������ȡ���б���µĵ�ǰ��; ���ǵ�һ�ζ��α��ȡ,��û�з���,���α����ڵ�һ��֮ǰ.
 * fetch first ��ȡ�α��еĵ�һ��,��������Ϊ��ǰ��.
 * fetch last  ��ȡ�α��е����һ��,��������Ϊ��ǰ��.
 */




close {{[globl]cursor_name} | cursor_varialbe_name}





deallocate {{[globl]cursor_name} | cursor_varialbe_name}  /* ɾ���α� */














