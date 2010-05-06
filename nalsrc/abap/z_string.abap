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
tree_lv0 = 'root,飞机票订票系统,database,基础数据,scarr,航线信息.' &
	   'root,飞机票订票系统,database,基础数据,scounter,售票柜台信息.' &
	   'root,飞机票订票系统,database,基础数据,spfli,航班信息.' &
	   'root,飞机票订票系统,database,基础数据,sflight,具体班次信息.'.
tree_lv1 = 'rt,飞机票订票系统,qu,查询,scarr,航线查询.' & 
	   'rt,飞机票订票系统,qu,查询,scounter,售票柜台信息查询.' &
	   'rt,飞机票订票系统,qu,查询,spfli,航班查询.' &
	   'rt,飞机票订票系统,qu,查询,sflight,具体班次信息查询.' &
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
