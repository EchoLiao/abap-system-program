report  z_j_5_7.

start-of-selection.
*������ʹ�õ�״̬��
  set pf-status 'sta1'.
  write: 'testting tool bar'.

at user-command.
*��������ťʱ���
  case sy-ucomm.
    when 'ownsel'.
      if sy-lsind = 1.
        set pf-status 'sta6'.
*�����Ӵ��ڲ����
        window starting at 10 10 ending at 30 20.
        write 'out put in the subwindow'.
        write: 'place note!'.
      endif.
  endcase.
