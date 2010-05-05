report z_j_8_6.
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
tables spfli.
data ls_spfli type spfli.
data wa_spfli type table of spfli.
data wadel_spfli type table of spfli.
select * into table wa_spfli from spfli. 

data: wa_container type scrfname value 'ALVDATA',
      alv_grid type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.
data wa_layout type lvc_s_layo.
wa_layout-edit = 'x'.
class lcl_event_receiver definition deferred.
data event_receiver type ref to lcl_event_receiver.

*---------------------------------------------------------------------*
*       class lcl_event_receiver definition *
*---------------------------------------------------------------------*
class lcl_event_receiver definition.
  public section.
    types: del_rows type standard table of spfli.
    data: ddel_rows type standard table of spfli.
    methods:
    handle_data_changed
      for event data_changed of cl_gui_alv_grid " Book: P199 
        importing er_data_changed.
    methods:
    update_delta_tables
      importing
        pr_data_changed type ref to cl_alv_changed_data_protocol.
    methods:
    get_deleted_rows 
      exporting deleted_rows type del_rows.
endclass.                    "lcl_event_receiver definition
*---------------------------------------------------------------------*
*       class lcl_event_receiver implementation *
*---------------------------------------------------------------------*
class lcl_event_receiver implementation. 
  method handle_data_changed.
    call method update_delta_tables( er_data_changed ).
  endmethod.                    "handle_data_changed
  method update_delta_tables.
    data: l_del_row type lvc_s_moce.
    loop at pr_data_changed->mt_deleted_rows into l_del_row. 
      read table wa_spfli into ls_spfli index l_del_row-row_id.
      if sy-subrc ne 0.
        message e208(00) with '处理错误'.
      else.
        append ls_spfli to ddel_rows.
      endif.
    endloop.
  endmethod.                    "update_delta_tables
  method get_deleted_rows.
    deleted_rows = me->ddel_rows.
  endmethod.                    "get_deleted_rows
endclass.                    "lcl_event_receiver definition


start-of-selection.
  call screen 100.
  write / '删除的内表记录'.
  write / '______________'.
  call method event_receiver->get_deleted_rows
    importing deleted_rows = wadel_spfli.
  loop at wadel_spfli into spfli.
    write: / spfli-carrid,spfli-connid,spfli-cityfrom.
  endloop. 

  write: /.
  write: /.
  write: / '更新后的内表记录：'.
  write: / '__________________'.
  loop at wa_spfli into spfli. 
    write : / spfli-carrid,spfli-connid,spfli-cityfrom.
  endloop. 
*when 'save'.
*  modify spfli form table wa_spfli.
*
*  if sy-subrc ne 0. 
*    message i005(ymess) with '更新数据错误！'.
*    exit. 
*  else.
*    message i005(ymess) with '更新数据ok！'.
*  endif.
*  delete spfli from table dela_spfli.
*  if sy-subrc ne 0. 
*    message i005(ymess) with '更新数据错误！'.
*  else.
*    message i005(ymess) with '更新数据ok！'.
*  endif.
end-of-selection.


*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
  " set pf-status 'status1'.
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.

    create object event_receiver.
    set handler event_receiver->handle_data_changed for alv_grid.

    call method alv_grid->set_table_for_first_display
      exporting
        i_structure_name = 'spfli'
        is_layout        = wa_layout
      changing
        it_outtab        = wa_spfli.
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
      data l_ret value 'x'.
      call method alv_grid->check_changed_data
        importing e_valid = l_ret.
      leave to screen 0.
  endcase. 
endmodule.                              " user_command_0100  input
