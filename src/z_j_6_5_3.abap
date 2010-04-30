report z_j_6_5_3.

*功能码返回值
data: OK_CODE type sy-ucomm,
      SAVE_OK type sy-ucomm.
*定义输入字段变量
data: FLD1(20) type c,
      FLD2(20) type c,
      FLD3(20) type c value '3',
      FLD4(20) type c,
      ACTION(50) type c.


*直接调用窗口
call screen 100.


*&---------------------------------------------------------------------*
*&      module  cancel  input
*&---------------------------------------------------------------------*
* cancel module 与屏幕逻辑流对应，退出程序
*----------------------------------------------------------------------*
module cancel input. 
  leave program.
endmodule.                 " cancel  input


*&---------------------------------------------------------------------*
*&      module  status_0100  output
*&---------------------------------------------------------------------*
* 定义状态条，包括菜单、工具条按钮、系统按钮等
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'status1'.
endmodule.                 " status_0100  output



*&---------------------------------------------------------------------*
*&      module  user_command_0100  input 
*&---------------------------------------------------------------------*
* 如果能执行PAI，把FLD1、FLD2、FLD3、FLD4合并到ACTION输入字段
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.
  SAVE_OK = OK_CODE. 
  CLEAR OK_CODE.
  CASE SAVE_OK.
    WHEN 'EXIT'.
      LEAVE PROGRAM. 
  ENDCASE. 
  ACTION = ''.
  CONCATENATE FLD1 FLD2 FLD3 FLD4 INTO ACTION.
ENDMODULE.                 " USER_COMMAND_0100  INPUT


*&---------------------------------------------------------------------*
*&      module  check1  input
*&---------------------------------------------------------------------*
* 输入FLD1、FLD2 时检查
*----------------------------------------------------------------------*
MODULE CHECK1 INPUT. 
*当输入FLD1 = 'FLD1' 时提示错误,而且不执行PAI
  IF FLD1 = 'FLD1'.
    MESSAGE E005(YMESS) WITH 'FLD1 ERROR'. " ACTION 不会被更改 
  ENDIF.
  IF FLD2 = 'FLD2'.
    MESSAGE E005(YMESS) WITH 'FLD2 ERROR'.
  ENDIF.
*当输入FLD1 = 'FLD11' 时弹出窗口提示,执行PAI
  IF FLD1 = 'FLD11'. 
    MESSAGE I005(YMESS) WITH 'FLD1 WARNING'.
  ENDIF.
*当输入FLD1 = 'FLD111' 时输出成功信息,执行PAI
  IF FLD1 = 'FLD111'.
    MESSAGE S005(YMESS) WITH 'FLD1 OK'.
  ENDIF.
ENDMODULE.                 " CHECK1  INPUT


*&---------------------------------------------------------------------*
*&      Module  CHECK2  INPUT
*&---------------------------------------------------------------------*
* 输入FLD3、FLD4 时检查
*----------------------------------------------------------------------*
MODULE CHECK2 INPUT. 
  IF FLD3 = 'FLD3'.
    MESSAGE E005(YMESS) WITH 'FLD3 ERROR'.
  ENDIF.
  IF FLD3 = 'FLD33'. 
    MESSAGE I005(YMESS) WITH 'FLD3 WARNING'.
  ENDIF.
  IF FLD3 = 'FLD333'.
    MESSAGE S005(YMESS) WITH 'FLD3 OK'.
  ENDIF.
ENDMODULE.                 " CHECK2  INPUT



*&---------------------------------------------------------------------*
*&      Module  CHECK3  INPUT
*&---------------------------------------------------------------------*
*当FLD2第一个字符是'*'时,执行该MODULE,弹出信息提示
*----------------------------------------------------------------------*
MODULE CHECK3 INPUT. 
  MESSAGE I005(YMESS) WITH 'FLD2 * WARNING'. " ????? 
ENDMODULE.                 " CHECK3  INPUT
"
