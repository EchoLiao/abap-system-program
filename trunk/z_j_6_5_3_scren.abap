" REPORT Z_J_6_5_3_SCREN.

PROCESS BEFORE OUTPUT.
  MODULE STATUS_0100.


*���FLD1��FLD2
PROCESS AFTER INPUT. 
  CHAIN.                    " �����ֶ� 
    FIELD: FLD1,FLD2.
    MODULE CHECK1.
  ENDCHAIN.
*���FLD3��FLD4
  CHAIN.
    FIELD: FLD3,FLD4.
    MODULE CHECK2.
  ENDCHAIN.
*��FLD2�����ַ���*ʱִ��CHECK3���
  FIELD FLD2 MODULE CHECK3 ON *-INPUT. " ��ʾ�û������ֶ���������'*',
                                       " ���������ֶ�����Ϊ*ENTRYʱ, MODULE��Ч


  MODULE CANCEL AT EXIT-COMMAND.
  MODULE USER_COMMAND_0100.



" " FIELD FLD2 MODULE CHECK3  " �����ֶμ�� 

" " FIELD FLD2 MODULE CHECK3  " �����ֶζ��MODULE��� 
                  " " CHECK1  

" " FIELD <FLD1> MODLE <MDL1> ON INPUT. " ���ǳ�ʼֵ���
                                      " " ON INPUT ��ʾ�ǳ�ʼֵ�ı�ʱִ��.
" " AND SO ON.  6.5.2   28
