" REPORT Z_J_6_5_3_SCREN.

PROCESS BEFORE OUTPUT.
  MODULE STATUS_0100.


*检查FLD1、FLD2
PROCESS AFTER INPUT. 
  CHAIN.                    " 检查多字段 
    FIELD: FLD1,FLD2.
    MODULE CHECK1.
  ENDCHAIN.
*检查FLD3、FLD4
  CHAIN.
    FIELD: FLD3,FLD4.
    MODULE CHECK2.
  ENDCHAIN.
*当FLD2的首字符是*时执行CHECK3检查
  FIELD FLD2 MODULE CHECK3 ON *-INPUT. " 表示用户输入字段首字输入'*',
                                       " 并且输入字段属性为*ENTRY时, MODULE无效


  MODULE CANCEL AT EXIT-COMMAND.
  MODULE USER_COMMAND_0100.



" " FIELD FLD2 MODULE CHECK3  " 单个字段检查 

" " FIELD FLD2 MODULE CHECK3  " 单个字段多个MODULE检查 
                  " " CHECK1  

" " FIELD <FLD1> MODLE <MDL1> ON INPUT. " 不是初始值检查
                                      " " ON INPUT 表示是初始值改变时执行.
" " AND SO ON.  6.5.2   28
