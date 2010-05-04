report z_j_8_5.
" 8.5	���� alv ˫���¼�
*�����뷵��ֵ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*�����ڱ�������Ҫ���ݣ�����header line
data wa_spfli type table of spfli.
*�ڱ�ֵ
select * into table wa_spfli from spfli. 
*���崰�ڶ��ƿ���,����alv����
data: wa_container type scrfname value 'ALVDATA',
      alv_grid     type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.
*�����¼�����
class lcl_event_receiver definition deferred.
*�����¼�
data event_receiver type ref to lcl_event_receiver.
*ֱ�ӵ��ô���
call screen 100.

*---------------------------------------------------------------------*
*       class lcl_event_receiver definition * �����¼������Ժͷ���
*---------------------------------------------------------------------*
class lcl_event_receiver definition.
  public section.
    methods:
    handle_double_click
      for event double_click of cl_gui_alv_grid
        importing e_row e_column.
endclass.                    "lcl_event_receiver definition
*---------------------------------------------------------------------*
*       class lcl_event_receiver  implentation
*---------------------------------------------------------------------*
class lcl_event_receiver implementation. 
  method handle_double_click.
    data: li_spfli like line of wa_spfli.
    read table wa_spfli index e_row-index into li_spfli.
*�����е���Ϣ�ϲ����ַ���
    data: s1(100) type c.
    concatenate '��:' e_row-index '����:' e_column-fieldname into s1.
    concatenate s1 'connid:' li_spfli-connid into s1.
    concatenate s1 'carrid:' li_spfli-carrid into s1.
*��״̬����ʾ��������������Ϣ 
    message s208(00) with s1.
  endmethod.                    "handle_double_click
endclass.                    "lcl_event_receiver  implentation


*&---------------------------------------------------------------------*
*&      module  status_0100  output
*&---------------------------------------------------------------------*
* ����״̬���������˵�����������ť��ϵͳ��ť��
*----------------------------------------------------------------------*
module status_0100 output.
  " set pf-status 'status1'. " ????? 
*������ڻ�û�д���alv�����򴴽���
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting
        i_structure_name = 'spfli'
      changing
        it_outtab        = wa_spfli.
*alv�������˫���¼� 
    create object event_receiver.
    set handler event_receiver->handle_double_click for alv_grid.
  endif.
endmodule.                 " status_0100  output


*&---------------------------------------------------------------------*
*&      module  user_command_0100  input 
*&---------------------------------------------------------------------*
* �û����� 
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input
