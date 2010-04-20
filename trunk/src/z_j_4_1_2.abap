report z_j_4_1_2.
* 例 4.1 将介绍数据库读取的几种方法和步骤：
* （1）从数据表直接读取数据至工作区输出；
* （2）从数据表读取数据至内表，再从内表输出；
* （3）从内表逐行读取数据数据至工作区，从工作区输出。
* 【例 4.1】

*定义工作区
data a_spfli type ytschool.
*定义内表，请注意有header line
data ta_spfli type table of ytschool with header line.

uline.  write / 'use workspace'.  uline.
*将数据表逐行转移至工作区，只读首3行
select * into corresponding fields of a_spfli from ytschool up to 33 rows. " @@@@@
    write: / a_spfli-yct_id, a_spfli-ysh_id, a_spfli-ysh_name, a_spfli-ysh_add.
endselect. 

uline.  write / 'use inner table'.  uline.
select * into corresponding fields of table ta_spfli from ytschool up to 3 rows.
*从数据表读数据至内表，直接从内表输出
*如果ta_spfli没有定义header line, 会出错 
loop at ta_spfli. "  
    write: / a_spfli-yct_id, a_spfli-ysh_id, a_spfli-ysh_name, a_spfli-ysh_add.
endloop.

uline.  write / 'move data from inner to workspace'.  uline.
loop at ta_spfli into a_spfli. 
    write: / a_spfli-yct_id, a_spfli-ysh_id, a_spfli-ysh_name, a_spfli-ysh_add.
endloop. 
