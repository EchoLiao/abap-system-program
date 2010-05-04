report z_j_8_4.
" 8.4	自定义 ALV 控件的工具条按钮
include <icon>.
class lcl_event_receiver definition deferred.
data: OK_CODE type sy-ucomm,
      save_ok type sy-ucomm.
data event_receiver type ref to lcl_event_receiver.
data: wa_spfli type table of spfli,
      a_spfli like spfli.
select * into table wa_spfli from spfli. 
data: wa_container type scrfname value 'ALVDATA',
      alv_grid type ref to cl_gui_alv_grid,
      wa_custom_container type ref to cl_gui_custom_container.

call screen 100.

*---------------------------------------------------------------------*
*       class lcl_event_receiver definition
*---------------------------------------------------------------------*
class lcl_event_receiver definition.
  public section.
    methods:
      handle_toolbar 
        for event toolbar of cl_gui_alv_grid
         importing e_object e_interactive,
      handle_user_command
        for event user_command of cl_gui_alv_grid
          importing e_ucomm.
endclass.                    "lcl_event_receiver definition
*---------------------------------------------------------------------*
*       class lcl_event_receiver implementation
*---------------------------------------------------------------------*
class lcl_event_receiver implementation. 
  method handle_toolbar.
    data: ls_toolbar type stb_button.
    clear ls_toolbar-butn_type.
    append ls_toolbar to e_object->mt_toolbar.
    clear ls_toolbar.
    move 'show_deta' to ls_toolbar-function. " 标志 
    move icon_ppe_vnode to ls_toolbar-icon.
    move '航班明细显示' to ls_toolbar-quickinfo.
    move 'fli show'(112) to ls_toolbar-text.
    move '' to ls_toolbar-disabled. " 空为可用状态
    append ls_toolbar to e_object->mt_toolbar.
  endmethod.                    "handle_toolbar
  method handle_user_command.
    data: lt_rows type lvc_t_row.
    case e_ucomm.
      when 'show_deta'.
        call method alv_grid->get_selected_rows
          importing et_index_rows = lt_rows.
        call method cl_gui_cfw=>flush.
        if sy-subrc = 0.
          " message s005(ymess) with ':  已选择行!'.
          message i005(ymess) with ':  已选择行!'.
          perform messdeta tables lt_rows.
        endif.
    endcase.
  endmethod.                    "handle_user_command
endclass.                    "lcl_event_receiver implementation


*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
  " set pf-status 'status1'. " ????? 
  if wa_custom_container is initial.
    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
        exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting i_structure_name = 'spfli'
      changing it_outtab        = wa_spfli.
    create object event_receiver.
    set handler event_receiver->handle_user_command for alv_grid.
    set handler event_receiver->handle_toolbar for alv_grid. 
    call method alv_grid->set_toolbar_interactive. 
  endif.
endmodule.                 " status_0100  output


*&---------------------------------------------------------------------*
*&      module  user_command_0100  input *       text
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = OK_CODE. 
  clear OK_CODE.
  case save_ok.
    when 'EXIT'.
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input


*&---------------------------------------------------------------------*
*&      form  messdeta *       text
*----------------------------------------------------------------------*
*      -->p_lt_rows  text
*----------------------------------------------------------------------*
form messdeta  tables   p_et_index_rows structure lvc_s_row. 
  "insert correct name for <...>.
  data: ls_selected_line like lvc_s_row, 
        lf_row_index type lvc_index.
  data: s1(200) type c,
        s2(3) type c.
  s2 = '--'.
  loop at p_et_index_rows into ls_selected_line.
    lf_row_index = ls_selected_line-index.
    read table wa_spfli index lf_row_index into a_spfli.
    s1 = '选择行内容'.
    concatenate s1 a_spfli-connid a_spfli-carrid a_spfli-cityfrom
                into s1 separated by s2. 
    message i005(ymess) with s1.
  endloop. 
endform.                    " messdeta
