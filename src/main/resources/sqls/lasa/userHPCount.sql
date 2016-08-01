//查询某个用户某个时间点后的抄表记录 汇总
//username:用户名 lastinputdate:抄表日期
//return：抄表汇总
 select COUNT(*) c 
 from t_handplan h
 where  f_username ='{username}' and lastinputdate >'{lastinputdate }' 