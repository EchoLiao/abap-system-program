report zjjj.
types: begin of tnode,
	key type String,
	text type String,
    end of tnode.
data: begin of ttree,
	lv0 type tnode,
	lv1 type tnode,
	lv2 type tnode,
    end of ttree.
data: tree_tab like table of ttree with header line.
data: tree_lv0, tree_lv1, tree_lv2, tree_lv3 type String,
    str_tree type String.
data: strtab type table of String,
      strtab_tree type table of String,
      strtab_keytext type table of String.
tree_lv0 = 'rt,飞机票订票系统,db,基础数据,scarr,航线信息.' & " 关键字不能长于12个字符!!!!! 
	   'rt,飞机票订票系统,db,基础数据,scounter,售票柜台信息.' &
	   'rt,飞机票订票系统,db,基础数据,spfli,航班信息.' &
	   'rt,飞机票订票系统,db,基础数据,sflight,具体班次信息.' &
	   '' .
tree_lv1 = 'rt,飞机票订票系统,qu,查询,scarr,航线查询.' & 
	   'rt,飞机票订票系统,qu,查询,scounter,售票柜台信息查询.' &
	   'rt,飞机票订票系统,qu,查询,spfli,航班查询.' &
	   'rt,飞机票订票系统,qu,查询,sflight,具体班次信息查询.' &
	   '' .
tree_lv2 = 'rt,飞机票订票系统,hq,行情,leave,去程.' &
	   'rt,飞机票订票系统,hq,行情,back,回程.' &
	   '' .
tree_lv3 = 'rt,飞机票订票系统,ggb,公告板,hkgstjp,航空公司特价票.' &
	   'rt,飞机票订票系统,ggb,公告板,cstjp,城市特价票.' &
	   '' .

split tree_lv0 at '@' into table strtab.
" append tree_lv0 to strtab.

loop at strtab into tree_lv0.
    split tree_lv0 at '.' into table strtab_tree.
    loop at strtab_tree into str_tree.
	" write: / str_tree.
	split str_tree at ',' into table strtab_keytext.
	read table strtab_keytext index 1 into ttree-lv0-key. 
	read table strtab_keytext index 2 into ttree-lv0-text. 
	read table strtab_keytext index 3 into ttree-lv1-key. 
	read table strtab_keytext index 4 into ttree-lv1-text. 
	read table strtab_keytext index 5 into ttree-lv2-key. 
	read table strtab_keytext index 6 into ttree-lv2-text. 
	append ttree to tree_tab.
    endloop.
endloop.



data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
data: wa_container type scrfname value 'TREE',
      wa_containeralv type scrfname value 'ALV',
      wa_custom_container type ref to cl_gui_custom_container,
      wa_custom_containeralv type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree,
      wa_alv  type ref to cl_gui_alv_grid.
data: node_table like table of mtreesnode,
      node1 type mtreesnode.
data wa_spfli type table of ttree with header line.
data wa_sflight type table of sflight.
data: NODEKEY(200) value 'node',
      NODETEXT(200) value 'node'.
class lcl_application definition deferred.
data event_receiver type ref to lcl_application.

*---------------------------------------------------------------------*
*       class lcl_application definition *
*---------------------------------------------------------------------*
class lcl_application definition.
  public section.
    methods handle_node_double_click
        for event node_double_click
        of cl_gui_simple_tree
          importing node_key.
endclass.                    "lcl_application definition
*---------------------------------------------------------------------*
*       class lcl_application implementation *
*---------------------------------------------------------------------*
class lcl_application implementation.
  method handle_node_double_click.
    NODEKEY = node_key.
    read table node_table with key node_key = node_key into node1.
    NODETEXT = node1-text.
    clear wa_sflight.
    select * into table wa_sflight from sflight
        where carrid = node1-node_key+2(2)
          and connid = node1-node_key+4(4).
*    create object wa_alv
*        exporting i_parent = wa_custom_container. 
    call method wa_alv->set_table_for_first_display
      exporting i_structure_name = 'sflight'
      changing  it_outtab        = wa_sflight.
  endmethod.                    "handle_node_double_click
endclass.                    "lcl_application implementation 


data g_application type ref to lcl_application.

start-of-selection.
  " select * into table wa_spfli from tree_tab
    " order by countryfr carrid ascending. 
    " move tree_tab[] to wa_spfli.
  create object g_application. 
  set screen 100.


*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
*  set pf-status 'xxxxxxxx'.
*  set titlebar 'xxx'.
  if wa_custom_container is initial.
    perform create_tree.
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
      leave to screen 0. 
  endcase. 
endmodule.                 " user_command_0100  input


*&---------------------------------------------------------------------*
*&      form  create_tree *       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form create_tree .
  data: events type cntl_simple_events,
        event1 type cntl_simple_event.

  create object wa_custom_container
    exporting container_name = wa_container.
  create object wa_custom_containeralv
    exporting container_name = wa_containeralv.
  create object wa_alv
    exporting i_parent = wa_custom_containeralv. 
  create object wa_tree
    exporting
      parent = wa_custom_container
      node_selection_mode = cl_gui_simple_tree=>node_sel_mode_single.
  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  data: countryfr like ttree-lv0-key, carrid like ttree-lv1-key.
  data: str1(255).

  loop at tree_tab into ttree.
    if countryfr ne ttree-lv0-key.
      clear node1.
      node1-node_key = ttree-lv0-key.
*第一层
      clear node1-relatkey.
      clear node1-relatship.
*是文件夹
      node1-hidden = ''.
      node1-disabled = ''.
      node1-isfolder = 'x'.
*不带icon
      clear node1-n_image.
      clear node1-exp_image.
      clear node1-expander.
      node1-text = ttree-lv0-text.
      append node1 to node_table.
    endif. 

    if ( countryfr ne ttree-lv0-key ) or ( carrid <> ttree-lv1-key ).
      clear node1.
      concatenate ttree-lv0-key ttree-lv1-key into node1-node_key. 
*上层关系
      node1-relatkey = ttree-lv0-key.
      node1-relatship = cl_gui_simple_tree=>relat_last_child.
      node1-hidden = ''.
      node1-disabled = ''.
      node1-isfolder = 'x'.
      clear node1-n_image.
      clear node1-exp_image.
      clear node1-expander.
*节点显示carrid
      node1-text = ttree-lv1-text.
      append node1 to node_table.
    endif. 

    countryfr = ttree-lv0-key. " 意义见 if 语句!!!
    carrid = ttree-lv1-key.
    clear node1.
    concatenate ttree-lv0-key ttree-lv1-key 
	 ttree-lv2-key into node1-node_key.
    concatenate ttree-lv0-key ttree-lv1-key into str1. 
    node1-relatkey = str1.
    node1-relatship = cl_gui_simple_tree=>relat_last_child.
    node1-hidden = ''.
    node1-disabled = ''.
    node1-isfolder = 'x'.
    node1-n_image = '@5B@'.
    node1-exp_image = '@5B@'.
    clear node1-expander.
    node1-text = ttree-lv2-text.
    append node1 to node_table.
  endloop. 

  call method wa_tree->add_nodes
      exporting
        table_structure_name      = 'mtreesnode'
        node_table                = node_table
*    exceptions
*      error_in_node_table             = 1
*      failed                          = 2
*      dp_errof                        = 3
*      table_structure_name_not_found  = 4
*      others                          = 5
.
  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

*定义双击事件
  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'.
  append event1 to events.

  call method wa_tree->set_registered_events
    exporting events  = events
*    exceptions
*      cntl_error                = 1
*      cntl_system_error         = 2
*      illegal_event_combination = 3
*      others                    = 4
    .

  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

*将已定义的双击事件分配至树对象
  set handler g_application->handle_node_double_click for wa_tree.
endform.                    " create_tree
