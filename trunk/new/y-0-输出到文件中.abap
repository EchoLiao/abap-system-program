" 输出到文件中
report  z_j_3_9.

data: begin of man,
        name(20) type c,
        high type p decimals 2,
        weight type p decimals 2,
      end of man.
data: man1 like table of man.
data: name type rlgrap-filename, typa type rlgrap-filetype.

man-name = 'zhang'.
man-high = '1.68'.
man-weight = 120.
insert man into table man1.

man-name = 'liu'.
man-high = '1.78'.
man-weight = 160.

insert man into table man1.

man-name = 'li'.
man-high = '1.58'.
man-weight = 110.
" insert man into table man1 index 2. " 错误! 
insert man into man1 index 1. " 索引从1开始 

name = 'c:\temp\testa.txt'.
typa = 'dat'.

call function 'download'  " 函数名区分大小写
  exporting
    codepage                = 'shuibian'
    filename                = name
    filetype                = typa
    item                    = 'shuibian' 
  tables
    data_tab                = man1
  exceptions
    invalid_filesize        = 1
    invalid_table_width     = 2
    invalid_type            = 3
    no_batch                = 4
    unknown_error           = 5
    gui_refuse_filetransfer = 6
    others                  = 7.
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.

loop at man1 into man.
  write: / man-name,man-high,man-weight.
endloop.

"""""""""" 用带表头行的输出方法 """"""""""""
" data: man1 like table of man with header line.
" loop at man1.
  " write: / man1-name,man1-high,man1-weight.
" endloop.
