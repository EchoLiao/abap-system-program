report z_j_8_1.
" 8.1	简单的 alv 控件实例
" 以航班表（spfli）为例，使用数据字典定义结构，通过 alv 控件显示数据。
*定义内表
data wa_spfli like table of yzhhz with header line.
*内表赋值
select * into table wa_spfli from yzhhz. 
*通过数据字典结构显示alv
call function 'REUSE_ALV_LIST_DISPLAY'
  exporting
    i_structure_name = 'yzhhz' 
  tables
    t_outtab         = wa_spfli
  exceptions
    program_error    = 1
    others           = 2.
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.

