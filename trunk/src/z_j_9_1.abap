report  z_j_9_1.
*功能码返回值
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*定制对象
data: wa_container type scrfname value 'TREE', "客户对象 "tree必须为大写
      wa_custom_container type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree.
data: node_table like table of mtreesnode, "node 节点表
      node1 type mtreesnode.  " 节点

" *定义内表, 变量需要传递, 不加header line
" data wa_spfli type table of spfli.

*当双击时取得节点key值与节点文本值变量 
data: nodekey(200) value 'nodekey', " 变量名必须与控件同名!!!!! 
	nodetext(200) value 'nodetext'.
*定义对象, 定义对象的双击方法, 用于将该对象双击方法分配到树双击事件
class lcl_application definition deferred. " 不要也是可以的. 

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

*自定义定义对象实例 
data: g_application type ref to lcl_application.
start-of-selection.
	create object g_application. 

* 直接调用窗口, 在窗口pbo分配双击对象
call screen 100.

*&---------------------------------------------------------------------*
" 此模块可以没有, 因为见 when 'EXIT' 语句 
" module cancel input. 
  " leave program.
" endmodule.                    "cancel input
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      module  status_0100  output. * text
*----------------------------------------------------------------------*
module status_0100 output.
*  set pf-status 'status1'.
  if wa_custom_container is initial.  " cl_gui_custom_container
    perform create_tree.
  endif.
endmodule.                 " status_0100  output

*&---------------------------------------------------------------------*
*&      module  user_command_0100  input * 用户交互 
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'. " EXIT必须为大写 
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input

*&---------------------------------------------------------------------*
*&      form  create_tree *    创建树及子节点 
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form create_tree.
*事件内表及单个事件对象
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

*开始建立以国家-> 城市->城区 三层 的树 
  clear node1.
*节点关键字
  node1-node_key = 'country'.
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
  node1-text = 'china'.
  append node1 to node_table.

*二层节点
  clear node1.
  node1-node_key = 'city-peking'. 
  " node1-node_key = 'country'. " 错误!!!!! 所有node的关键字都不可以相同
*上层关系
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
*图标, 可运行showicon查阅
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
  node1-exp_image = '@Df@'.
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
  node1-exp_image = '@Nl@'.
  clear node1-expander.
  node1-text = 'mxq'.
  append node1 to node_table.

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

*定义双击事件
  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'.
  append event1 to events.
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
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

*将已定义的双击事件分配至树对象
  set handler g_application->handle_node_double_click for wa_tree.
endform.                    " create_tree
