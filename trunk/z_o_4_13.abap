report z_o_4_13.
data a_spfli type spfli.
*�����ڱ���ע����header line
data ta_spfli type table of spfli with header line.

*�ָ���
uline.
write / 'use workspace'.
uline.

*�����ݱ�����ת������������ֻ����5��
select * into corresponding fields of a_spfli from spfli up to 4 rows.
  write: / a_spfli-cityto.
endselect.

