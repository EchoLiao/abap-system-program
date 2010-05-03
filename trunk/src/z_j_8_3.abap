report z_j_8_3.
*功能码返回值
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*定义内表，变量需要传递，不加header line
data wa_spfli type table of yzhhz .
*内表赋值
select * into table wa_spfli from yzhhz. 
* ALVDATA 是屏幕100中定义控制控件的名称 
data: wa_container type scrfname value 'ALVDATA',
      alv_grid type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.
*直接调用窗口
call screen 100.

*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'status1'.
*如果窗口还没有创建alv对象则创建它
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting i_structure_name = 'yzhhz' " 表名 
      changing it_outtab        = wa_spfli.
  endif.
endmodule.                 " status_0100  output

*&---------------------------------------------------------------------*
*&      module  user_command_0100  input *       text
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input
