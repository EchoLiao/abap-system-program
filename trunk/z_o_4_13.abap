report z_o_4_13.
data a_spfli type spfli.
*定义内表，请注意有header line
data ta_spfli type table of spfli with header line.

*分隔线
uline.
write / 'use workspace'.
uline.

*将数据表逐行转移至工作区，只读首5行
select * into corresponding fields of a_spfli from spfli up to 4 rows.
  write: / a_spfli-cityto.
endselect.

