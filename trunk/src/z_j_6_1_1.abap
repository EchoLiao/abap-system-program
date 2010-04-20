report  z_j_6_1_1.
* 6.3.8 程序设计

data: FI(20) type c value 'init, yeah', " FI, FC 要对应于屏幕设计中的 
      FC(20)  type c value 'code'.
*功能码返回值
data: ok_code type sy-ucomm, " ok_code 要对应于屏幕设计中的 
      save_ok type sy-ucomm.


*直接调用窗口
call screen 100.
*输出返回变量
write: FI, / FC.


*---------------------------------------------------------------------*
*  module cancel input
*---------------------------------------------------------------------*
*  cancel module与屏幕逻辑流对应
*---------------------------------------------------------------------*
module cancel input. 
  leave program.
endmodule.                    "cancel input

 
*---------------------------------------------------------------------*
*  module status_0100 output
*---------------------------------------------------------------------*
*  pbo输入前控制
*---------------------------------------------------------------------*
module status_0100 output.
*定义状态条、包括菜单、工具条按钮、系统按钮等
  set pf-status 'TESTSTA1'.
*将变量值输出至屏幕字段
  " FI = save_ok.  
  FC = save_ok. " 被点击的按钮的名称被输入到变量FC中, 因此初始值将被复盖 
endmodule.                    "status_0100 output


*---------------------------------------------------------------------*
*  module user_command_0100 input
*---------------------------------------------------------------------*
*  pai输入后控制
*---------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code.  " ok_code 只能在此模块中被识别 
  clear ok_code.


*分析功能码,如果是工具条上的第2个按钮,则退出当前屏幕
case save_ok.
    when 'BIN2'.  
    " when 'CUST1'.
      leave to screen 0.
  endcase. 
endmodule.                    "user_command_0100 input

