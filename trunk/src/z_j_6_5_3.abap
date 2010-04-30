report z_j_6_5_3.

*�����뷵��ֵ
data: OK_CODE type sy-ucomm,
      SAVE_OK type sy-ucomm.
*���������ֶα���
data: FLD1(20) type c,
      FLD2(20) type c,
      FLD3(20) type c value '3',
      FLD4(20) type c,
      ACTION(50) type c.


*ֱ�ӵ��ô���
call screen 100.


*&---------------------------------------------------------------------*
*&      module  cancel  input
*&---------------------------------------------------------------------*
* cancel module ����Ļ�߼�����Ӧ���˳�����
*----------------------------------------------------------------------*
module cancel input. 
  leave program.
endmodule.                 " cancel  input


*&---------------------------------------------------------------------*
*&      module  status_0100  output
*&---------------------------------------------------------------------*
* ����״̬���������˵�����������ť��ϵͳ��ť��
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'status1'.
endmodule.                 " status_0100  output



*&---------------------------------------------------------------------*
*&      module  user_command_0100  input 
*&---------------------------------------------------------------------*
* �����ִ��PAI����FLD1��FLD2��FLD3��FLD4�ϲ���ACTION�����ֶ�
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
* ����FLD1��FLD2 ʱ���
*----------------------------------------------------------------------*
MODULE CHECK1 INPUT. 
*������FLD1 = 'FLD1' ʱ��ʾ����,���Ҳ�ִ��PAI
  IF FLD1 = 'FLD1'.
    MESSAGE E005(YMESS) WITH 'FLD1 ERROR'. " ACTION ���ᱻ���� 
  ENDIF.
  IF FLD2 = 'FLD2'.
    MESSAGE E005(YMESS) WITH 'FLD2 ERROR'.
  ENDIF.
*������FLD1 = 'FLD11' ʱ����������ʾ,ִ��PAI
  IF FLD1 = 'FLD11'. 
    MESSAGE I005(YMESS) WITH 'FLD1 WARNING'.
  ENDIF.
*������FLD1 = 'FLD111' ʱ����ɹ���Ϣ,ִ��PAI
  IF FLD1 = 'FLD111'.
    MESSAGE S005(YMESS) WITH 'FLD1 OK'.
  ENDIF.
ENDMODULE.                 " CHECK1  INPUT


*&---------------------------------------------------------------------*
*&      Module  CHECK2  INPUT
*&---------------------------------------------------------------------*
* ����FLD3��FLD4 ʱ���
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
*��FLD2��һ���ַ���'*'ʱ,ִ�и�MODULE,������Ϣ��ʾ
*----------------------------------------------------------------------*
MODULE CHECK3 INPUT. 
  MESSAGE I005(YMESS) WITH 'FLD2 * WARNING'. " ????? 
ENDMODULE.                 " CHECK3  INPUT
"
