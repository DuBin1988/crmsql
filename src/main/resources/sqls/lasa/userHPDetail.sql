//查询某个用户某个时间点后的抄表记录明细
//username:用户名 lastinputdate:抄表日期,orderitem:需要排序的字段
//return：抄表明细
 select * 
 from t_handplan  
 where  f_username ='{username}' and lastinputdate >'{lastinputdate}'
 order by {orderitem}