report  z_j_4_ytest002.
*���幤����
data a_spfli type ytcity.
*�����ڱ���ע����header line
data ta_spfli type table of ytcity with header line.
*�ָ���
uline.
write / 'use workspace'.
uline.
*�����ݱ�����ת������������ֻ����5��
select * into corresponding fields of a_spfli from ytcity up to 4 rows.
  write: / a_spfli-yct_id, a_spfli-yct_name, a_spfli-yct_country
          left-justified.
endselect.
uline.
write / 'use inner table'.
uline.
select * into corresponding fields of
         table ta_spfli from ytcity up to 3 rows.
*�����ݱ���������ڱ�ֱ�Ӵ��ڱ����
*���ta_spfliû�ж���header line,�����
loop at ta_spfli.
  write: / a_spfli-yct_id, a_spfli-yct_name, a_spfli-yct_country
          left-justified.
endloop.
uline.

loop at ta_spfli into a_spfli. " �ڱ����ݵ����
  write: / a_spfli-yct_id, a_spfli-yct_name, a_spfli-yct_country
          left-justified.
endloop.
