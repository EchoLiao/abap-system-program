report  ytest002.

start-of-selection.
*������ʹ�õ�״̬��
  set pf-status 'sta1'.
  write: 'test tool bar'.

at user-command.
*��������ťʱ���
  case sy-ucomm.
    when 'ownsel'.
      write: 'had selected!'.
  endcase.
