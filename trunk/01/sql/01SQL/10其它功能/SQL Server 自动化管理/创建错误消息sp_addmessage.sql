
use master
exec sp_addmessage 50001, --  �����, ����5000��Ϊ�û��Զ����.
		16,  -- ����ȼ�
		'Percentage expects a value between 20 and 100. Please reexecute with a more appropriate value.', -- ������Ϣ���ı�
		us_english, -- ��Ϣ������
		true, --with_log, -- �Ƿ񽫴���д��Ӧ�ó�����־,trueΪд��,falseΪ��д��.
		replace -- �Ƿ��滻ԭ�ȵ�.
