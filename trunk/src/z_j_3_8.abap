* 格式化输出
* ?????
report  ytest001.
data:    wa like spfli.
write: /.
write: 10'航班承运人',40'航班连接',60'国家代码',80'起飞城市',100'起飞机场'.

select * into wa from spfli.
  write: / wa-carrid under '航班承运人',
           wa-connid under '航班连接',
           wa-countryfr under '国家代码',
           wa-cityfrom under '起飞城市',
           wa-airpfrom under '起飞机场'.
endselect.
