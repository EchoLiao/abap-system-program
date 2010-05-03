report z_j_9_2.
" 9.2	建立有数据表接口的 Tree Control 对象
*功能码返回值
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*定制对象

data: wa_container type scrfname value 'TREE', "客户对象
      wa_custom_container type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree.
data: node_table like table of mtreesnode, "node 节点表
      node1 type mtreesnode.  "节点
data wa_spfli type table of yzhhz with header line.
data: nodekey(200) value 'nodekey', " 变量名必须与控件同名!!!!! 
		nodetext(200) value 'nodetext'.
class lcl_application definition deferred. "  

*---------------------------------------------------------------------*
*  对象定义
*---------------------------------------------------------------------*
class lcl_application definition.
  public section.
*自定义双击方法, 参数为节点关键字
    methods handle_node_double_click
        for event node_double_click
        of cl_gui_simple_tree
        importing node_key.
endclass.                    " 
*---------------------------------------------------------------------*
*  对象方法实现
*---------------------------------------------------------------------*
class lcl_application implementation.
  method handle_node_double_click.
    nodekey = node_key.
*从节点内表中按关键字读取单个节点
    read table node_table with key node_key = node_key    into node1.
    nodetext = node1-text.  "将节点文本在窗口中显示
  endmethod.                    "handle_node_double_click
endclass.                    "lcl_application implementation 

start-of-selection.
  select * into table wa_spfli from yzhhz
      order by id cha note ascending. " 按字段排序

data: g_application type ref to lcl_application.
start-of-selection.
		create object g_application. 

set screen 100. " ?????

*&---------------------------------------------------------------------*
*&      mODULE  status_0100  output *       TEXT
*----------------------------------------------------------------------*
module status_0100 output.
*  set pf-status 'status1'.
*  clear wa_custom_container.
  if wa_custom_container is initial.
    perform create_tree.
  endif.
endmodule.                 " status_0100  output

*&---------------------------------------------------------------------*
*&      mODULE  user_command_0100  input * 用户交互
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code.
  clear ok_code.
  case save_ok.
    when 'EXIT'.
      " leave program. 
      leave to screen 0.
  endcase.
endmodule.                 " user_command_0100  input


*&---------------------------------------------------------------------*
*&      fORM  create_tree *    创建树及子节点
*----------------------------------------------------------------------*
*  -->  P1        TEXT
*  <--  P2        TEXT
*----------------------------------------------------------------------*
form create_tree . " 到endform
  data: events type cntl_simple_events,
        event1 type cntl_simple_event.
*建立定制控制对象
  create object wa_custom_container
    exporting
    container_name = wa_container.
*建立树对象
  create object wa_tree
    exporting
*    lifetime            =
    parent               = wa_custom_container
*    shellsyle           =
    node_selection_mode  = cl_gui_simple_tree=>node_sel_mode_single
*    hide_selection      =
*    name                =
*    exceptions
*    lifetime_error              = 1
*    cntl_system_error           = 2
*    create_error                = 3
*    failed                      = 4
*    illegal_noce_selection_mode = 5
*    others  = 6
.

  if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  data: countryfr like yzhhz-id,
        carrid like yzhhz-cha.
  data: str1(255).

  loop at wa_spfli.
    if countryfr ne wa_spfli-id. " if的作用见Figure 1.
      clear node1.
      node1-node_key = wa_spfli-id.
*第一层 !!!!!
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
      node1-text = wa_spfli-id.
      append node1 to node_table.
    endif.

		if ( countryfr ne wa_spfli-id ) or " if的作用见Figure 1
				( carrid <> wa_spfli-cha ).
      clear node1.
      concatenate wa_spfli-id wa_spfli-cha " 构建关键字, 关键字都不能相同
          into node1-node_key.
*上层关系
      node1-relatkey = wa_spfli-id.
      node1-relatship = cl_gui_simple_tree=>relat_last_child.
      node1-hidden = ''.
      node1-disabled = ''.
      node1-isfolder = 'x'.
      clear node1-n_image.
      clear node1-exp_image.
      clear node1-expander.
*节点显示carrid
      node1-text = wa_spfli-cha.
      append node1 to node_table.
    endif.

    countryfr = wa_spfli-id.
    carrid = wa_spfli-cha.
    clear node1.
    concatenate wa_spfli-id wa_spfli-cha wa_spfli-note into
				node1-node_key. " nodekey的最大长度为12, 超过将被截断 
    concatenate wa_spfli-id wa_spfli-cha into str1.
    node1-relatkey = str1.
    node1-relatship = cl_gui_simple_tree=>relat_last_child.
    node1-hidden = ''.
    node1-disabled = ''.
    node1-isfolder = 'x'.
    node1-n_image = '@5B@'.
    node1-exp_image = '@5B@'.
    clear node1-expander.
    concatenate wa_spfli-cha ':' wa_spfli-note
        into str1.
    node1-text = str1.
    append node1 to node_table.
  endloop.

*按照节点内容添加节点
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

  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'. " ????? 
  append event1 to events.
*添加事件内表
  call method wa_tree->set_registered_events
    exporting
      events  = events.

*将已定义的双击事件分配至树对象
  set handler g_application->handle_node_double_click for wa_tree.
endform.                    " create_tree


" 01 a x      01                   01                                     
" 01 a y        01a                  01a                                 
" 01 b x	==>     01ax                 01ax                                    
" 01 b y	        01ay    而不是=> 01                                                   
"               01b                  01a                                       
"                 01bx                 01ay                                    
"                 01y              01                                          
"                                    01b                                       
"                                      01bx                                    
"                                  01                                          
"                                    01b                                       
"                                      01by                                    
"				Figure 1:
