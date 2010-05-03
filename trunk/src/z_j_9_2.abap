report z_j_9_2.
" 9.2	���������ݱ�ӿڵ� Tree Control ����
*�����뷵��ֵ
data: ok_code type sy-ucomm,
      save_ok type sy-ucomm.
*���ƶ���

data: wa_container type scrfname value 'TREE', "�ͻ�����
      wa_custom_container type ref to cl_gui_custom_container,
      wa_tree type ref to cl_gui_simple_tree.
data: node_table like table of mtreesnode, "node �ڵ��
      node1 type mtreesnode.  "�ڵ�
data wa_spfli type table of yzhhz with header line.
data: nodekey(200) value 'nodekey', " ������������ؼ�ͬ��!!!!! 
		nodetext(200) value 'nodetext'.
class lcl_application definition deferred. "  

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

start-of-selection.
  select * into table wa_spfli from yzhhz
      order by id cha note ascending. " ���ֶ�����

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
*&      mODULE  user_command_0100  input * �û�����
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
*&      fORM  create_tree *    ���������ӽڵ�
*----------------------------------------------------------------------*
*  -->  P1        TEXT
*  <--  P2        TEXT
*----------------------------------------------------------------------*
form create_tree . " ��endform
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

  data: countryfr like yzhhz-id,
        carrid like yzhhz-cha.
  data: str1(255).

  loop at wa_spfli.
    if countryfr ne wa_spfli-id. " if�����ü�Figure 1.
      clear node1.
      node1-node_key = wa_spfli-id.
*��һ�� !!!!!
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
      node1-text = wa_spfli-id.
      append node1 to node_table.
    endif.

		if ( countryfr ne wa_spfli-id ) or " if�����ü�Figure 1
				( carrid <> wa_spfli-cha ).
      clear node1.
      concatenate wa_spfli-id wa_spfli-cha " �����ؼ���, �ؼ��ֶ�������ͬ
          into node1-node_key.
*�ϲ��ϵ
      node1-relatkey = wa_spfli-id.
      node1-relatship = cl_gui_simple_tree=>relat_last_child.
      node1-hidden = ''.
      node1-disabled = ''.
      node1-isfolder = 'x'.
      clear node1-n_image.
      clear node1-exp_image.
      clear node1-expander.
*�ڵ���ʾcarrid
      node1-text = wa_spfli-cha.
      append node1 to node_table.
    endif.

    countryfr = wa_spfli-id.
    carrid = wa_spfli-cha.
    clear node1.
    concatenate wa_spfli-id wa_spfli-cha wa_spfli-note into
				node1-node_key. " nodekey����󳤶�Ϊ12, ���������ض� 
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

  event1-eventid = cl_gui_simple_tree=>eventid_node_double_click.
  event1-appl_event = 'x'. " ????? 
  append event1 to events.
*����¼��ڱ�
  call method wa_tree->set_registered_events
    exporting
      events  = events.

*���Ѷ����˫���¼�������������
  set handler g_application->handle_node_double_click for wa_tree.
endform.                    " create_tree


" 01 a x      01                   01                                     
" 01 a y        01a                  01a                                 
" 01 b x	==>     01ax                 01ax                                    
" 01 b y	        01ay    ������=> 01                                                   
"               01b                  01a                                       
"                 01bx                 01ay                                    
"                 01y              01                                          
"                                    01b                                       
"                                      01bx                                    
"                                  01                                          
"                                    01b                                       
"                                      01by                                    
"				Figure 1:
