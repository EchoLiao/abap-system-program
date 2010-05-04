report z_j_8_7.
" 8.7 ALV Tree µÄÊ¹ÓÃ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
data: gb_fieldcat type lvc_t_fcat.
data: gb_sortfld type lvc_t_sort.
data wa_spfli type table of spfli.
select * into table wa_spfli from spfli. 

data: wa_container type scrfname value 'ALVDATA',
      alv_grid type ref to cl_gui_alv_tree_simple, 
      wa_custom_container type ref to cl_gui_custom_container.

call screen 100.


*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
  " set pf-status 'status1'.
  if wa_custom_container is initial.
    data ls_list_comm type slis_t_listheader.
    data ls_alist_comm type slis_listheader.
    ls_alist_comm-typ = 'H'.
    ls_alist_comm-info = 'my alv tree testing'.
    append ls_alist_comm to ls_list_comm.

    perform bldcat.
    perform bldsortfld.

    create object wa_custom_container
      exporting container_name = wa_container.
    create object alv_grid
      exporting i_parent = wa_custom_container.
    call method alv_grid->set_table_for_first_display
      exporting
        it_list_commentary = ls_list_comm
        i_structure_name   = 'spfli'
      changing
        it_sort            = gb_sortfld
        it_fieldcatalog    = gb_fieldcat 
        it_outtab          = wa_spfli.
    call method alv_grid->expand_tree
      exporting i_level = 1. 
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


*&---------------------------------------------------------------------*
*&      form  bldcat *       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form bldcat .
  call function 'LVC_FIELDCATALOG_MERGE' 
    exporting i_structure_name = 'spfli'
    changing ct_fieldcat      = gb_fieldcat.

  data ls_fldcat type lvc_s_fcat.
  loop at gb_fieldcat into ls_fldcat.
    case LS_FLDCAT-FIELDNAME.
      when 'countryfr' or 'cityfrom' or 'countryto'
           or 'cityto' or 'distance'.
        ls_fldcat-outputlen = 15.
      when others.
        ls_fldcat-no_out = 'x'.
    endcase.
    if ls_fldcat-fieldname = 'distance'. 
      ls_fldcat-do_sum = 'x'.
    endif. 
    modify gb_fieldcat from ls_fldcat.
  endloop. 
endform.                    " bldcat
 
 
*&---------------------------------------------------------------------*
*&      form  bldsortfld *       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form bldsortfld .
  data ls_sortfld type lvc_s_sort.
  ls_sortfld-spos = 1.
  ls_sortfld-fieldname = 'countryfr'.
  ls_sortfld-up = 'x'.
  ls_sortfld-subtot = 'x'.
  append ls_sortfld to gb_sortfld.

  ls_sortfld-spos = 2.
  ls_sortfld-fieldname = 'carrid'.
  ls_sortfld-up = 'x'.
  ls_sortfld-subtot = 'x'.
  append ls_sortfld to gb_sortfld.

  ls_sortfld-spos = 3.
  ls_sortfld-fieldname = 'connid'.
  ls_sortfld-up = 'x'.
  ls_sortfld-subtot = 'x'.
  append ls_sortfld to gb_sortfld.
endform.                    " bldsortfld 
