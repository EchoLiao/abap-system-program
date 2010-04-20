* 4.7.2	使用 package size 读取数据

* 在例 4.1 中，使用了 up to 5 rows	语法读取前 5 行，但是不能继续读取数据。
* 使用 package size 可以一次读入几条记录，注意例 4.2 中有 endselect 语句，表
* 示读取 5 条记录后接着读取 5 条记录。
* 【例 4.2】

report z_j_4_2.
*定义内表有header line
data wa_spfli type table of ytcity with header line.

*以每次读取5条记录, 直到读取所有数据
select * into table wa_spfli from ytcity package size 3. " @@@@@
    " *输出内表记录
    loop at wa_spfli.
        write: / wa_spfli-yct_id, wa_spfli-yct_name.
    endloop. 
    " *输出3条后输出一条横线
    uline.
endselect. 
