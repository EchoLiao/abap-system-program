* 4.7.2	ʹ�� package size ��ȡ����

* ���� 4.1 �У�ʹ���� up to 5 rows	�﷨��ȡǰ 5 �У����ǲ��ܼ�����ȡ���ݡ�
* ʹ�� package size ����һ�ζ��뼸����¼��ע���� 4.2 ���� endselect ��䣬��
* ʾ��ȡ 5 ����¼����Ŷ�ȡ 5 ����¼��
* ���� 4.2��

report z_j_4_2.
*�����ڱ���header line
data wa_spfli type table of ytcity with header line.

*��ÿ�ζ�ȡ5����¼, ֱ����ȡ��������
select * into table wa_spfli from ytcity package size 3. " @@@@@
    " *����ڱ��¼
    loop at wa_spfli.
        write: / wa_spfli-yct_id, wa_spfli-yct_name.
    endloop. 
    " *���3�������һ������
    uline.
endselect. 
