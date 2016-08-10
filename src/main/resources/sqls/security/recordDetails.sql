//查询安检记录详情
//condition:查询条件
//return:重复的取最新的一条安检记录  

 select * FROM (select * from T_INSPECTION where {condition}  ) i
 join 
 (select MAX(id) ids,F_CONSUMERNAME name from T_INSPECTION group by F_CONSUMERNAME,id) n 
 on  n.name = i.F_CONSUMERNAME and i.id=n.ids
 order by id
