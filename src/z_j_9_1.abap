report  z_j_9_1.
*�����뷵��ֵ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*���ƶ���
data: wa_container type scrfname value 'TREE', "�ͻ����� "tree����Ϊ��д
      wa_custom_container type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree.
data: node_table like table of mtreesnode, "node �ڵ��
      node1 type mtreesnode.  " �ڵ�

" *�����ڱ�, ������Ҫ����, ����header line
" data wa_spfli type table of spfli.

*��˫��ʱȡ�ýڵ�keyֵ��ڵ��ı�ֵ���� 
data: nodekey(200) value 'nodekey', " ������������ؼ�ͬ��!!!!! 
	nodetext(200) value 'nodetext'.
*�������, ��������˫������, ���ڽ��ö���˫���������䵽��˫���¼�
class lcl_application definition deferred. " ��ҪҲ�ǿ��Ե�. 

*---------------------------------------------------------------------*
*  ������
*---------------------------------------------------------------------*
class lcl_application definition.
  public section.
*�Զ���˫������, ����Ϊ�ڵ�ؼ���
    methods handle_node_double_click
        for event node_double_click
        of cl_gui_simple_tree
        importing node_key.
endclass.                    " 
*---------------------------------------------------------------------*
*  ���󷽷�ʵ��
*---------------------------------------------------------------------*
class lcl_application implementation.
  method handle_node_double_click.
    nodekey = node_key.
*�ӽڵ��ڱ��а��ؼ��ֶ�ȡ�����ڵ�
    read table node_table with key node_key = node_key    into node1.
    nodetext = node1-text.  "���ڵ��ı��ڴ�������ʾ
  endmethod.                    "handle_node_double_click
endclass.                    "lcl_application implementation 

*�Զ��嶨�����ʵ�� 
data: g_application type ref to lcl_application.
start-of-selection.
	create object g_application. 

* ֱ�ӵ��ô���, �ڴ���pbo����˫������
call screen 100.

*&---------------------------------------------------------------------*
" ��ģ�����û��, ��Ϊ�� when 'EXIT' ��� 
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
*&      module  user_command_0100  input * �û����� 
*----------------------------------------------------------------------*
module user_command_0100 input.
  save_ok = ok_code. 
  clear ok_code.
  case save_ok.
    when 'EXIT'. " EXIT����Ϊ��д 
      leave program. 
  endcase. 
endmodule.                 " user_command_0100  input

*&---------------------------------------------------------------------*
*&      form  create_tree *    ���������ӽڵ� 
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form create_tree.
*�¼��ڱ������¼�����
  data: events type cntl_simple_events,
        event1 type cntl_simple_event.

*�������ƿ��ƶ���
  create object wa_custom_container
    exporting
      container_name = wa_container.
*����������
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

*��ʼ�����Թ���-> ����->���� ���� ���� 
  clear node1.
*�ڵ�ؼ���
  node1-node_key = 'country'.
*��һ��
  clear node1-relatkey.
  clear node1-relatship.
*���ļ���
  node1-hidden = ''. 
  node1-disabled = ''.
  node1-isfolder = 'x'.
*����icon
  clear node1-n_image.
  clear node1-exp_image.
  clear node1-expander.
  node1-text = 'china'.
  append node1 to node_table.

*����ڵ�
  clear node1.
  node1-node_key = 'city-peking'. 
  " node1-node_key = 'country'. " ����!!!!! ����node�Ĺؼ��ֶ���������ͬ
*�ϲ��ϵ
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
*ͼ��, ������showicon����
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

*���սڵ�������ӽڵ�
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

*����˫���¼�
  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'.
  append event1 to events.
*����¼��ڱ�
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

*���Ѷ����˫���¼�������������
  set handler g_application->handle_node_double_click for wa_tree.
endform.                    " create_tree
