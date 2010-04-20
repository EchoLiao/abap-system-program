REPORT Z_J_7_1_1 .

* z_j_7_1_1.abap
*PBO 显示屏幕前的处理
PROCESS BEFORE OUTPUT. 
  MODULE STATUS_0100.

*PAI 用户输入后的处理
PROCESS AFTER INPUT. 
  MODULE USER_COMMAND_0100. 

主程序:
REPORT YTEST020.
*功能码返回值
DATA:OK_CODE TYPE SY-UCOMM,
  SAVE_OK LIKE OK_CODE.

*定义内表,注意,两种写法一样
*DATA SP1 LIKE SPFLI OCCURS 0 WITH HEADER LINE.
DATA SP1 LIKE TABLE OF SPFLI WITH HEADER LINE.
*增加内表数据
SELECT * INTO CORRESPONDING FIELDS OF TABLE SP1 FROM SPFLI.

*测试输出数据


*LOOP AT SP1.
*	WRITE: / SP1-CARRID,SP1-CITYFROM.
*ENDLOOP.

*直接调用窗口
CALL SCREEN 100.

*用户交互
MODULE USER_COMMAND_0100 INPUT.
SAVE_OK = OK_CODE.
CLEAR OK_CODE.
*退出按钮时退出程序
CASE SAVE_OK.
WHEN ‘EXIT’.
LEAVE PROGRAM.
ENDCASE.
ENDMODULE.

*定义状态条、包括菜单、工具条按钮、系统按钮等
MODULE STATUS_0100 OUTPUT.
SET PF-STATUS ‘STATUS1’.
ENDMODULE.
