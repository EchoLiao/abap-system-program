report z_j_4_1.
* �� 4.1 ���������ݿ��ȡ�ļ��ַ����Ͳ��裺
* ��1�������ݱ�ֱ�Ӷ�ȡ�����������������
* ��2�������ݱ��ȡ�������ڱ��ٴ��ڱ������
* ��3�����ڱ����ж�ȡ�������������������ӹ����������
* ���� 4.1��

*���幤����
data a_spfli type ytcity.
*�����ڱ���ע����header line
data ta_spfli type table of ytcity with header line.

uline.  write / 'use workspace'.  uline.
*�����ݱ�����ת������������ֻ����3��
select * into corresponding fields of a_spfli from ytcity up to 3 rows. " @@@@@
    write: / a_spfli-yct_id, a_spfli-yct_name.
endselect. 

uline.  write / 'use inner table'.  uline.
select * into corresponding fields of table ta_spfli from ytcity up to 3 rows.
*�����ݱ���������ڱ�ֱ�Ӵ��ڱ����
*���ta_spfliû�ж���header line, ����� 
loop at ta_spfli. "  
  write: / a_spfli-yct_id, a_spfli-yct_name.
endloop.

uline.  write / 'move data from inner to workspace'.  uline.
loop at ta_spfli into a_spfli. 
  write: / a_spfli-yct_id, a_spfli-yct_name.
endloop. 
