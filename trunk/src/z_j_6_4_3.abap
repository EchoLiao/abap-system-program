report  z_j_6_4_3.

* �����뷵��ֵ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*ʹ�ú����
tables ytcity.
*ֱ�ӵ��ô���


call screen 100.

module cancel input. 
  leave program.
endmodule.                    "cancel input

 
*&---------------------------------------------------------------------*
*&      module  status_0120  output
*&---------------------------------------------------------------------*
* ����״̬���������˵�����������ť��ϵͳ��ť��
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'STATUS1'.
endmodule.                 " status_0120  output


*&---------------------------------------------------------------------*
*&      module  user_command_0120  input 
*&---------------------------------------------------------------------*
* �������ֶλ򵥻���ť�¼�����
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 

*��select���ݸ���ytcity��¼��ytcity��¼������Ļ�ֶ� 
  select single *
    into corresponding fields of ytcity " screen_table 
    from ytcity
    where yct_id = ytcity-yct_id.
      if sy-subrc ne 0. " ????? 
        clear ytcity.
      endif.
endmodule.                 " user_command_0120  input
