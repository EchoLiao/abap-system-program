*---------------------------------------------------------------------*
*---------------------------------------------------------------------*
* Tree, 增删改节点, 双击消息, 右键消息                                      
*---------------------------------------------------------------------*
report z_j_9_3.
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm. " 必须对应屏幕中的
*           " Element list标签中的OK类型的变量名!!!!!
data: wa_container type scrfname value 'TREE', " 变量名tree和控件名对应
      wa_custom_container type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree.
data: node_table like table of mtreesnode,
      anode_table like table of mtreesnode,
      node1 type mtreesnode,
      node2 type mtreesnode.
data wa_spfli type table of spfli.
data: NODEKEY(200) value 'node',
      NODETEXT(200) value 'node',
      NODEKEYOLD(200) value 'node',
      GETKEYTEXT(200).
data menustr(10) value ''.
class lcl_application definition deferred.

*---------------------------------------------------------------------*
*       class lcl_application definition
*---------------------------------------------------------------------*
class lcl_application definition.
  public section.
    methods:
		handle_node_double_click
			for event node_double_click
			of cl_gui_simple_tree
			importing node_key.
    methods:
		handle_node_context_menu_req
			for event node_context_menu_request
			of cl_gui_simple_tree
			importing node_key menu,
		handle_node_context_menu_sel
			for event node_context_menu_select
			of cl_gui_simple_tree
			importing node_key fcode.
endclass.                    "lcl_application definition
*---------------------------------------------------------------------*
*       class lcl_application implementation
*---------------------------------------------------------------------*
class lcl_application implementation.
  method handle_node_double_click.
    NODEKEY = node_key.
    read table node_table with key node_key = node_key into node1.
    NODETEXT = node1-text.
  endmethod.                    "handle_node_double_click

  method handle_node_context_menu_req.
    call method menu->add_function
      exporting
        text  = 'add current level node'
        fcode = 'code1'.
    call method menu->add_function
      exporting
        text  = 'add sub node'
        fcode = 'code2'.
    call method menu->add_function
      exporting
        text  = 'update current node'
        fcode = 'code3'.
    call method menu->add_function
      exporting
        text  = 'delete current node'
        fcode = 'code4'.
  endmethod.                    "handle_node_context_menu_req

  method handle_node_context_menu_sel.
    data str1 type tv_nodekey.
    call method wa_tree->get_selected_node
      importing node_key = str1. "
    if sy-subrc = 0.
      menustr = fcode.
      NODEKEY = str1.
      NODEKEYOLD = str1.
      read table node_table with key node_key = str1 into node1.
      NODETEXT = node1-text.
      if fcode = 'code4'.
        call method wa_tree->delete_node
          exporting
            node_key = node1-node_key.
        delete node_table where node_key = NODEKEY.
      endif.
    endif.
  endmethod.                    "handle_node_context_menu_sel
endclass.                    "lcl_application implementation

*自定义定义对象实例
data: g_application type ref to lcl_application.
start-of-selection.

call screen 100.

*&---------------------------------------------------------------------*
*&      module  status_0100  output *       text
*----------------------------------------------------------------------*
module status_0100 output.
*  set pf-status 'xxxxxxxx'.
*  set titlebar 'xxx'.
  if wa_custom_container is initial.
    create object g_application.
    perform create_tree.
  endif.
endmodule.                 " status_0100  output

*&---------------------------------------------------------------------*
*&      module  user_command_0100  input *       text
*----------------------------------------------------------------------*
module user_command_0100 input.
  data str1 type tv_nodekey.
  save_ok = ok_code.
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      leave program.

    when 'GETKEY'.
      call method wa_tree->get_selected_node
        importing node_key = str1.
      if sy-subrc eq 0.
        GETKEYTEXT = str1.
      endif.

    when 'UPTREE'. " 要与控件名相对应, 还要与fCTcODE相同!!!!!
      " if ( menustr = 'code1' ) or ( menustr = 'code2'). 错误!!!!!
      if ( menustr = 'code1' ) or ( menustr = 'code2' ). " add node
        read table node_table with key node_key = NODEKEY into node1.
        if sy-subrc eq 0. " 显示错误消息, 并中断当前操作.
          message e208(00) with 'multiple-key!'.
        endif.
      endif.
      case menustr.
        when 'code1'. " add current level node
          read table node_table with key node_key = NODEKEYOLD
            into node2.
          clear node1.
          node1-node_key = NODEKEY.
          node1-relatkey = node2-relatkey.
          node1-relatship = cl_gui_simple_tree=>relat_last_child.
          node1-hidden = ''.
          node1-disabled = ''.
          node1-isfolder = 'x'.
          node1-n_image = '@G3@'.
          node1-exp_image = '@G3@'.
          clear node1-expander.
          node1-text = NODETEXT.
          append node1 to node_table.
          clear anode_table.
          append node1 to anode_table.
          call method wa_tree->add_nodes
            exporting
              table_structure_name = 'mtreesnode'
              node_table           = anode_table.
          if  sy-subrc  <>  0.
			  message e208(00) with 'add-current-level-node-failed!'.
          endif.
        when 'code2'. " add sub node
          clear node1.
          node1-node_key = NODEKEY.
          node1-relatkey = NODEKEYOLD.
          node1-relatship = cl_gui_simple_tree=>relat_last_child.
          node1-hidden = ''.
          node1-disabled = ''.
          node1-isfolder = 'x'.
          node1-n_image = '@G3@'.
          node1-exp_image = '@G3@'.
          clear node1-expander.
          node1-text = NODETEXT.
          append node1 to node_table.
          clear anode_table.
          append node1 to anode_table.
          call method wa_tree->add_nodes
            exporting
              table_structure_name = 'mtreesnode'
              node_table           = anode_table.
          if  sy-subrc  <>  0.
			  message e208(00) with 'add-current-level-node-failed!'.
          endif.
        when 'code3'. " update current node
          node1-node_key = NODEKEYOLD.
          call method wa_tree->node_set_text
            exporting
              node_key = node1-node_key
              text     = NODETEXT.
          if  sy-subrc  <>  0.
			  message e208(00) with 'multiple-key!'.
          endif.
      endcase.
  endcase.
endmodule.                 " user_command_0100  input

*&---------------------------------------------------------------------*
*&      form  create_tree *       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form create_tree.
  data: events type cntl_simple_events,
        event1 type cntl_simple_event.
  create object wa_custom_container
    exporting
      container_name = wa_container.
  create object wa_tree
    exporting
      parent = wa_custom_container
      node_selection_mode = cl_gui_simple_tree=>node_sel_mode_single.
  if  sy-subrc  <>  0.
          message e208(00) with 'create-tree-failed!'.
  endif.

  clear node1.
  node1-node_key = 'country'.
  clear node1-relatkey.
  clear node1-relatship.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = 'x'.
  clear node1-n_image.
  clear node1-exp_image.
  clear node1-expander.
  node1-text = 'china'.
  append node1 to node_table.

  clear node1.
  node1-node_key = 'city-peking'.
  node1-relatkey = 'country'.
  node1-relatship = cl_gui_simple_tree=>relat_last_child.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = 'x'.
  clear node1-n_image.
  clear node1-exp_image.
  clear node1-expander.
  node1-text = 'peking'.
  append node1 to node_table.

  clear node1.
  node1-node_key = 'city-shanghai'.
  node1-relatkey = 'country'.
  node1-relatship = cl_gui_simple_tree=>relat_last_child.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = 'x'.
  clear node1-n_image.
  clear node1-exp_image.
  clear node1-expander.
  node1-text = 'shanghai'.
  append node1 to node_table.

  clear node1.
  node1-node_key = 'key-cwq'.
  node1-relatkey = 'city-peking'.
  node1-relatship = cl_gui_simple_tree=>relat_last_child.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = ''.
  node1-n_image = '@9Y@'.
  node1-exp_image = '@9Y@'.
  clear node1-expander.
  node1-text = 'cwq'.
  append node1 to node_table.

  clear node1.
  node1-node_key = 'key-xcq'.
  node1-relatkey = 'city-peking'.
  node1-relatship = cl_gui_simple_tree=>relat_last_child.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = ''.
  node1-n_image = '@DF@'.
  node1-exp_image = '@DF@'.
  clear node1-expander.
  node1-text = 'xcq'.
  append node1 to node_table.

  clear node1.
  node1-node_key = 'key-mxq'.
  node1-relatkey = 'city-shanghai'.
  node1-relatship = cl_gui_simple_tree=>relat_last_child.
  node1-hidden = ''.
  node1-disabled = ''.
  node1-isfolder = ''.
  node1-n_image = '@NL@'.
  node1-exp_image = '@NL@'.
  clear node1-expander.
  node1-text = 'mxq'.
  append node1 to node_table.

*按照节得内容掏加节得
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
	  message e208(00) with 'add-current-level-node-failed!'.
  endif.

  call method wa_tree->expand_node
    exporting
      node_key            = 'country'
      expand_subtree      = 'x'
    exceptions
      failed              = 1
      illegal_level_count = 2
      cntl_system_error   = 3
      node_not_found      = 4
      cannot_expand_leaf  = 5.
  if  sy-subrc  ne  0.
	  message e208(00) with 'add-current-level-node-failed!'.
  endif.

*定义双击事件
  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'.
  append event1 to events.
  event1-eventid = cl_gui_simple_tree=>eventid_node_context_menu_req.
  event1-appl_event = ''.
  append event1 to events.
  call method wa_tree->set_ctx_menu_select_event_appl
    exporting appl_event = 'x'.

*添加事件内表
  call method wa_tree->set_registered_events
    exporting
      events  = events
*    exceptions
*      cntl_error                = 1
*      cntl_system_error         = 2
*      illegal_event_combination = 3
*      others                    = 4
.
  if sy-subrc <> 0.
	  message e208(00) with 'add-current-level-node-failed!'.
  endif.

*将已定义的双击事件分配至树对象
  set handler g_application->handle_node_double_click for wa_tree.
  set handler g_application->handle_node_context_menu_req for wa_tree.
  set handler g_application->handle_node_context_menu_sel for wa_tree.
endform.                    " create_tree
