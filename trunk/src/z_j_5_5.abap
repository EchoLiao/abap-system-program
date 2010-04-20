report z_j_5_5.
" 在双击输出行时输出第二页
" 【5.5】
start-of-selection.
  write: 'initialize,sy-lsind =',sy-lsind. 

at line-selection.
  if sy-lsind = 1.
    write: '2nd col,sy-lsind =',sy-lsind.
  endif.
