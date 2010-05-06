report z_string.
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
data: tree_lv0 type String,
    tree_lv1 type String,
    str_tree type String.
data: strtab type table of String,
      strtab_tree type table of String,
      strtab_keytext type table of String.
tree_lv0 = 'root,�ɻ�Ʊ��Ʊϵͳ,database,��������,scarr,������Ϣ.' &
	   'root,�ɻ�Ʊ��Ʊϵͳ,database,��������,scounter,��Ʊ��̨��Ϣ.' &
	   'root,�ɻ�Ʊ��Ʊϵͳ,database,��������,spfli,������Ϣ.' &
	   'root,�ɻ�Ʊ��Ʊϵͳ,database,��������,sflight,��������Ϣ.'.
tree_lv1 = 'rt,�ɻ�Ʊ��Ʊϵͳ,qu,��ѯ,scarr,���߲�ѯ.' & 
	   'rt,�ɻ�Ʊ��Ʊϵͳ,qu,��ѯ,scounter,��Ʊ��̨��Ϣ��ѯ.' &
	   'rt,�ɻ�Ʊ��Ʊϵͳ,qu,��ѯ,spfli,�����ѯ.' &
	   'rt,�ɻ�Ʊ��Ʊϵͳ,qu,��ѯ,sflight,��������Ϣ��ѯ.' &
	   '' .
	   
split tree_lv0 at '@' into table strtab.
append tree_lv1 to strtab.


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
	write: ttree-lv0-key.
	write: ttree-lv2-text.
    endloop.
endloop.

loop at tree_tab into ttree.
    write: / ttree-lv2-key, ttree-lv2-text.
endloop.
