" report  z_j_9_1_s.
" 逻辑流程序：
*PBO显示屏幕前的处理 
PROCESS BEFORE OUTPUT.
MODULE STATUS_0100. 
*PAI用户输入后的处理 
PROCESS AFTER INPUT. 
MODULE USER_COMMAND_0100.

MODULE USER_COMMAND_0100.
MODULE CANCEL AT EXIT-COMMAND.
