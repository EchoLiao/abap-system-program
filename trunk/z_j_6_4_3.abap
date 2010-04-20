report  z_j_6_4_3.

* 功能码返回值
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*使用航班表
tables ytcity.
*直接调用窗口


call screen 100.

module cancel input. 
  leave program.
endmodule.                    "cancel input

 
*&---------------------------------------------------------------------*
*&      module  status_0120  output
*&---------------------------------------------------------------------*
* 定义状态条、包括菜单，工具条按钮、系统按钮等
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'STATUS1'.
endmodule.                 " status_0120  output


*&---------------------------------------------------------------------*
*&      module  user_command_0120  input 
*&---------------------------------------------------------------------*
* 在输入字段或单击按钮事件后处理
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 

*将select数据赋给ytcity记录，ytcity记录关联屏幕字段 
  select single *
    into corresponding fields of ytcity " screen_table 
    from ytcity
    where yct_id = ytcity-yct_id.
      if sy-subrc ne 0. " ????? 
        clear ytcity.
      endif.
endmodule.                 " user_command_0120  input
