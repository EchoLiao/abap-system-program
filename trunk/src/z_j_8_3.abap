report z_j_8_3.
*�����뷵��ֵ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*�����ڱ�������Ҫ���ݣ�����header line
data wa_spfli type table of yzhhz .
*�ڱ�ֵ
select * into table wa_spfli from yzhhz. 
* ALVDATA ����Ļ100�ж�����ƿؼ������� 
data: wa_container type scrfname value 'ALVDATA',
      alv_grid type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.
*ֱ�ӵ��ô���
call screen 100.

*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
  set pf-status 'status1'.
*������ڻ�û�д���alv�����򴴽���
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting i_structure_name = 'yzhhz' " ���� 
      changing it_outtab        = wa_spfli.
  endif.
endmodule.                 " status_0100  output

*&---------------------------------------------------------------------*
*&      module  user_command_0100  input *       text
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input
