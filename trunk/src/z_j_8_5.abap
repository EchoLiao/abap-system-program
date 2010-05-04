report z_j_8_5.
" 8.5	处理 alv 双击事件
*功能码返回值
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*定义内表，变量需要传递，不加header line
data wa_spfli type table of spfli.
*内表赋值
select * into table wa_spfli from spfli. 
*定义窗口定制控制,定义alv对象
data: wa_container type scrfname value 'ALVDATA',
      alv_grid     type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.
*定义事件类型
class lcl_event_receiver definition deferred.
*定义事件
data event_receiver type ref to lcl_event_receiver.
*直接调用窗口
call screen 100.

*---------------------------------------------------------------------*
*       class lcl_event_receiver definition * 定义事件的属性和方法
*---------------------------------------------------------------------*
class lcl_event_receiver definition.
  public section.
    methods:
    handle_double_click
      for event double_click of cl_gui_alv_grid
        importing e_row e_column.
endclass.                    "lcl_event_receiver definition
*---------------------------------------------------------------------*
*       class lcl_event_receiver  implentation
*---------------------------------------------------------------------*
class lcl_event_receiver implementation. 
  method handle_double_click.
    data: li_spfli like line of wa_spfli.
    read table wa_spfli index e_row-index into li_spfli.
*将行列等信息合并到字符串
    data: s1(100) type c.
    concatenate '行:' e_row-index '列名:' e_column-fieldname into s1.
    concatenate s1 'connid:' li_spfli-connid into s1.
    concatenate s1 'carrid:' li_spfli-carrid into s1.
*在状态条显示单击的行与列信息 
    message s208(00) with s1.
  endmethod.                    "handle_double_click
endclass.                    "lcl_event_receiver  implentation


*&---------------------------------------------------------------------*
*&      module  status_0100  output
*&---------------------------------------------------------------------*
* 定义状态条、包括菜单、工具条按钮、系统按钮等
*----------------------------------------------------------------------*
module status_0100 output.
  " set pf-status 'status1'. " ????? 
*如果窗口还没有创建alv对象则创建它
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting
        i_structure_name = 'spfli'
      changing
        it_outtab        = wa_spfli.
*alv对象分配双击事件 
    create object event_receiver.
    set handler event_receiver->handle_double_click for alv_grid.
  endif.
endmodule.                 " status_0100  output


*&---------------------------------------------------------------------*
*&      module  user_command_0100  input 
*&---------------------------------------------------------------------*
* 用户交互 
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input
